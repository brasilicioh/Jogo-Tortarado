extends Area2D

var key: ItemData = load("res://assets/items/testing_item.tres")

func interact():
	if not GameState.inventories[GameState.active_player].has_item(key):
		GameState.inventories[GameState.active_player].add_item(key)
		
		GameState.inventories[GameState.active_player].current_item = 0
		
		UiManager.set_current_task("Use the not key")
