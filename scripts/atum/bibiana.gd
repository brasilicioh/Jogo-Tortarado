extends Node

var timeline: DialogicTimeline = preload("res://assets/timelines/atum/mala1.dtl")

func interact():
	Dialogic.start(timeline)

func _ready() -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", false)

	Dialogic.signal_event.connect(sucumba)

	interact()
	# Espera 2 segundo
	get_tree().create_timer(0.75).timeout.connect(andando)

func andando():
	print("passou")

	$Sprite2D.show()

	# Pega o ponto de destino
	var ponto_conversa = get_parent().get_node("PontoParada")

	# Faz o tween da posição atual até o ponto
	var tween = create_tween()
	tween.tween_property(
		self,
		"global_position",
		ponto_conversa.global_position,
		2.0
	)
	await tween.finished

func sucumba(event_name):
	if event_name == "bibiana_sair":
		UiManager.set_current_task("Fio de Corte: A Mala da Vovó")

		var ponto_sair_porta = get_parent().get_node("DoorTransition")
		var tween = create_tween()
		tween.tween_property(
			self,
			"global_position",
			ponto_sair_porta.global_position,
			2.0
		)

		await tween.finished
		self.queue_free()

func highlight(state: bool) -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", state)
