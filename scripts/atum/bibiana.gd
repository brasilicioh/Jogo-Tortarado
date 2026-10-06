extends Node

var timeline: DialogicTimeline = preload("res://assets/timelines/atum/mala1.dtl")

func interact():
	Dialogic.start(timeline)

func _ready() -> void:
	Dialogic.signal_event.connect(sucumba)

func sucumba(event_name):
	if event_name == "suma":
		UiManager.set_current_task("Fio de Corte: A Mala da Vovó")
		self.queue_free()
