extends Area2D

var timeline: DialogicTimeline = load("res://assets/timelines/tutorial/clothes.dtl")

func entered(body: Node2D) -> void:
	Dialogic.start(timeline)
