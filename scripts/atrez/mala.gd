extends Area2D

var timeline: DialogicTimeline = load("res://assets/timelines/atrez/bedroom.dtl")

var knife: ItemData = load("res://assets/items/faca.tres")
var mala: ItemData = load("res://assets/items/mala.tres")

# no need for a "used" variable as the object is deleted after use

@export var teleporter: Area2D
@export var door: DoorTransition

func _ready() -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", false)

	Dialogic.signal_event.connect(handle_event)

func interact():
	Dialogic.start(timeline)
	# you can't move anyways, so the door already works on dialogue start
	door.process_mode = Node.PROCESS_MODE_INHERIT
	teleporter.process_mode = Node.PROCESS_MODE_INHERIT

func handle_event(event) -> void:
	if event == "give_items":
		GameState.active_inventory().add_item(knife)
	elif event == "ended":
		GameState.active_inventory().add_item(mala)
		queue_free()

func highlight(state: bool) -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", state)
