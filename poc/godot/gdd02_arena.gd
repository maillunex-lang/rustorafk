extends Node3D
const Logic = preload("res://gdd02_combat.gd")
const HERO_SCENE = preload("res://assets/kaeron_animated.glb")
var animation_players: Array[AnimationPlayer] = []
var health_bars: Array[MeshInstance3D] = []
var action_until: Array[float] = []
var action_names: Array[String] = []
var pending_actions: Array[Array] = []
var hero_models: Array[Node3D] = []
var win_animation_played := false
var effect_ttl: Array[float] = []
var effect_nodes: Array[MeshInstance3D] = []
var effect_total := 0
const ACTION_LENGTHS := {"Left_Slash":0.8, "Thrust_Slash":1.2, "Charged_Slash":1.8, "Hit_Reaction":0.4, "Dead":1.5, "Sword_Shout":2.0}
var sim = Logic.new()
var fighters: Array[Node3D] = []
var status: Label
var detail: Label
var performance_label: Label
var skill_buttons: Array[Button] = []
var skill_feedback: Label
var skill_feedback_ttl := 0.0
var ultimate_button: Button
var hud_cooldown_labels: Array[Label] = []
var hud_ultimate_label: Label
var hud_icons: Array[Control] = []
var perf_elapsed := 0.0
var fps_min := 999.0
var fps_sum := 0.0
var fps_samples := 0
var time_passed := 0.0
var ultimate_flash := 0.0
var camera: Camera3D
var battle_started := false
var formation_buttons: Array[Button] = []
var formation_selected := -1
var formation_panel: VBoxContainer
var start_battle_button: Button
var nav_agents: Array[NavigationAgent3D] = []
var nav_region: NavigationRegion3D

