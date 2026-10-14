extends Node2D

var timeline: DialogicTimeline = load("res://assets/timelines/atrez/cutscene.dtl")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for item in GameState.active_inventory().inventory:
		GameState.active_inventory().remove_item(item)
	
	Dialogic.start(timeline)
	
	Dialogic.timeline_ended.connect(switch_scene)

func switch_scene() -> void:
	GameState.change_scene("res://scenes/atatro/casa_ricos.tscn", "Sala")
