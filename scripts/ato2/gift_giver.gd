extends Area2D

var gave_gift := false
var gift: ItemData = load("res://assets/items/gift.tres")

func interact():
	if not GameState.inventories[GameState.active_player].has_item(gift) and Dialogic.VAR.Ato2.interacted_with_domingas  and Dialogic.VAR.Ato2.GaveItems.gift == false:
		GameState.inventories[GameState.active_player].add_item(gift)
		#UiManager.set_current_task("Espante os pássaros")
		Dialogic.VAR.Ato2.GaveItems.gift = true;
