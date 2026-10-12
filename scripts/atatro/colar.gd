extends Area2D

var colar: ItemData = load("res://assets/items/colar.tres")
var timeline: DialogicTimeline = preload("res://assets/timelines/atatro/casa_ricos_colar.dtl")

func interact():
	hide()
	GameState.active_inventory().add_item(colar)
	Dialogic.start(timeline)

func _ready() -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", false)

func highlight(state: bool) -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", state)
