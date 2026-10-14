extends Control

func _ready() -> void:
	if $VideoStreamPlayer.stream == null:
		_on_video_stream_player_finished()

func _on_video_stream_player_finished() -> void:
	GameState.change_scene("res://scenes/tutorial/bedroom.tscn", "QuartoMeninas")


func _on_video_stream_player_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		_on_video_stream_player_finished()
