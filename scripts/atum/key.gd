extends TextureButton

var key: ItemData = load("res://assets/items/key.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameState.state["gave_key"]:
		queue_free()


func _on_pressed() -> void:
	print("clique registrado")
	if not GameState.state["gave_key"]:
		queue_free()
		GameState.state["gave_key"] = true
		GameState.inventories[GameState.active_player].add_item(key)
