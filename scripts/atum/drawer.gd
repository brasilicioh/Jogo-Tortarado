extends Area2D

var gave_handbag = false

func interact():
	GameState.main.load_minigame("drawer_closeup")
	
func highlight(state: bool) -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", state)
