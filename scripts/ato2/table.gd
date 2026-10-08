extends Area2D

var put_cups := false
var put_cloth := false
var put_decor := false
var put_gift := false
var table_complete := false

var cups: ItemData = load("res://assets/items/cups.tres")
var cloth: ItemData = load("res://assets/items/cloth.tres")
var decor: ItemData = load("res://assets/items/decor.tres")
var gift: ItemData = load("res://assets/items/gift.tres")

func interact():
	if GameState.inventories[GameState.active_player].has_item(cups) and not put_cups:
		GameState.inventories[GameState.active_player].remove_item(cups)
		#UiManager.set_current_task("Espante os pássaros")
		put_cups = true;
		
	elif GameState.inventories[GameState.active_player].has_item(cloth) and not put_cloth:
		GameState.inventories[GameState.active_player].remove_item(cloth)
		#UiManager.set_current_task("Espante os pássaros")
		put_cloth = true;
		
	elif GameState.inventories[GameState.active_player].has_item(decor) and not put_decor:
		GameState.inventories[GameState.active_player].remove_item(decor)
		#UiManager.set_current_task("Espante os pássaros")
		put_decor = true;
		
	elif GameState.inventories[GameState.active_player].has_item(gift) and not put_gift:
		GameState.inventories[GameState.active_player].remove_item(gift)
		#UiManager.set_current_task("Espante os pássaros")
		put_gift = true;
	
	elif put_cups and put_cloth and put_decor and put_gift:
		#UiManager.set_current_task("Espante os pássaros")
		print("mesa completa")
		table_complete = true;
	
	else:
		print("tu tem porra nenhuma.")
