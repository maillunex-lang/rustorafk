extends Control

const Combat = preload("res://combat.gd")
var simulation: RefCounted
var label: Label

func _ready() -> void:
    simulation = Combat.new()
    simulation.setup()
    label = Label.new()
    label.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
    add_child(label)
    _update_display()

func _process(_delta: float) -> void:
    if Input.is_action_just_pressed("ui_accept"):
        simulation.step()
        _update_display()

func _update_display() -> void:
    label.text = "GDD-01 isolated PoC\nPortrait 9:16\n5v5 simulation\nTurn: %d\nAlive: %d vs %d\nPress Enter to step" % [simulation.turn, simulation.alive_count(0), simulation.alive_count(1)]
