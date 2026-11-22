extends SceneTree
func _initialize() -> void:
    call_deferred("_run")
func _run() -> void:
    var packed: PackedScene = load("res://gdd02_animation_lab.tscn")
    if packed == null:
        quit(1)
        return
    var scene := packed.instantiate()
    root.add_child(scene)
    if scene.player == null or scene.player.get_animation_list().size() != 9:
        push_error("Animation Lab missing nine Meshy clips")
        quit(1)
        return
    for i in range(9):
        scene._select(i)
        if scene.player.current_animation != scene.CLIPS[i]:
            push_error("Failed clip %s" % scene.CLIPS[i])
            quit(1)
            return
    print("PASS: nine Meshy clips selectable in Animation Lab")
    quit(0)
