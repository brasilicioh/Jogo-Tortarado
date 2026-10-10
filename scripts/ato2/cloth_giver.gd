extends Area2D

var gave_cloth := false
var cloth: ItemData = load("res://assets/items/cloth.tres")

func interact():
	if not GameState.inventories[GameState.active_player].has_item(cloth) and not gave_cloth:
		GameState.inventories[GameState.active_player].add_item(cloth)
		#UiManager.set_current_task("Espante os pássaros")
		gave_cloth = true;
