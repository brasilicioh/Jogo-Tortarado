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
