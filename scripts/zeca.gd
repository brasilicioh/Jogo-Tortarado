extends Area2D

var gave_rock := false
var rock: ItemData = load("res://assets/items/rock.tres")

func interact():
	if not GameState.inventories[GameState.active_player].has_item(rock) and not gave_rock:
		GameState.inventories[GameState.active_player].add_item(rock)
		UiManager.set_current_task("Espante os pássaros")
		gave_rock = true;

#TODO: add callback to transition to next scene
