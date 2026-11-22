extends SceneTree

func _initialize() -> void:
    call_deferred("_verify")

func _verify() -> void:
    var arena: Node3D = load("res://gdd02_arena.tscn").instantiate()
    root.add_child(arena)
    await create_timer(0.3).timeout
    var players := 0
    var targets := 0
    for fighter in arena.fighters:
        var bt: Node = fighter.get_node_or_null("LimboAI_BTPlayer")
        if bt != null and bt.active:
            players += 1
        if fighter.has_meta("bt_target"):
            targets += 1
    print("LimboAI fighters=%d selected_targets=%d" % [players, targets])
    if players != 10 or targets != 10:
        quit(2)
    else:
        print("PASS LimboAI 10/10 behavior trees select targets")
        quit(0)
