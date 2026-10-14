extends Area2D

@export var domingas: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	
func _on_dialogic_signal(arg):
	if arg == "destroy":
		var tween = create_tween()
		tween.tween_property(domingas, "global_position", $SaidaDomingas.global_position, 1)
		await tween.finished
		domingas.queue_free()
	elif arg == "show":
		$DomingasEscondida.queue_free()
		domingas.show()

func interact() -> void:
	Dialogic.start("find_domingas")
	UiManager.set_current_task("Vá para dentro e fale com sua irmã")
