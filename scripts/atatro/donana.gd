extends Node2D

func _ready() -> void:
	Dialogic.signal_event.connect(final)

func final(event_name: String) -> void:
	if event_name == "matar_homem":
		GameState.load_cutscene("atatro/final_jogo")
