extends Node2D

# Called when the node enters the scene tree for the first time.
func _process(delta: float) -> void:
	if GameState.state.get("alredy_talk"):
		$DoorTransition.process_mode = Node.PROCESS_MODE_INHERIT
	else:
		$DoorTransition.process_mode = Node.PROCESS_MODE_DISABLED
