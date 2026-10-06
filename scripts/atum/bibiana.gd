extends Node

var timeline: DialogicTimeline = preload("res://assets/timelines/atum/mala1.dtl")

func interact():
	Dialogic.start(timeline)

func _ready() -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", false)
	Dialogic.signal_event.connect(sucumba)

func sucumba(event_name):
	if event_name == "belonisia_sair":
		UiManager.set_current_task("Fio de Corte: A Mala da Vovó")
		self.queue_free()

func highlight(state: bool) -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", state)
