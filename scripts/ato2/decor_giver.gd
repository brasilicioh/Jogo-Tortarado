extends Area2D

var gave_decor := false
var decor: ItemData = load("res://assets/items/decor.tres")

func interact():
	if not GameState.inventories[GameState.active_player].has_item(decor) and not gave_decor:
		GameState.inventories[GameState.active_player].add_item(decor)
		#UiManager.set_current_task("Espante os pássaros")
		gave_decor = true;
