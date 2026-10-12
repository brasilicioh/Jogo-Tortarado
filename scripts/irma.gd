extends Area2D

var timeline_salustiana: DialogicTimeline = preload("res://assets/timelines/tutorial/salustina.dtl")
var timeline: DialogicTimeline = preload("res://assets/timelines/tutorial/domingas.dtl")
var doll: ItemData = load("res://assets/items/doll.tres")

func _ready() -> void:
	$Sprite2D.play("crying")

func interact():
	Dialogic.start(timeline)

func use_item(item: ItemData):
	if GameState.held_item() == doll:
		Dialogic.VAR.Tutorial.gave_doll = true
		GameState.active_inventory().remove_item(item)
		
		$Sprite2D.play("with_doll")
		
		UiManager.set_current_task("Troque para Belonísia")
		
		Dialogic.start(timeline)
		
		add_sister()
		GameState.active_player_changed.connect(load_belonisia)

func add_sister() -> void:
	GameState.active_characters.append("belonisia")

func load_belonisia() -> void:
	if GameState.active_player == "belonisia":
		Dialogic.start(timeline_salustiana)
		GameState.active_player_changed.disconnect(load_belonisia)
		GameState.active_characters.erase("belonisia")
