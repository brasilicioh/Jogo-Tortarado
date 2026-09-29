extends Node

@export var camera_limits: Array[int] = [-INF, INF, -INF, INF]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	UiManager.set_current_task("Complete o tutorial: Ajudando Domingas")
	
	GameState.camera_limits = camera_limits
