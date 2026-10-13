extends Node2D

var timeline: DialogicTimeline = preload("res://assets/timelines/atatro/donana_fim.dtl")
var timeline2: DialogicTimeline = preload("res://assets/timelines/atatro/donana_fim2.dtl")
var timeline3: DialogicTimeline = preload("res://assets/timelines/atatro/donana_fim3.dtl")

func _ready() -> void:
	Dialogic.signal_event.connect(final)

	await get_tree().create_timer(1.0).timeout
	$Donana_faca_1.show()
	await get_tree().create_timer(2.0).timeout
	$Donana_faca_1.hide()
	await get_tree().create_timer(2.0).timeout
	$Donana_faca_2.show()
	await get_tree().create_timer(2.0).timeout
	$Donana_faca_2.hide()
	await get_tree().create_timer(2.0).timeout
	$Donana_faca_3.show()
	await get_tree().create_timer(2.0).timeout
	$Donana_faca_3.hide()
	await get_tree().create_timer(2.0).timeout

	Dialogic.start(timeline)

func final(event_name):
	if event_name == "final":
		await get_tree().create_timer(1.0).timeout
		$Donana_quadro.show()
		await get_tree().create_timer(2.0).timeout
		$Donana_quadro.hide()
		
		await get_tree().create_timer(1.0).timeout
		$Belonisia_quadro.show()
		await get_tree().create_timer(2.0).timeout
		
		Dialogic.start(timeline2)
	
	elif event_name == "fim1":
		$Belonisia_quadro.hide()
		Dialogic.start(timeline3)
	
	elif event_name == "fimfim":
		$Fundo_faca.show()
