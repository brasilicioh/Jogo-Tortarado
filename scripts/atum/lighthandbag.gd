extends TextureButton
var faca: ItemData = load("res://assets/items/faca.tres")

func _on_pressed():
	GameState.state["gave_knife"] = true
	GameState.main.end_minigame()
	
