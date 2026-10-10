extends Area2D

var timeline: DialogicTimeline = preload("res://assets/timelines/atum/interacao_donana_salustiana.dtl")

func interact():
	Dialogic.start(timeline)

func _ready() -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", false)

func highlight(state: bool) -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", state)
