extends Area2D

@export var DoorMotherNode: DoorTransition
@export var Severo: Area2D

var table_complete := false
var table_half_complete := false

var cups: ItemData = load("res://assets/items/cups.tres")
var cloth: ItemData = load("res://assets/items/cloth.tres")
var decor: ItemData = load("res://assets/items/decor.tres")
var gift: ItemData = load("res://assets/items/gift.tres")

var timeline: DialogicTimeline = preload("res://assets/timelines/ato2/severo_appears.dtl")

func _ready() -> void:
	GameState.state["atatro_items_gotten"] = 0
	if Dialogic.VAR.Ato2.PutItems.cups:
		$Cups.show()
		GameState.state["atatro_items_gotten"] += 1
	if Dialogic.VAR.Ato2.PutItems.cloth:
		$Cloth.show()
		GameState.state["atatro_items_gotten"] += 1
	if Dialogic.VAR.Ato2.PutItems.decor:
		$Decor.show()
		GameState.state["atatro_items_gotten"] += 1
	if Dialogic.VAR.Ato2.PutItems.gift:
		$Gift.show()
		GameState.state["atatro_items_gotten"] += 1

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
	
	if Dialogic.VAR.Ato2.PutItems.cups and Dialogic.VAR.Ato2.PutItems.cloth and Dialogic.VAR.Ato2.PutItems.decor and Dialogic.VAR.Ato2.PutItems.gift:
		#UiManager.set_current_task("Espante os pássaros")
		table_complete = true;
		Dialogic.VAR.Ato2.table_complete = true;
		await get_tree().create_timer(2.0).timeout
		#fazer cutscene de noite aqui.
		
		var player = null
		for chars in GameState.active_characters:
			if chars != GameState.active_player:
				for node in get_tree().get_nodes_in_group("player"):
					if node.character_id == chars:
						player = node
						continue
				continue
		Dialogic.start(timeline)
		var tween = create_tween()
		tween.tween_property(player, "global_position", $IdaIrma.global_position, 2)

		Severo.show()
		tween.tween_property(Severo, "global_position", $IdaSevero.global_position, 2)

	elif Dialogic.VAR.Ato2.PutItems.cups and Dialogic.VAR.Ato2.PutItems.cloth and Dialogic.VAR.Ato2.PutItems.decor:
		#UiManager.set_current_task("Espante os pássaros")
		table_half_complete = true;
		Dialogic.VAR.Ato2.table_half_complete = true;
		Dialogic.start("salutana_appears")
		DoorMotherNode.process_mode = Node.PROCESS_MODE_INHERIT

