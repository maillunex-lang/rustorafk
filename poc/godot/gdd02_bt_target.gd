extends BTAction

func _tick(_delta: float) -> Status:
    if agent == null:
        return FAILURE
    var arena := agent.get_parent()
    if arena == null or arena.sim == null:
        return FAILURE
    var actor: int = int(agent.get_meta("fighter_index", -1))
    if actor < 0:
        return FAILURE
    var enemies: Array[Dictionary] = arena.sim.enemies if actor < 5 else arena.sim.allies
    var selected := -1
    for i in range(enemies.size()):
        if enemies[i]["hp"] > 0:
            selected = i
            break
    if selected < 0:
        return FAILURE
    blackboard.set_var(&"target_index", selected)
    agent.set_meta("bt_target", selected)
    return SUCCESS
