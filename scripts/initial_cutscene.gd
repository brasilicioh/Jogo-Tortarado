extends Node2D



func _on_video_stream_player_finished() -> void:
	GameState.change_scene("res://tutorial/bedroom.tscn", "QuartoMeninas")
