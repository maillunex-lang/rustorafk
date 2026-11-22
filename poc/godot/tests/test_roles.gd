extends SceneTree
const Combat = preload("res://gdd02_combat.gd")
func _initialize() -> void:
    var sim = Combat.new()
    sim.setup()
    assert(sim.select_target("marksman", sim.enemies) == 4)
    assert(sim.select_target("warrior", sim.enemies) == 0)
    sim.enemies[3]["hp"] = 9
    assert(sim.select_target("assassin", sim.enemies) == 3)
    for hero in sim.allies:
        hero["attack_timer"] = 100.0
    for hero in sim.enemies:
        hero["attack_timer"] = 100.0
    sim.allies[0]["attack_timer"] = 0.0
    sim.step(0.1)
    assert(sim.allies[0]["shield"] == 5)
    sim.allies[4]["role"] = "support"
    sim.allies[4]["attack_timer"] = 0.0
    sim.allies[1]["hp"] -= 25
    sim.step(0.1)
    assert(sim.allies[1]["hp"] == sim.allies[1]["max_hp"] - 11)
    sim.allies[2]["role"] = "mage"
    sim.allies[2]["attack_timer"] = 0.0
    sim.step(0.1)
    assert(sim.pending_hits.any(func(h: Dictionary) -> bool: return h["kind"] == "splash"))
    print("PASS GDD-02: tank shield, support autoheal, mage splash, assassin/marksman/warrior target policies")
    quit(0)