func _ready() -> void:
    sim.setup()
    var floor_node := MeshInstance3D.new()
    var floor_mesh := CylinderMesh.new()
    floor_mesh.top_radius = 7.0
    floor_mesh.bottom_radius = 7.0
    floor_mesh.height = 0.25
    floor_node.mesh = floor_mesh
    floor_node.position.y = -0.2
    add_child(floor_node)
    nav_region = NavigationRegion3D.new()
    nav_region.name = "ArenaNavigationRegion"
    var nav_mesh := NavigationMesh.new()
    nav_mesh.vertices = PackedVector3Array([
        Vector3(-6.8, 0, -6.8), Vector3(6.8, 0, -6.8),
        Vector3(6.8, 0, 6.8), Vector3(-6.8, 0, 6.8)
    ])
    nav_mesh.add_polygon(PackedInt32Array([0, 1, 2]))
    nav_mesh.add_polygon(PackedInt32Array([0, 2, 3]))
    nav_region.navigation_mesh = nav_mesh
    add_child(nav_region)
    var light := DirectionalLight3D.new()
    light.rotation_degrees = Vector3(-55, -25, 0)
    add_child(light)
    for team in range(2):
        for i in range(5):
            var unit := Node3D.new()
            unit.position = Vector3((i - 2) * 1.55, 0, (team * 2 - 1) * 2.5)
            add_child(unit)
            var hero_model: Node3D = HERO_SCENE.instantiate()
            hero_model.scale = Vector3.ONE * 0.85
            hero_model.rotation.y = PI if team == 1 else 0.0
            unit.add_child(hero_model)
            hero_models.append(hero_model)
            var player := _find_animation_player(hero_model)
            if player != null:
                animation_players.append(player)
                if player.has_animation("Running"):
                    player.play("Running")
                elif player.has_animation("Walking"):
                    player.play("Walking")
            var hp_back := MeshInstance3D.new()
            var hp_mesh := BoxMesh.new()
            hp_mesh.size = Vector3(0.95, 0.10, 0.07)
            hp_back.mesh = hp_mesh
            hp_back.position.y = 2.15
            var hp_material := StandardMaterial3D.new()
            hp_material.albedo_color = Color(0.18, 0.85, 0.3) if team == 0 else Color(1.0, 0.25, 0.25)
            hp_material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
            hp_back.material_override = hp_material
            unit.add_child(hp_back)
            health_bars.append(hp_back)
            action_until.append(0.0)
            action_names.append("")
            pending_actions.append([])
            var agent := NavigationAgent3D.new()
            agent.avoidance_enabled = false
            agent.path_desired_distance = 0.15
            agent.target_desired_distance = 0.15
            unit.add_child(agent)
            nav_agents.append(agent)
            unit.set_meta("fighter_index", team * 5 + i)
            var bt := BTPlayer.new()
            bt.name = "LimboAI_BTPlayer"
            bt.active = false
            var tree := BehaviorTree.new()
            var sequence := BTSequence.new()
            var select_target: BTAction = load("res://gdd02_bt_target.gd").new()
            sequence.add_child(select_target)
            tree.root_task = sequence
            bt.behavior_tree = tree
            unit.add_child(bt)
            bt.set_scene_root_hint(unit)
            bt.active = true
            fighters.append(unit)
    camera = Camera3D.new()
    camera.position = Vector3(0, 9.4, 10.0)
    camera.rotation_degrees.x = -43
    camera.current = true
    add_child(camera)
    var phantom_host := Node.new()
    phantom_host.set_script(load("res://addons/phantom_camera/scripts/phantom_camera_host/phantom_camera_host.gd"))
    phantom_host.name = "PhantomCameraHost"
    camera.add_child(phantom_host)
    var phantom := Node3D.new()
    phantom.set_script(load("res://addons/phantom_camera/scripts/phantom_camera/phantom_camera_3d.gd"))
    phantom.name = "PhantomCamera3D"
    phantom.position = camera.position
    phantom.rotation = camera.rotation
    add_child(phantom)
    var canvas := CanvasLayer.new()
    add_child(canvas)
    var overlay := Control.new()
    overlay.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    overlay.mouse_filter = Control.MOUSE_FILTER_IGNORE
    canvas.add_child(overlay)

    var top_panel := VBoxContainer.new()
    top_panel.set_anchors_preset(Control.PRESET_TOP_WIDE)
    top_panel.offset_left = 14
    top_panel.offset_right = -14
    top_panel.offset_top = 18
    top_panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
    overlay.add_child(top_panel)
    status = Label.new()
    status.add_theme_font_size_override("font_size", 20)
    top_panel.add_child(status)
    detail = Label.new()
    detail.add_theme_font_size_override("font_size", 15)
    top_panel.add_child(detail)
    performance_label = Label.new()
    performance_label.add_theme_font_size_override("font_size", 13)
    performance_label.add_theme_color_override("font_color", Color(0.8, 1.0, 0.55))
    top_panel.add_child(performance_label)

    var bottom := VBoxContainer.new()
    bottom.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
    bottom.offset_left = 14
    bottom.offset_right = -14
    bottom.offset_top = -260
    bottom.offset_bottom = -18
    bottom.add_theme_constant_override("separation", 7)
    overlay.add_child(bottom)
    skill_feedback = Label.new()
    skill_feedback.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    skill_feedback.add_theme_font_size_override("font_size", 18)
    skill_feedback.add_theme_color_override("font_color", Color(0.45, 1.0, 0.85))
    bottom.add_child(skill_feedback)

    var ability_row := HBoxContainer.new()
    ability_row.alignment = BoxContainer.ALIGNMENT_CENTER
    ability_row.add_theme_constant_override("separation", 10)
    bottom.add_child(ability_row)
    var names := ["GUARD", "STRIKE", "RECOVER", "ULTIMATE"]
    for i in range(4):
        var tile := VBoxContainer.new()
        tile.size_flags_horizontal = Control.SIZE_EXPAND_FILL
        ability_row.add_child(tile)
        var skill_button := Button.new()
        skill_button.custom_minimum_size = Vector2(132, 136)
        skill_button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
        skill_button.text = ""
        skill_button.add_theme_font_size_override("font_size", 18)
        skill_button.add_theme_color_override("font_color", Color.WHITE)
        var normal := StyleBoxFlat.new()
        normal.bg_color = Color(0.11, 0.18, 0.30, 0.94) if i < 3 else Color(0.38, 0.22, 0.12, 0.96)
        normal.border_color = Color(0.35, 0.69, 0.96) if i < 3 else Color(1.0, 0.74, 0.32)
        normal.set_border_width_all(2)
        normal.set_corner_radius_all(16)
        skill_button.add_theme_stylebox_override("normal", normal)
        var pressed := normal.duplicate()
        pressed.bg_color = Color(0.20, 0.40, 0.60)
        skill_button.add_theme_stylebox_override("pressed", pressed)
        var disabled_style := normal.duplicate()
        disabled_style.bg_color = Color(0.17, 0.18, 0.22, 0.90)
        skill_button.add_theme_stylebox_override("disabled", disabled_style)
        if i == 3:
            ultimate_button = skill_button
            skill_button.pressed.connect(_ultimate)
        else:
            skill_buttons.append(skill_button)
            skill_button.pressed.connect(_skill.bind(i))
        tile.add_child(skill_button)
        var icon := Control.new()
        icon.set_script(load("res://gdd02_skill_icon.gd"))
        icon.skill_index = i
        icon.custom_minimum_size = Vector2(94, 94)
        icon.set_anchors_preset(Control.PRESET_CENTER)
        icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
        skill_button.add_child(icon)
        hud_icons.append(icon)
        var name_label := Label.new()
        name_label.text = names[i]
        name_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
        name_label.add_theme_font_size_override("font_size", 17)
        name_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
        tile.add_child(name_label)
        var cooldown_label := Label.new()
        cooldown_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
        cooldown_label.add_theme_font_size_override("font_size", 16)
        cooldown_label.add_theme_color_override("font_color", Color(1.0, 0.85, 0.45))
        tile.add_child(cooldown_label)
        if i == 3:
            hud_ultimate_label = cooldown_label
        else:
            hud_cooldown_labels.append(cooldown_label)

    formation_panel = VBoxContainer.new()
    formation_panel.add_theme_constant_override("separation", 4)
    bottom.add_child(formation_panel)
    var formation_title := Label.new()
    formation_title.text = "FORMATION: tap two slots to swap, then START"
    formation_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    formation_panel.add_child(formation_title)
    var formation_row := HBoxContainer.new()
    formation_row.add_theme_constant_override("separation", 5)
    formation_panel.add_child(formation_row)
    for i in range(5):
        var slot_button := Button.new()
        slot_button.custom_minimum_size = Vector2(65, 48)
        slot_button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
        slot_button.pressed.connect(_formation_slot.bind(i))
        formation_row.add_child(slot_button)
        formation_buttons.append(slot_button)
    start_battle_button = Button.new()
    start_battle_button.text = "START BATTLE"
    start_battle_button.custom_minimum_size = Vector2(0, 46)
    start_battle_button.pressed.connect(_start_battle)
    formation_panel.add_child(start_battle_button)
    _refresh()

