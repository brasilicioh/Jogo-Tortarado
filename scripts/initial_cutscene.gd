extends Node2D

func _ready() -> void:
	if $VideoStreamPlayer.stream == null:
		_on_video_stream_player_finished()

func _on_video_stream_player_finished() -> void:
	GameState.change_scene("res://scenes/tutorial/bedroom.tscn", "QuartoMeninas")
