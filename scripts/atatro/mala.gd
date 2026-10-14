extends Area2D

var mala: ItemData = load("res://assets/items/mala.tres")
var timeline: DialogicTimeline = preload("res://assets/timelines/atatro/casa_ricos_mala.dtl")

func interact():
	self.queue_free()
	GameState.active_inventory().add_item(mala)
	Dialogic.start(timeline)

func _ready() -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", false)

func highlight(state: bool) -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", state)
