extends Node2D

var timeline: DialogicTimeline = preload("res://assets/timelines/atatro/donana_sozinha.dtl")
var timeline2: DialogicTimeline = preload("res://assets/timelines/atatro/pos_casa_ricos.dtl")

var ja_falou: bool = false

func _ready() -> void:
	UiManager.set_current_task("Colete os pertences")

	if not ja_falou:
		Dialogic.start(timeline)
	
	Dialogic.signal_event.connect(event)

func event(name):
	if name == "fim_cutscene":
		self.show()
		ja_falou = true
	elif name == "pegou_faca":
		self.hide()
		Dialogic.start(timeline2)
	elif name == "prox_cena":
		GameState.change_scene("res://scenes/atatro/outside_donana.tscn", "Spawn")
