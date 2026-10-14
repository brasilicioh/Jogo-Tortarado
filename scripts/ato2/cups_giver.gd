extends Area2D

var cups: ItemData = load("res://assets/items/cups.tres")

func interact():
	if not GameState.inventories[GameState.active_player].has_item(cups) and Dialogic.VAR.Ato2.GaveItems.cups == false:
		GameState.inventories[GameState.active_player].add_item(cups)
		#UiManager.set_current_task("Espante os pássaros")
		Dialogic.VAR.Ato2.GaveItems.cups = true;
		$Sprite2D.hide()

func _ready() -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", false)

func highlight(state: bool) -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", state)
