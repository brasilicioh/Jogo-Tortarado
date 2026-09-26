extends Area2D

var doll: ItemData = load("res://assets/items/doll.tres")

var gave_doll = false

func interact():
	if GameState.inventories[GameState.active_player].has_item(doll) and !gave_doll:
		gave_doll = true
		GameState.inventories[GameState.active_player].remove_item(doll)
		UiManager.set_current_task("Obrigado!")
	else:
		if !gave_doll:
			GameState.inventories[GameState.active_player].add_item(doll)
			UiManager.set_current_task("Quero mostrar minha boneca para as priminhas que estão chegando. Mas não achei ela")
