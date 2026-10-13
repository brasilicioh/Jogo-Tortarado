extends Area2D

var falando_sobre_inventario: DialogicTimeline = load("res://assets/timelines/tutorial/inventario.dtl")
var ja_falou: bool = false

func interact():
	if not GameState.state["gave_doll"]:
		GameState.main.load_minigame("closet_closeup")
	else:
		Dialogic.start(falando_sobre_inventario)

func _process(delta: float) -> void:
	if GameState.state["gave_doll"] and !ja_falou:
		Dialogic.start(falando_sobre_inventario)
		ja_falou = true
