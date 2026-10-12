extends Node2D

var timeline: DialogicTimeline = load("res://assets/timelines/atrez/cutscene.dtl")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start(timeline)
	
	Dialogic.timeline_ended.connect(switch_scene)

func switch_scene() -> void:
	#TODO: switch scene here
	print("change scene")
