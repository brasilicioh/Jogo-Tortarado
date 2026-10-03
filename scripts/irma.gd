extends Area2D

var timeline: DialogicTimeline = preload("res://assets/timelines/tutorial/domingas.dtl")
var doll: ItemData = load("res://assets/items/doll.tres")

func interact():
	Dialogic.start(timeline)

func use_item(item: ItemData):
	if GameState.held_item() == doll:
		Dialogic.VAR.Tutorial.gave_doll = true
		GameState.active_inventory().remove_item(item)
		
		Dialogic.start(timeline)
		
		add_sister()
		GameState.active_player_changed.connect(load_belonisia)

func add_sister() -> void:
	GameState.active_characters.append("belonisia")

func load_belonisia() -> void:
	if GameState.active_player == "belonisia":
		GameState.active_player_changed.disconnect(load_belonisia)
		GameState.change_scene("res://scenes/tutorial/kitchen.tscn", "Kitchen")
