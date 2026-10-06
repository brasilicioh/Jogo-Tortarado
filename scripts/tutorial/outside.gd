extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.main.minigame_ended.connect(enable_house_door)

func enable_house_door():
	$DoorTransition.process_mode = Node.PROCESS_MODE_INHERIT
