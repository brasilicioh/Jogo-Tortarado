extends Area2D

var timeline: DialogicTimeline = load("res://assets/timelines/tutorial/clothes.dtl")

func _ready():
	Dialogic.signal_event.connect(test)

func interact():
	Dialogic.start(timeline)

func test(stri):
	if stri == "clothe_choosen":
		print("aaa")
