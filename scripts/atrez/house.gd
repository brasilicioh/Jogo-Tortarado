extends Node2D

var timeline: DialogicTimeline = load("res://assets/timelines/atrez/bedroom.dtl")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(handle_event)
	
	Dialogic.start(timeline)

func handle_event(event) -> void:
	if event == "undarken":
		# throw a tween later
		$ColorRect.modulate.a = 0
