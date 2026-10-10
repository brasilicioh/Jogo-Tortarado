extends Area2D

var gave_cups := false
var cups: ItemData = load("res://assets/items/cups.tres")

func interact():
	if not GameState.inventories[GameState.active_player].has_item(cups) and not gave_cups:
		GameState.inventories[GameState.active_player].add_item(cups)
		#UiManager.set_current_task("Espante os pássaros")
		gave_cups = true;
