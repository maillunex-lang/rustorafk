extends Node3D
const Logic = preload("res://gdd02_combat.gd")
var sim = Logic.new()
var fighters: Array[Node3D] = []
var status: Label
var time_passed := 0.0

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
    var light := DirectionalLight3D.new()
    light.rotation_degrees = Vector3(-55, -25, 0)
    add_child(light)
    for team in range(2):
        for i in range(5):
            var unit := Node3D.new()
            unit.position = Vector3((i - 2) * 1.8, 0, (team * 2 - 1) * 2.2)
            add_child(unit)
            var torso := MeshInstance3D.new()
            torso.mesh = CapsuleMesh.new()
            torso.position.y = 1.1
            var mat := StandardMaterial3D.new()
            mat.albedo_color = Color(0.25, 0.65, 1.0) if team == 0 else Color(0.95, 0.35, 0.42)
            torso.material_override = mat
            unit.add_child(torso)
            var head := MeshInstance3D.new()
            head.mesh = SphereMesh.new()
            head.scale = Vector3(0.35, 0.35, 0.35)
            head.position.y = 2.1
            unit.add_child(head)
            var agent := NavigationAgent3D.new()
            agent.avoidance_enabled = false
            unit.add_child(agent)
            fighters.append(unit)
    var camera := Camera3D.new()
    camera.position = Vector3(0, 13, 15)
    camera.rotation_degrees.x = -40
    camera.current = true
    add_child(camera)
    var canvas := CanvasLayer.new()
    add_child(canvas)
    var panel := VBoxContainer.new()
    panel.set_anchors_preset(Control.PRESET_TOP_WIDE)
    canvas.add_child(panel)
    status = Label.new()
    panel.add_child(status)
    var button := Button.new()
    button.text = "ULTIMATE"
    button.pressed.connect(_ultimate)
    panel.add_child(button)
    var arrange := Button.new()
    arrange.text = "SWAP 1 / 5"
    arrange.pressed.connect(_swap)
    panel.add_child(arrange)
    _refresh()

func _ultimate() -> void:
    sim.manual_ultimate(0)
    _refresh()

func _swap() -> void:
    sim.move_formation(0, 4)
    var p := fighters[0].position
    fighters[0].position = fighters[4].position
    fighters[4].position = p
    _refresh()

func _refresh() -> void:
    status.text = "GDD-02 | 5v5 | %.1f s | ult: %d" % [sim.elapsed, sim.ultimate_events]

func _process(delta: float) -> void:
    sim.step(delta)
    time_passed += delta
    for i in range(fighters.size()):
        fighters[i].rotation.y = sin(time_passed * 1.8 + float(i)) * 0.12
    if time_passed > 0.1:
        _refresh()
