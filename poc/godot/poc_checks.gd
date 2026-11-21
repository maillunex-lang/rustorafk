extends RefCounted

const DIALOGUE_PATH := "res://fixtures/heaven.dialogue"
const INVENTORY_PATH := "res://fixtures/inventory.tres"
const ITEM_ID := "celestial_seal"

static func run(scene: Node) -> PackedStringArray:
    var failures := PackedStringArray()
    var dialogue = load(DIALOGUE_PATH)
    if dialogue == null:
        failures.append("Dialogue Manager: resource import failed")
    else:
        var line = await DialogueManager.get_next_dialogue_line(dialogue, "start", [])
        var choice = await DialogueManager.get_next_dialogue_line(dialogue, line.next_id, []) if line != null else null
        if line == null or line.text != "Небесные врата открыты." or choice == null or choice.responses.size() != 2:
            failures.append("Dialogue Manager: expected one line and two choices")
        else:
            var enter = await DialogueManager.get_next_dialogue_line(dialogue, choice.responses[0].next_id, [])
            var stay = await DialogueManager.get_next_dialogue_line(dialogue, choice.responses[1].next_id, [])
            if enter == null or enter.text != "Совет ждёт тебя." or stay == null or stay.text != "Я буду здесь.":
                failures.append("Dialogue Manager: branch text mismatch")


    if not ClassDB.can_instantiate("Inventory"):
        failures.append("Expresso: native Inventory class unavailable")
        return failures

    var database = load(INVENTORY_PATH)
    if database == null:
        failures.append("Expresso: inventory database failed to load")
        return failures

    var inventory = ClassDB.instantiate("Inventory")
    inventory.database = database
    scene.add_child(inventory)
    inventory.add(ITEM_ID, 2)
    if inventory.stacks.size() != 1 or inventory.stacks[0].item_id != ITEM_ID or inventory.stacks[0].amount != 2:
        failures.append("Expresso: expected a stack of two celestial seals")
    else:
        inventory.remove(ITEM_ID, 1)
        if inventory.stacks.size() != 1 or inventory.stacks[0].amount != 1:
            failures.append("Expresso: expected one celestial seal after removing one")
    inventory.queue_free()
    return failures
