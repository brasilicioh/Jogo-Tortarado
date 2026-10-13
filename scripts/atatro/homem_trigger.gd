extends Area2D

@export var cena := ""

var timeline: DialogicTimeline = preload("res://assets/timelines/atatro/homem_morto.dtl")
var timeline2: DialogicTimeline = preload("res://assets/timelines/atatro/homem_morto1.dtl")
var timeline3: DialogicTimeline = preload("res://assets/timelines/atatro/filha_morta.dtl")

var ativado: bool = false

func ativar() -> void:
	if ativado:
		return

	ativado = true
	self.hide()
	if cena == "2":
		Dialogic.start(timeline)
	elif cena == "1":
		Dialogic.start(timeline2)
	elif cena == "filha":
		Dialogic.start(timeline3)

func _on_area_entered(area: Area2D) -> void:
	ativar()
