extends Node2D

var timeline: DialogicTimeline = preload("res://assets/timelines/atatro/donana_fim.dtl")

func _ready() -> void:
	Dialogic.signal_event.connect(final)

func final(event_name):
	if event_name == "matar_homem":
		self.hide()
		Dialogic.start(timeline)
