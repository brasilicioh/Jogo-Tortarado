extends Area2D

@export var domingas: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	
func _on_dialogic_signal(arg):
	print("Sinal recebido: ", arg)
	if arg == "destroy":
		domingas.queue_free()
	elif arg == "show":
		domingas.show()

func interact() -> void:
	print("interagiu")
	Dialogic.start("find_domingas")
	UiManager.set_current_task("Vá para dentro e fale com sua irmã")
