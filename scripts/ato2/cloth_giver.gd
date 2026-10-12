extends Area2D

var cloth: ItemData = load("res://assets/items/cloth.tres")

func interact():
	if not GameState.inventories[GameState.active_player].has_item(cloth) and Dialogic.VAR.Ato2.GaveItems.cloth == false:
		GameState.inventories[GameState.active_player].add_item(cloth)
		#UiManager.set_current_task("Espante os pássaros")
		Dialogic.VAR.Ato2.GaveItems.cloth = true;
