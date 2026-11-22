extends RefCounted

const MAX_SECONDS := 60.0
const SKILLS_PER_HERO := 4
const FORMATION_SLOTS := 5
const ROLES := ["tank", "warrior", "assassin", "marksman", "mage", "support"]
var elapsed := 0.0
var allies: Array[Dictionary] = []
var enemies: Array[Dictionary] = []
var ultimate_events := 0
var finished := false
var winner := "ongoing"
var last_event := ""
var visual_events: Array[Dictionary] = []
var pending_hits: Array[Dictionary] = []
var hit_sequence := 0
var ai_targets: Dictionary = {}

func setup() -> void:
    elapsed = 0.0
    ultimate_events = 0
    finished = false
    winner = "ongoing"
    last_event = ""
    visual_events.clear()
    pending_hits.clear()
    hit_sequence = 0
    ai_targets.clear()
    allies.clear()
    enemies.clear()
    for i in range(FORMATION_SLOTS):
        allies.append(_hero(i, ROLES[i]))
        enemies.append(_hero(i, ROLES[(i + 1) % ROLES.size()]))

func _hero(slot: int, role: String) -> Dictionary:
    var max_hp := 175 if role == "tank" else 115
    return {"slot":slot, "role":role, "hp":max_hp, "max_hp":max_hp, "energy":100, "cooldowns":[0.0,0.0,0.0,0.0], "attack_timer":float(slot)*0.15}

func move_formation(from_slot: int, to_slot: int) -> bool:
    if elapsed > 0.0 or from_slot < 0 or to_slot < 0 or from_slot >= FORMATION_SLOTS or to_slot >= FORMATION_SLOTS:
        return false
    var temp := allies[from_slot]
    allies[from_slot] = allies[to_slot]
    allies[to_slot] = temp
    allies[from_slot]["slot"] = from_slot
    allies[to_slot]["slot"] = to_slot
    return true

func manual_ultimate(slot: int) -> bool:
    if finished or slot < 0 or slot >= FORMATION_SLOTS:
        return false
    var hero := allies[slot]
    if hero["hp"] <= 0 or hero["energy"] < 100 or hero["cooldowns"][3] > 0.0:
        return false
    hero["energy"] = 0
    hero["cooldowns"][3] = 10.0
    ultimate_events += 1
    var target := _first_living(enemies)
    if target >= 0:
        _queue_hit(slot, 5+target, 65, "ultimate", 0.95)
        visual_events.append({"kind":"ultimate", "actor":slot, "target":5+target})
        last_event = "Ultimate hits enemy %d" % (target + 1)
    _evaluate()
    return true

func _first_living(team: Array[Dictionary]) -> int:
    for i in range(team.size()):
        if team[i]["hp"] > 0:
            return i
    return -1

func _tick_team(attacking: Array[Dictionary], defending: Array[Dictionary], delta: float, side: int) -> void:
    for actor in range(attacking.size()):
        var hero: Dictionary = attacking[actor]
        if hero["hp"] <= 0:
            continue
        hero["attack_timer"] -= delta
        if hero["attack_timer"] > 0:
            continue
        hero["attack_timer"] += 2.7
        var target := int(ai_targets.get(actor + side * 5, -1))
        if target < 0 or target >= defending.size() or defending[target]["hp"] <= 0:
            target = _first_living(defending)
        if target < 0:
            return
        var damage := 7 if hero["role"] == "tank" else 11
        if hero["role"] == "assassin":
            damage = 16
        _queue_hit(actor + side * 5, target + (1 - side) * 5, damage, "attack", 0.38 if actor % 2 == 0 else 0.58)
        visual_events.append({"kind":"attack", "actor":actor + side * 5, "target":target + (1 - side) * 5})
        hero["energy"] = mini(100, hero["energy"] + 8)
        last_event = "%s hits %d for %d" % [hero["role"], target + 1, damage]

func _queue_hit(actor: int, target: int, damage: int, kind: String, delay: float) -> void:
    hit_sequence += 1
    pending_hits.append({"id":hit_sequence, "actor":actor, "target":target, "damage":damage, "kind":kind, "at":elapsed + delay})

func _resolve_hits() -> void:
    var due: Array[Dictionary] = []
    for hit in pending_hits:
        if elapsed >= hit["at"]:
            due.append(hit)
    for hit in due:
        pending_hits.erase(hit)
        var index: int = hit["target"]
        var team: Array[Dictionary] = allies if index < 5 else enemies
        var hero: Dictionary = team[index if index < 5 else index - 5]
        if hero["hp"] <= 0:
            continue
        hero["hp"] = maxi(0, hero["hp"] - int(hit["damage"]))
        visual_events.append({"kind":"impact", "actor":hit["actor"], "target":index, "damage":hit["damage"], "fatal":hero["hp"] <= 0})

func _evaluate() -> void:
    var a := _first_living(allies)
    var b := _first_living(enemies)
    if a < 0 or b < 0 or elapsed >= MAX_SECONDS:
        finished = true
        if a < 0 and b < 0:
            winner = "draw"
        elif b < 0:
            winner = "allies"
        elif a < 0:
            winner = "enemies"
        else:
            var hp_a := 0
            var hp_b := 0
            for h in allies:
                hp_a += h["hp"]
            for h in enemies:
                hp_b += h["hp"]
            winner = "allies" if hp_a > hp_b else ("enemies" if hp_b > hp_a else "draw")

func step(delta: float) -> void:
    if finished:
        return
    delta = maxf(0.0, delta)
    elapsed = minf(MAX_SECONDS, elapsed + delta)
    for hero in allies:
        for i in range(SKILLS_PER_HERO):
            hero["cooldowns"][i] = maxf(0.0, hero["cooldowns"][i] - delta)
    _tick_team(allies, enemies, delta, 0)
    _tick_team(enemies, allies, delta, 1)
    _resolve_hits()
    _evaluate()
