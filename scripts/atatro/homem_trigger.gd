extends Area2D

var timeline: DialogicTimeline = preload("res://assets/timelines/atatro/homem_morto.dtl")
var ativado: bool = false

func ativar() -> void:
	if ativado:
		return

	ativado = true
	self.hide()
	Dialogic.start(timeline)

func _on_area_entered(area: Area2D) -> void:
	ativar()
