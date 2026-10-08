extends Node2D

var timeline: DialogicTimeline = preload("res://assets/timelines/tutorial/salustina.dtl")

func _ready() -> void:
	Dialogic.start(timeline)
