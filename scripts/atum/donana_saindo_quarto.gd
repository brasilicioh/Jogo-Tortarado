extends Area2D

var timeline: DialogicTimeline = preload("res://assets/timelines/atum/atum_3.dtl")

var evento_iniciado := false

func _ready() -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", false)
	Dialogic.signal_event.connect(sair)

func iniciar_evento() -> void:
	var ponto_donana = get_parent().get_node("PontoDonana")
	
	var tween = create_tween()
	tween.tween_property(self, "global_position", ponto_donana.global_position, 5.0)
	
	await tween.finished
	
	Dialogic.start(timeline)

func sair(event_name) -> void:
	if event_name == "donana_sair":
		queue_free()

func highlight(state: bool) -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", state)
