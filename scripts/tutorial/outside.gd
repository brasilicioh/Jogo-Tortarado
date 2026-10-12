extends Node2D

var timeline: DialogicTimeline = load("res://assets/timelines/tutorial/zeca_boogaloo.dtl")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.main.minigame_ended.connect(minigame_ended)

func minigame_ended():
	$DoorTransition.process_mode = Node.PROCESS_MODE_INHERIT
	$Zeca.queue_free()
	Dialogic.start(timeline)
