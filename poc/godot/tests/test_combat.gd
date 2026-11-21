extends SceneTree

const Combat = preload("res://combat.gd")

func _initialize() -> void:
    var sim = Combat.new()
    sim.setup()
    assert(sim.units.size() == 10)
    assert(sim.alive_count(0) == 5)
    assert(sim.alive_count(1) == 5)
    sim.step()
    assert(sim.turn == 1)
    assert(sim.units[5]["hp"] < 100)
    print("PASS: GDD-01 combat domain smoke")
    quit(0)
