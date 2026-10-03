extends TextureButton

var doll: ItemData = load("res://assets/items/doll.tres")

func _on_pressed() -> void:
	hide()
	GameState.active_inventory().add_item(doll)
	GameState.main.end_minigame()
