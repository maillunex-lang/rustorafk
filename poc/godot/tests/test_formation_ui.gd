extends SceneTree

func _initialize() -> void:
    call_deferred("_verify")

func _verify() -> void:
    var arena: Node3D = load("res://gdd02_arena.tscn").instantiate()
    root.add_child(arena)
    await process_frame
    assert(not arena.battle_started)
    assert(arena.formation_buttons.size() == 5)
    var first_role: String = arena.sim.allies[0]["role"]
    var last_role: String = arena.sim.allies[4]["role"]
    arena.formation_buttons[0].emit_signal("pressed")
    arena.formation_buttons[4].emit_signal("pressed")
    assert(arena.sim.allies[0]["role"] == last_role)
    assert(arena.sim.allies[4]["role"] == first_role)
    assert(arena.sim.elapsed == 0.0)
    arena.start_battle_button.emit_signal("pressed")
    assert(arena.battle_started)
    assert(not arena.formation_panel.visible)
    arena.sim.step(0.1)
    assert(not arena.sim.move_formation(0, 1))
    print("PASS GDD-02: five-slot formation selection, swap, start and lock")
    quit(0)
