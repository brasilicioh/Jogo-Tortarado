extends Node2D

func _ready() -> void:
	$AnimationPlayer.play("test_animation")

func end_scene() -> void:
	GameState.main.end_cutscene()
	
	GameState.change_scene("res://scenes/outside.tscn", "Outside")