func _find_animation_player(node: Node) -> AnimationPlayer:
    if node is AnimationPlayer:
        return node as AnimationPlayer
    for child in node.get_children():
        var found := _find_animation_player(child)
        if found != null:
            return found
    return null

func _ultimate() -> void:
    if sim.manual_ultimate(0):
        ultimate_flash = 0.35
        _consume_events()
    _refresh()

func _skill(skill_index: int) -> void:
    var accepted := sim.use_skill(0, skill_index)
    if accepted:
        _consume_events()
    skill_feedback.text = ("OK: " if accepted else "WAIT: ") + sim.last_event
    skill_feedback_ttl = 3.0
    _refresh()

func _formation_slot(slot: int) -> void:
    if battle_started:
        return
    if formation_selected < 0:
        formation_selected = slot
        skill_feedback.text = "Select destination for slot %d" % (slot + 1)
    elif formation_selected == slot:
        formation_selected = -1
        skill_feedback.text = "Selection cancelled"
    else:
        var from_slot := formation_selected
        formation_selected = -1
        if sim.move_formation(from_slot, slot):
            skill_feedback.text = "Swapped slots %d and %d" % [from_slot + 1, slot + 1]
    skill_feedback_ttl = 4.0
    _refresh()

func _start_battle() -> void:
    if battle_started:
        return
    battle_started = true
    formation_selected = -1
    formation_panel.visible = false
    skill_feedback.text = "BATTLE STARTED"
    skill_feedback_ttl = 2.0
    _refresh()

