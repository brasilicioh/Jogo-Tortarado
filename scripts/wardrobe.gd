extends Area2D

var doll: ItemData = load("res://assets/items/doll.tres")

var gave_doll = false

func interact():
	if !GameState.inventories[GameState.active_player].has_item(doll) and !gave_doll:
		GameState.inventories[GameState.active_player].add_item(doll)
		gave_doll = true
