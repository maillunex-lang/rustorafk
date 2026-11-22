extends Node3D
const HERO = preload("res://assets/kaeron_animated.glb")
const CLIPS := ["Combat_Stance","Left_Slash","Thrust_Slash","Charged_Slash","Hit_Reaction","Dead","Sword_Shout","Walking","Running"]
const TARGET_SECONDS := [2.0,0.8,1.2,1.8,0.4,1.5,2.0,1.2,0.8]
var player: AnimationPlayer
var model: Node3D
var label: Label
var clip_index := 0
var speed_mode := 0
var auto_advance := false

func _ready() -> void:
    var ground := MeshInstance3D.new()
    var plane := CylinderMesh.new()
    plane.top_radius = 2.0
    plane.bottom_radius = 2.0
    plane.height = 0.12
    ground.mesh = plane
    ground.position.y = -0.1
    add_child(ground)
    model = HERO.instantiate()
    model.scale = Vector3.ONE * 1.25
    add_child(model)
    player = _find_player(model)
    var light := DirectionalLight3D.new()
    light.rotation_degrees = Vector3(-50,-30,0)
    add_child(light)
    var cam := Camera3D.new()
    cam.position = Vector3(0,2.0,5.5)
    cam.current = true
    add_child(cam)
    cam.look_at(Vector3(0,1.25,0))
    var canvas := CanvasLayer.new()
    add_child(canvas)
    var panel := VBoxContainer.new()
    panel.set_anchors_preset(Control.PRESET_TOP_WIDE)
    canvas.add_child(panel)
    label = Label.new()
    panel.add_child(label)
    var prev := Button.new()
    prev.text = "PREVIOUS CLIP"
    prev.pressed.connect(func(): _select(clip_index-1))
    panel.add_child(prev)
    var next := Button.new()
    next.text = "NEXT CLIP"
    next.pressed.connect(func(): _select(clip_index+1))
    panel.add_child(next)
    var speed := Button.new()
    speed.text = "TOGGLE ORIGINAL / TARGET SPEED"
    speed.pressed.connect(func(): speed_mode = 1-speed_mode; _select(clip_index))
    panel.add_child(speed)
    var replay := Button.new()
    replay.text = "REPLAY FULL CLIP"
    replay.pressed.connect(func(): _select(clip_index))
    panel.add_child(replay)
    _select(0)

func _find_player(node: Node) -> AnimationPlayer:
    if node is AnimationPlayer:
        return node as AnimationPlayer
    for child in node.get_children():
        var result := _find_player(child)
        if result != null:
            return result
    return null

func _select(index: int) -> void:
    clip_index = posmod(index, CLIPS.size())
    var name: String = CLIPS[clip_index]
    if player == null or not player.has_animation(name):
        label.text = "Missing clip: " + name
        return
    var clip := player.get_animation(name)
    var rate: float = 1.0 if speed_mode == 0 else clip.length / TARGET_SECONDS[clip_index]
    player.speed_scale = rate
    player.play(name, 0.0)
    label.text = "%d/9 %s | GLB %.2fs | target %.2fs | speed %.2fx" % [clip_index+1,name,clip.length,TARGET_SECONDS[clip_index],rate]
