extends Area2D

var doll: ItemData = load("res://assets/items/doll.tres")

func _ready():
	_on_mouse_entered()

func _on_mouse_entered() -> void:
	GameState.active_inventory().add_item(doll)
	
	GameState.main.minigame_ended.emit()
