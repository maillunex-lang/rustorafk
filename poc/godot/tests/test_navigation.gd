extends SceneTree
func _initialize() -> void:
    call_deferred("_verify")
func _verify() -> void:
    var arena: Node3D = load("res://gdd02_arena.tscn").instantiate()
    root.add_child(arena)
    await physics_frame
    await physics_frame
    assert(arena.nav_agents.size() == 10)
    assert(arena.nav_region.navigation_mesh.get_polygon_count() == 2)
    var initial_z: float = arena.fighters[0].position.z
    arena._start_battle()
    for i in range(80):
        await physics_frame
    var moved_z: float = arena.fighters[0].position.z
    assert(moved_z > initial_z + 0.4)
    assert(arena.nav_agents[0].get_navigation_map().is_valid())
    print("PASS GDD-02: 10 NavigationAgent3D, region path and actual movement %.2f -> %.2f" % [initial_z, moved_z])
    quit(0)
