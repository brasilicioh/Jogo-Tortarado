extends Area2D

var timeline: DialogicTimeline = load("res://assets/timelines/atrez/bedroom.dtl")

var knife: ItemData = load("res://assets/items/knife.tres")
var mala: ItemData = load("res://assets/items/rock.tres")

# no need for a "used" variable as the object is deleted after use

@export var door: DoorTransition

func _ready() -> void:
	Dialogic.signal_event.connect(handle_event)

func interact():
	Dialogic.start(timeline)
	# you can't move anyways, so the door already works on dialogue start
	door.process_mode = Node.PROCESS_MODE_INHERIT

func handle_event(event) -> void:
	if event == "give_items":
		GameState.active_inventory().add_item(knife)
		GameState.active_inventory().add_item(mala)
	elif event == "ended":
		queue_free()
