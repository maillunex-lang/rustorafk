extends SceneTree

func _initialize() -> void:
    call_deferred("_run")

func _run() -> void:
    var paths := OS.get_cmdline_user_args()
    if paths.size() != 2:
        _fail("Expected source and target rigged GLB paths")
        return

    var source := _load_model(paths[0])
    var target := _load_model(paths[1])
    if source == null or target == null:
        _fail("GLB import failed")
        return

    root.add_child(source)
    root.add_child(target)
    var source_rig := _first(source, "Skeleton3D") as Skeleton3D
    var target_rig := _first(target, "Skeleton3D") as Skeleton3D
    var source_player := _first(source, "AnimationPlayer") as AnimationPlayer
    var target_player := _first(target, "AnimationPlayer") as AnimationPlayer
    if source_rig == null or target_rig == null or source_player == null or target_player == null:
        _fail("Missing skeleton or animation player")
        return
    if source_rig.get_bone_count() != target_rig.get_bone_count():
        _fail("Bone counts differ")
        return
    for index in source_rig.get_bone_count():
        if source_rig.get_bone_name(index) != target_rig.get_bone_name(index) or source_rig.get_bone_parent(index) != target_rig.get_bone_parent(index):
            _fail("Bone hierarchy mismatch at index %d" % index)
            return

    var clips := source_player.get_animation_list()
    if clips.is_empty():
        _fail("Missing source animation")
        return
    var clip := source_player.get_animation(clips[0]).duplicate() as Animation
    var animation_root := target_player.get_node(target_player.root_node)
    for track in clip.get_track_count():
        var track_path := clip.track_get_path(track)
        var path_to_node := NodePath(track_path.get_concatenated_names())
        var node := animation_root if path_to_node.is_empty() else animation_root.get_node_or_null(path_to_node)
        if node != target_rig or track_path.get_subname_count() != 1 or target_rig.find_bone(track_path.get_subname(0)) == -1:
            _fail("Source track cannot bind on target: %s" % track_path)
            return

    var library := AnimationLibrary.new()
    library.add_animation("transferred_clip", clip)
    target_player.add_animation_library("probe", library)
    target_player.play("probe/transferred_clip")
    target_player.advance(0.0)
    var rotations := PackedVector4Array()
    for index in target_rig.get_bone_count():
        var rotation := target_rig.get_bone_pose_rotation(index)
        rotations.append(Vector4(rotation.x, rotation.y, rotation.z, rotation.w))
    target_player.advance(clip.length * 0.5)
    var affected_bones := 0
    for index in target_rig.get_bone_count():
        var rotation := target_rig.get_bone_pose_rotation(index)
        var current := Vector4(rotation.x, rotation.y, rotation.z, rotation.w)
        if not current.is_equal_approx(rotations[index]):
            affected_bones += 1
    if affected_bones == 0:
        _fail("Transferred clip did not change any target bone rotation")
        return

    print("PASS GDD-01 Meshy GLB: %d bones, %d bound tracks, %d changed bone rotations" % [
        target_rig.get_bone_count(), clip.get_track_count(), affected_bones
    ])
    quit(0)

func _load_model(path: String) -> Node:
    var document := GLTFDocument.new()
    var state := GLTFState.new()
    if document.append_from_file(path, state) != OK:
        return null
    return document.generate_scene(state)

func _first(model: Node, type: String) -> Node:
    var matches := model.find_children("*", type, true, false)
    return null if matches.is_empty() else matches[0]

func _fail(reason: String) -> void:
    push_error(reason)
    quit(1)
