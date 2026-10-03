extends Area2D

var timeline: DialogicTimeline = preload("res://assets/timelines/tutorial/salustina.dtl")

func interact():
	Dialogic.start(timeline)
