extends Node

var timeline: DialogicTimeline = load("res://assets/timelines/tutorial/tutorial.dtl")
@export var camera_limits: Array[int] = [INT64_MIN, INT64_MAX, INT64_MAX, INT64_MIN]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if DisplayServer.is_touchscreen_available():
		Dialogic.VAR.is_touchscreen = true
	Dialogic.start(timeline)
	UiManager.set_current_task("Complete o tutorial: Ajudando Domingas")
	
	GameState.camera_limits = camera_limits
