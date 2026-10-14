extends Area2D

var decor: ItemData = load("res://assets/items/decor.tres")

func interact():
	if not GameState.inventories[GameState.active_player].has_item(decor) and Dialogic.VAR.Ato2.GaveItems.decor == false:
		GameState.inventories[GameState.active_player].add_item(decor)
		#UiManager.set_current_task("Espante os pássaros")
		Dialogic.VAR.Ato2.GaveItems.decor = true;
		$Sprite2D.hide()

func _ready() -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", false)

func highlight(state: bool) -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", state)
