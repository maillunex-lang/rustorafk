extends RefCounted

const MAX_SECONDS := 60.0
const SKILLS_PER_HERO := 4
const FORMATION_SLOTS := 5
const ROLES := ["tank", "warrior", "assassin", "marksman", "mage", "support"]
var elapsed := 0.0
var allies: Array[Dictionary] = []
var enemies: Array[Dictionary] = []
var ultimate_events := 0

func setup() -> void:
    elapsed = 0.0
    ultimate_events = 0
    allies.clear()
    enemies.clear()
    for i in range(FORMATION_SLOTS):
        allies.append({"slot":i,"role":ROLES[i],"hp":100,"energy":100,"cooldowns":[0.0,0.0,0.0,0.0]})
        enemies.append({"slot":i,"role":ROLES[(i+1)%ROLES.size()],"hp":100,"energy":100,"cooldowns":[0.0,0.0,0.0,0.0]})

func move_formation(from_slot: int, to_slot: int) -> bool:
    if from_slot < 0 or from_slot >= FORMATION_SLOTS or to_slot < 0 or to_slot >= FORMATION_SLOTS:
        return false
    allies[from_slot]["slot"] = to_slot
    allies[to_slot]["slot"] = from_slot
    var temp := allies[from_slot]
    allies[from_slot] = allies[to_slot]
    allies[to_slot] = temp
    return true

func manual_ultimate(slot: int) -> bool:
    if slot < 0 or slot >= FORMATION_SLOTS:
        return false
    var hero := allies[slot]
    if hero["hp"] <= 0 or hero["energy"] < 100 or hero["cooldowns"][3] > 0.0:
        return false
    hero["energy"] = 0
    hero["cooldowns"][3] = 10.0
    ultimate_events += 1
    for enemy in enemies:
        if enemy["hp"] > 0:
            enemy["hp"] = maxi(0, enemy["hp"] - 25)
            break
    return true

func step(delta: float) -> void:
    elapsed = minf(MAX_SECONDS, elapsed + maxf(0.0, delta))
    for hero in allies:
        for i in range(SKILLS_PER_HERO):
            hero["cooldowns"][i] = maxf(0.0, hero["cooldowns"][i] - delta)
