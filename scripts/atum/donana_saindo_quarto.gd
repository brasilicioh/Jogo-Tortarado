extends Area2D

var timeline: DialogicTimeline = preload("res://assets/timelines/atum/atum_3.dtl")

var evento_iniciado := false

func _ready() -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", false)
	Dialogic.signal_event.connect(sair)

func iniciar_evento() -> void:
	var ponto_donana = get_parent().get_node("PontoDonana")
	var ida_irma = get_parent().get_node("IdaIrma")
	
	var player = null
	for chars in GameState.active_characters:
		if chars != GameState.active_player:
			for node in get_tree().get_nodes_in_group("player"):
				if node.character_id == chars:
					player = node
					continue
			continue

	var tween = create_tween()
	tween.tween_property(player, "global_position", ida_irma.global_position, 1.2)
	tween.tween_property(self, "global_position", ponto_donana.global_position, 2.2)

	Dialogic.start(timeline)

func sair(event_name) -> void:
	if event_name == "donana_sair":
		var ponto_saida_donana = get_parent().get_node("SaidaDonana")
		
		var tween = create_tween()
		tween.tween_property(self, "global_position", ponto_saida_donana.global_position, 2.0)
		
		await tween.finished
		queue_free()

func highlight(state: bool) -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", state)
