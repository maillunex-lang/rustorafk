extends SceneTree
const Combat = preload("res://gdd02_combat.gd")
func _initialize() -> void:
    var sim = Combat.new()
    sim.setup()
    assert(not sim.use_skill(-1, 0))
    assert(not sim.use_skill(0, 3))
    assert(not sim.use_skill(0, -1))
    assert(sim.use_skill(0, 0))
    assert(sim.allies[0]["shield"] == 35)
    assert(not sim.use_skill(0, 0))
    assert(sim.use_skill(1, 1))
    assert(not sim.use_skill(1, 1))
    for hero in sim.allies:
        hero["attack_timer"] = 100.0
    for hero in sim.enemies:
        hero["attack_timer"] = 100.0
    var enemy_hp: int = sim.enemies[0]["hp"]
    sim.step(0.46)
    assert(sim.enemies[0]["hp"] == enemy_hp - 18)
    sim.allies[2]["hp"] -= 40
    assert(sim.use_skill(4, 2))
    assert(sim.allies[2]["hp"] == sim.allies[2]["max_hp"] - 32)
    assert(not sim.use_skill(4, 2))
    assert(sim.allies[0]["cooldowns"][0] > 0)
    sim.step(10.0)
    assert(sim.allies[0]["cooldowns"][0] == 0.0)
    assert(sim.use_skill(0, 0))
    print("PASS GDD-02: 3 ordinary skills, shield/damage/heal, cooldowns and bounds")
    quit(0)
