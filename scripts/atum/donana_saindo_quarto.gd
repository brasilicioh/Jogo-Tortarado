extends Area2D

var timeline: DialogicTimeline = preload("res://assets/timelines/atum/atum_3.dtl")

func interact():
	Dialogic.start(timeline)

func _ready() -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", false)
	Dialogic.signal_event.connect(sair)

func sair(event_name) -> void:
	if event_name == "donana_sair":
		self.queue_free()

func highlight(state: bool) -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", state)
