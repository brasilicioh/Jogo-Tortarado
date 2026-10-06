extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(show_severo)

func show_severo(type):
	if type == "severo":
		$Severo.show()
