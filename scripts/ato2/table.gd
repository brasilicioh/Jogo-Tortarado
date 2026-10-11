extends Area2D

var table_complete := false
var table_half_complete := false

var cups: ItemData = load("res://assets/items/cups.tres")
var cloth: ItemData = load("res://assets/items/cloth.tres")
var decor: ItemData = load("res://assets/items/decor.tres")
var gift: ItemData = load("res://assets/items/gift.tres")

func _ready() -> void:
	if Dialogic.VAR.Ato2.PutItems.cups:
		$Cups.show()
	if Dialogic.VAR.Ato2.PutItems.cloth:
		$Cloth.show()
	if Dialogic.VAR.Ato2.PutItems.decor:
		$Decor.show()
	if Dialogic.VAR.Ato2.PutItems.gift:
		$Gift.show()

func interact():
	if GameState.inventories[GameState.active_player].has_item(cups) and Dialogic.VAR.Ato2.PutItems.cups == false:
		GameState.inventories[GameState.active_player].remove_item(cups)
		#UiManager.set_current_task("Espante os pássaros")
		Dialogic.VAR.Ato2.PutItems.cups = true;
		$Cups.show()
		
	elif GameState.inventories[GameState.active_player].has_item(cloth) and Dialogic.VAR.Ato2.PutItems.cloth == false:
		GameState.inventories[GameState.active_player].remove_item(cloth)
		#UiManager.set_current_task("Espante os pássaros")
		Dialogic.VAR.Ato2.PutItems.cloth = true;
		$Cloth.show()
		
	elif GameState.inventories[GameState.active_player].has_item(decor) and Dialogic.VAR.Ato2.PutItems.decor == false:
		GameState.inventories[GameState.active_player].remove_item(decor)
		#UiManager.set_current_task("Espante os pássaros")
		Dialogic.VAR.Ato2.PutItems.decor = true;
		$Decor.show()
		
	elif GameState.inventories[GameState.active_player].has_item(gift) and Dialogic.VAR.Ato2.PutItems.gift== false:
		GameState.inventories[GameState.active_player].remove_item(gift)
		#UiManager.set_current_task("Espante os pássaros")
		Dialogic.VAR.Ato2.PutItems.gift = true;
		$Gift.show()
	else:
		print("tu tem porra nenhuma1.")
	
	if Dialogic.VAR.Ato2.PutItems.cups and Dialogic.VAR.Ato2.PutItems.cloth and Dialogic.VAR.Ato2.PutItems.decor and Dialogic.VAR.Ato2.PutItems.gift:
		#UiManager.set_current_task("Espante os pássaros")
		print("mesa completa")
		table_complete = true;
		Dialogic.VAR.Ato2.table_complete = true;
		await get_tree().create_timer(2.0).timeout
		#fazer cutscene de noite aqui.
		GameState.change_scene("res://scenes/atdois/outside3.tscn","OutsideMarker2")
		
	elif Dialogic.VAR.Ato2.PutItems.cups and Dialogic.VAR.Ato2.PutItems.cloth and Dialogic.VAR.Ato2.PutItems.decor:
		#UiManager.set_current_task("Espante os pássaros")
		print("mesa semi completa")
		table_half_complete = true;
		Dialogic.VAR.Ato2.table_half_complete = true;
		Dialogic.start("salutana_appears")
	
	else:
		print("tu tem porra nenhuma2.")
