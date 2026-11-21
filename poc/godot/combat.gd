extends RefCounted

var turn: int = 0
var units: Array[Dictionary] = []

func setup() -> void:
    turn = 0
    units.clear()
    for team in range(2):
        for slot in range(5):
            units.append({"team": team, "slot": slot, "hp": 100, "x": float(slot), "y": float(team) * 5.0})

func alive_count(team: int) -> int:
    var result := 0
    for unit in units:
        if unit["team"] == team and unit["hp"] > 0:
            result += 1
    return result

func step() -> void:
    turn += 1
    for team in range(2):
        for unit in units:
            if unit["team"] != team or unit["hp"] <= 0:
                continue
            for enemy in units:
                if enemy["team"] != team and enemy["hp"] > 0:
                    enemy["hp"] = maxi(0, enemy["hp"] - 10)
                    break
