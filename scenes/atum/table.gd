extends Area2D

func interact():
	GameState.main.load_minigame("mesaCloseUp")
	
func highlight(state: bool) -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", state)
