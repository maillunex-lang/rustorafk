extends SceneTree
const Combat = preload("res://gdd02_combat.gd")

func _initialize() -> void:
    var sim = Combat.new()
    sim.setup()
    assert(sim.allies.size() == 5 and sim.enemies.size() == 5)
    assert(sim.move_formation(0, 4))
    assert(not sim.move_formation(-1, 2))
    assert(sim.manual_ultimate(4))
    assert(not sim.manual_ultimate(4))
    assert(sim.pending_hits.size() == 1)
    assert(sim.pending_hits[0]["damage"] == 65)
    # Freeze auto attacks to isolate the delayed ultimate hit.
    for hero in sim.allies:
        hero["attack_timer"] = 100.0
    for hero in sim.enemies:
        hero["attack_timer"] = 100.0
    var before: int = sim.enemies[0]["hp"]
    sim.step(0.90)
    assert(sim.enemies[0]["hp"] == before)
    sim.step(0.06)
    assert(sim.enemies[0]["hp"] == before - 65)
    assert(sim.pending_hits.is_empty())
    assert(sim.visual_events.any(func(event: Dictionary) -> bool: return event["kind"] == "impact" and event["damage"] == 65))
    sim.setup()
    assert(sim.ultimate_events == 0)
    for i in range(600):
        sim.step(0.1)
        if sim.finished:
            break
    assert(sim.finished)
    assert(sim.winner != "ongoing")
    assert(sim.elapsed <= 60.0)
    print("PASS GDD-02: delayed ultimate damage verified; automatic combat outcome=%s time=%.1f" % [sim.winner, sim.elapsed])
    quit(0)
