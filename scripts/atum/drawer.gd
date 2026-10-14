extends Area2D

var timeline: DialogicTimeline = preload("res://assets/timelines/atum/locked_drawer.dtl")

func interact():
	if not GameState.state["opened_drawer"]:
		Dialogic.start(timeline)
		return
	if not GameState.state["briefcase_opened"]:
		GameState.main.load_minigame("drawer_closeup")
		GameState.load_audio("res://assets/sounds/atum/abrindo_gaveta.mp3")
	elif not GameState.state["gave_knife"]:
		GameState.main.load_minigame("lightBriefcase_closeup")
		GameState.load_audio("res://assets/sounds/atum/abrindo_gaveta.mp3")
	else:
		return
		GameState.main.load_minigame("openBriefcase_closeup")
		GameState.load_audio("res://assets/sounds/atum/abrindo_gaveta.mp3")
	
func use_item(item: ItemData):
	if item.id == "key":
		GameState.active_inventory().remove_item(item)
		GameState.state["opened_drawer"] = true

func highlight(state: bool) -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", state)
