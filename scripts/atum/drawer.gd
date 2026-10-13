extends Area2D


func interact():
	if not GameState.state["opened_drawer"]:
		return
	if not GameState.state["briefcase_opened"]:
		GameState.main.load_minigame("drawer_closeup")
	elif not GameState.state["gave_knife"]:
		GameState.main.load_minigame("lightBriefcase_closeup")
	else:
		GameState.main.load_minigame("openBriefcase_closeup")
	
func use_item(item: ItemData):
	if item.id == "key":
		GameState.active_inventory().remove_item(item)
		GameState.state["opened_drawer"] = true

func highlight(state: bool) -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", state)
