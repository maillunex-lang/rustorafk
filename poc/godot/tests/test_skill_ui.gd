extends SceneTree

func _initialize() -> void:
    call_deferred("_run")

func _run() -> void:
    var arena: Node3D = load("res://gdd02_arena.tscn").instantiate()
    root.add_child(arena)
    await process_frame
    assert(arena.skill_buttons.size() == 3)
    arena._start_battle()
    for hero in arena.sim.allies:
        hero["attack_timer"] = 100.0
    for hero in arena.sim.enemies:
        hero["attack_timer"] = 100.0
    arena.skill_buttons[0].emit_signal("pressed")
    assert(arena.sim.allies[0]["shield"] == 35)
    assert(arena.skill_feedback.text.begins_with("OK: GUARD"))
    arena.skill_buttons[1].emit_signal("pressed")
    assert(arena.sim.pending_hits.any(func(h: Dictionary) -> bool: return h["kind"] == "skill"))
    assert(arena.skill_feedback.text.begins_with("OK: STRIKE"))
    arena.sim.allies[1]["hp"] -= 30
    arena.skill_buttons[2].emit_signal("pressed")
    assert(arena.sim.allies[1]["hp"] == arena.sim.allies[1]["max_hp"] - 22)
    assert(arena.skill_feedback.text.begins_with("OK: RECOVER"))
    assert(arena.effect_total >= 3)
    print("PASS GDD-02: real UI button signals, shield, strike, heal, feedback and VFX")
    quit(0)
