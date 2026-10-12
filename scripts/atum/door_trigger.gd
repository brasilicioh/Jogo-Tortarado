extends Area2D

var ativado := false

func _on_door_trigger_area_area_entered(area: Area2D) -> void:
	pass

func ativar() -> void:
	if ativado:
		return

	self.hide()
	ativado = true

	var donana = get_parent().get_parent().get_node("Donana")
	donana.iniciar_evento()
