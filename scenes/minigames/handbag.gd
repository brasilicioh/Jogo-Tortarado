extends TextureButton

var doll: ItemData = load("res://assets/items/handbag.tres")

func _on_pressed() -> void:
	GameState.main.load_minigame("brief_case")
