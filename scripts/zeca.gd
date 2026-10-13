extends Area2D

var rock: ItemData = load("res://assets/items/rock.tres")
var timeline: DialogicTimeline = load("res://assets/timelines/tutorial/zeca.dtl")

func _ready() -> void:
	$Sprite2D.play("default")
	Dialogic.signal_event.connect(event_signal)

func interact():
	Dialogic.start(timeline)
	#if not GameState.inventories[GameState.active_player].has_item(rock) and not gave_rock:
		#GameState.inventories[GameState.active_player].add_item(rock)
		#UiManager.set_current_task("Espante os pássaros")
		#gave_rock = true;

func event_signal(event):
	if event == "give_rock":
		$Sprite2D.play("give_rock")
		await $Sprite2D.animation_looped
		$Sprite2D.play("default")
		GameState.inventories[GameState.active_player].add_item(rock)
		UiManager.set_current_task("Espante os pássaros")
