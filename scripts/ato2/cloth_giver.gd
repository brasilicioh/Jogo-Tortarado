extends Area2D

var cloth: ItemData = load("res://assets/items/cloth.tres")

func interact():
	if not GameState.inventories[GameState.active_player].has_item(cloth) and Dialogic.VAR.Ato2.GaveItems.cloth == false and GameState.state.get("alredy_exit"):
		GameState.inventories[GameState.active_player].add_item(cloth)
		Dialogic.VAR.Ato2.GaveItems.cloth = true;
