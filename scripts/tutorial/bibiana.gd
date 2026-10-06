extends Area2D

var timeline: DialogicTimeline = load("res://assets/timelines/tutorial/clothes.dtl")

func interact():
	Dialogic.start(timeline)
