extends Control

const Combat = preload("res://combat.gd")
const Checks = preload("res://poc_checks.gd")
const MESHY_SAMPLE := "res://local_assets/meshy_walk.glb"

var simulation := Combat.new()
var status := Label.new()
var battle := Label.new()

func _ready() -> void:
    simulation.setup()

    var layout := VBoxContainer.new()
    add_child(layout)
    layout.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    layout.alignment = BoxContainer.ALIGNMENT_CENTER
    layout.add_theme_constant_override("separation", 24)

    var sample_loaded := _add_meshy_sample(layout)

    for label in [status, battle]:
        label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
        label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
        label.add_theme_font_size_override("font_size", 30)
        layout.add_child(label)

    var button := Button.new()
    button.text = "Следующий ход"
    button.custom_minimum_size = Vector2(300, 80)
    button.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
    button.add_theme_font_size_override("font_size", 30)
    button.pressed.connect(_step)
    layout.add_child(button)

    status.text = "Проверка диалогов и инвентаря…"
    _update_battle()
    var failures := await Checks.run(self)
    if ResourceLoader.exists(MESHY_SAMPLE) and not sample_loaded:
        failures.append("Meshy: sample failed to play")
    if failures.is_empty():
        status.text = "Dialogue Manager и Expresso: OK"
        print("PASS GDD-01 Dialogue Manager and Expresso Inventory")
        if sample_loaded:
            status.text += "\nMeshy: анимация запущена"
            print("PASS GDD-01 Meshy sample playback")
    else:
        status.text = "\n".join(failures)
        push_error(status.text)
    if "--poc-smoke" in OS.get_cmdline_user_args():
        await get_tree().process_frame
        get_tree().quit(0 if failures.is_empty() else 1)

func _step() -> void:
    if simulation.alive_count(0) > 0 and simulation.alive_count(1) > 0:
        simulation.step()
        _update_battle()

func _update_battle() -> void:
    battle.text = "Бой 5×5. Ход %d\nВ строю: %d против %d" % [
        simulation.turn, simulation.alive_count(0), simulation.alive_count(1)
    ]

func _add_meshy_sample(layout: VBoxContainer) -> bool:
    if not ResourceLoader.exists(MESHY_SAMPLE):
        return false
    var packed := load(MESHY_SAMPLE) as PackedScene
    if packed == null:
        return false
    var model := packed.instantiate() as Node3D
    var players := model.find_children("*", "AnimationPlayer", true, false)
    if players.is_empty():
        model.free()
        return false
    var player := players[0] as AnimationPlayer
    var clips := player.get_animation_list()
    if clips.is_empty():
        model.free()
        return false

    var container := SubViewportContainer.new()
    container.custom_minimum_size = Vector2(420, 520)
    container.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
    container.stretch = true
    layout.add_child(container)
    var viewport := SubViewport.new()
    viewport.own_world_3d = true
    viewport.render_target_update_mode = SubViewport.UPDATE_ALWAYS
    container.add_child(viewport)

    var camera := Camera3D.new()
    viewport.add_child(camera)
    camera.position = Vector3(2.2, 1.35, 3.4)
    camera.look_at(Vector3(0, 0.9, 0))
    camera.current = true
    var light := DirectionalLight3D.new()
    light.rotation_degrees = Vector3(-45, 25, 0)
    light.light_energy = 1.5
    viewport.add_child(light)
    viewport.add_child(model)

    player.get_animation(clips[0]).loop_mode = Animation.LOOP_LINEAR
    player.play(clips[0])
    return player.is_playing()
