extends Area2D

var cups: ItemData = load("res://assets/items/cups.tres")

func interact():
	if not GameState.inventories[GameState.active_player].has_item(cups) and Dialogic.VAR.Ato2.GaveItems.cups == false:
		GameState.inventories[GameState.active_player].add_item(cups)
		#UiManager.set_current_task("Espante os pássaros")
		Dialogic.VAR.Ato2.GaveItems.cups = true;
