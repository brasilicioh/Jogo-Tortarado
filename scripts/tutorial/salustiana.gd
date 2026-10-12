extends Area2D

var timeline_salustiana: DialogicTimeline = preload("res://assets/timelines/tutorial/salustina.dtl")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.active_player_changed.connect(load_belonisia)

func interact():
	Dialogic.start(timeline_salustiana)

func load_belonisia() -> void:
	if GameState.active_player == "belonisia":
		Dialogic.start(timeline_salustiana)
		GameState.active_player_changed.disconnect(load_belonisia)
		GameState.active_characters.erase("belonisia")
