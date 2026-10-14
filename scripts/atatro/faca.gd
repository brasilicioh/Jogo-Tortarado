extends Area2D

var faca: ItemData = load("res://assets/items/faca.tres")
var timeline: DialogicTimeline = preload("res://assets/timelines/atatro/casa_ricos_faca.dtl")

func interact():
	self.queue_free()
	GameState.active_inventory().add_item(faca)
	Dialogic.start(timeline)

func _ready() -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", false)

func highlight(state: bool) -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", state)