func _refresh() -> void:
    var a := 0
    var b := 0
    for h in sim.allies:
        if h["hp"] > 0:
            a += 1
    for h in sim.enemies:
        if h["hp"] > 0:
            b += 1
    status.text = "GDD-02 | %.1fs | %d vs %d | ult: %d | %s" % [sim.elapsed, a, b, sim.ultimate_events, sim.winner]
    detail.text = sim.last_event
    for i in range(formation_buttons.size()):
        formation_buttons[i].text = "%d: %s%s" % [i + 1, str(sim.allies[i]["role"]).to_upper(), " *" if formation_selected == i else ""]
    for i in range(skill_buttons.size()):
        var cooldown: float = sim.allies[0]["cooldowns"][i]
        skill_buttons[i].disabled = not battle_started or cooldown > 0.0 or sim.allies[0]["hp"] <= 0 or sim.finished
        hud_cooldown_labels[i].text = "%.1f s" % cooldown if cooldown > 0.0 else "READY"
        hud_icons[i].set_cooldown(cooldown, sim.SKILL_COOLDOWNS[i], not skill_buttons[i].disabled)
    ultimate_button.disabled = not battle_started or sim.finished or sim.allies[0]["hp"] <= 0 or sim.allies[0]["cooldowns"][3] > 0.0
    hud_ultimate_label.text = "%.1f s" % sim.allies[0]["cooldowns"][3] if sim.allies[0]["cooldowns"][3] > 0.0 else "READY"
    hud_icons[3].set_cooldown(sim.allies[0]["cooldowns"][3], sim.SKILL_COOLDOWNS[3], not ultimate_button.disabled)

func _play_action(index: int, name: String) -> void:
    if index < 0 or index >= animation_players.size():
        return
    var player := animation_players[index]
    if not player.has_animation(name):
        return
    if action_names[index] == "Dead":
        return
    if name != "Dead" and time_passed < action_until[index]:
        if pending_actions[index].size() < 2:
            pending_actions[index].append(name)
        return
    if name == "Dead":
        pending_actions[index].clear()
    player.play(name, 0.04)
    action_names[index] = name
    action_until[index] = time_passed + player.get_animation(name).length

func _consume_events() -> void:
    for event in sim.visual_events:
        var actor: int = event["actor"]
        var target: int = event["target"]
        if event["kind"] == "impact":
            _spawn_impact(target, event["damage"], event["fatal"])
            if event["fatal"]:
                _play_action(target, "Dead")
            else:
                _play_action(target, "Hit_Reaction")
        elif event["kind"] == "ultimate":
            _spawn_impact(target, 65, false)
            _play_action(actor, "Charged_Slash")
        elif event["kind"] == "skill":
            _spawn_ability_flash(target, Color(1.0, 0.4, 0.1), 0.48)
            _play_action(actor, "Thrust_Slash")
        elif event["kind"] == "shield":
            _spawn_ability_flash(actor, Color(0.15, 0.55, 1.0), 0.70)
        elif event["kind"] == "heal":
            _spawn_ability_flash(target, Color(0.15, 1.0, 0.3), 0.70)
        elif event["kind"] == "attack":
            _play_action(actor, "Left_Slash" if actor % 2 == 0 else "Thrust_Slash")
    sim.visual_events.clear()

func _spawn_ability_flash(target: int, tint: Color, radius: float) -> void:
    if target < 0 or target >= fighters.size():
        return
    var sphere := MeshInstance3D.new()
    var mesh := SphereMesh.new()
    mesh.radius = radius
    mesh.height = radius * 2.0
    sphere.mesh = mesh
    var mat := StandardMaterial3D.new()
    mat.albedo_color = tint
    mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
    sphere.material_override = mat
    sphere.position = fighters[target].global_position + Vector3(0, 1.3, 0)
    add_child(sphere)
    effect_nodes.append(sphere)
    effect_ttl.append(0.65)
    effect_total += 1

func _spawn_impact(target: int, damage: int, fatal: bool) -> void:
    if target < 0 or target >= fighters.size():
        return
    var spark := MeshInstance3D.new()
    var sphere := SphereMesh.new()
    sphere.radius = 0.22 if not fatal else 0.38
    sphere.height = sphere.radius * 2.0
    spark.mesh = sphere
    var mat := StandardMaterial3D.new()
    mat.albedo_color = Color(1.0, 0.78, 0.18) if not fatal else Color(1.0, 0.2, 0.3)
    mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
    spark.material_override = mat
    spark.position = fighters[target].global_position + Vector3(0, 1.2, 0)
    add_child(spark)
    effect_nodes.append(spark)
    effect_ttl.append(0.24)
    effect_total += 1

func _physics_process(delta: float) -> void:
    if not battle_started:
        return
    for i in range(fighters.size()):
        var fighter := fighters[i]
        if not fighter.visible:
            continue
        var destination := Vector3(fighter.position.x, 0.0, -0.9 if i < 5 else 0.9)
        var agent := nav_agents[i]
        if agent.target_position.distance_to(destination) > 0.12:
            agent.target_position = destination
        if agent.is_navigation_finished():
            continue
        var next_position := agent.get_next_path_position()
        var direction := next_position - fighter.global_position
        direction.y = 0.0
        if direction.length() > 0.02:
            fighter.global_position += direction.normalized() * minf(delta * 1.3, direction.length())

func _process(delta: float) -> void:
    skill_feedback_ttl = maxf(0.0, skill_feedback_ttl - delta)
    if skill_feedback_ttl == 0.0 and skill_feedback != null:
        skill_feedback.text = ""
    perf_elapsed += delta
    if perf_elapsed >= 1.0:
        perf_elapsed = 0.0
        var fps := float(Engine.get_frames_per_second())
        fps_min = minf(fps_min, fps)
        fps_sum += fps
        fps_samples += 1
        var ram_mb := float(OS.get_static_memory_usage()) / 1048576.0
        var peak_mb := float(OS.get_static_memory_peak_usage()) / 1048576.0
        var video_mb := float(Performance.get_monitor(Performance.RENDER_VIDEO_MEM_USED)) / 1048576.0
        var objects := int(Performance.get_monitor(Performance.RENDER_TOTAL_OBJECTS_IN_FRAME))
        performance_label.text = "FPS %d | min %d | avg %.1f | RAM %.1f MB | peak %.1f MB | VRAM %.1f MB | objects %d" % [int(fps), int(fps_min), fps_sum / float(fps_samples), ram_mb, peak_mb, video_mb, objects]
    for j in range(effect_nodes.size() - 1, -1, -1):
        effect_ttl[j] -= delta
        if effect_ttl[j] <= 0.0:
            effect_nodes[j].queue_free()
            effect_nodes.remove_at(j)
            effect_ttl.remove_at(j)
        else:
            effect_nodes[j].scale = Vector3.ONE * (0.4 + (0.24 - effect_ttl[j]) * 2.5)

    if not battle_started:
        _refresh()
        return
    for i in range(fighters.size()):
        var chosen: int = int(fighters[i].get_meta("bt_target", -1))
        if chosen >= 0:
            sim.ai_targets[i] = chosen
    sim.step(delta)
    _consume_events()
    if sim.finished and not win_animation_played:
        win_animation_played = true
        if sim.winner == "allies":
            for i in range(5):
                if sim.allies[i]["hp"] > 0:
                    _play_action(i, "Sword_Shout")
        elif sim.winner == "enemies":
            for i in range(5,10):
                if sim.enemies[i-5]["hp"] > 0:
                    _play_action(i, "Sword_Shout")
    time_passed += delta
    ultimate_flash = maxf(0.0, ultimate_flash - delta)
    for i in range(fighters.size()):
        var fighter := fighters[i]
        var hero: Dictionary = sim.allies[i] if i < 5 else sim.enemies[i - 5]
        fighter.visible = hero["hp"] > 0 or (action_names[i] == "Dead" and time_passed < action_until[i])
        if i < health_bars.size():
            health_bars[i].scale.x = maxf(0.02, float(hero["hp"]) / float(hero["max_hp"]))
        if i < animation_players.size() and fighter.visible:
            var ap := animation_players[i]
            var moving := fighter.position.z < -1.0 if i < 5 else fighter.position.z > 1.0
            var desired := "Running" if moving else "Combat_Stance"
            if time_passed >= action_until[i]:
                if action_names[i] != "Dead" and not pending_actions[i].is_empty():
                    var next_action: String = pending_actions[i].pop_front()
                    action_names[i] = ""
                    _play_action(i, next_action)
                elif action_names[i] != "Dead":
                    action_names[i] = ""
                    if ap.has_animation(desired) and ap.current_animation != desired:
                        ap.play(desired, 0.10)
        if not fighter.visible:
            continue
        fighter.rotation.y = 0.0
        fighter.position.y = 0.0
    if ultimate_flash > 0:
        camera.position.y = 9.4 + sin(time_passed * 30.0) * 0.10
    else:
        camera.position.y = 9.4
    _refresh()
