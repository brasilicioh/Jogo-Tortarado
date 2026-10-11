extends Area2D
@export var selfnode: Node2D;

func _on_dialogic_signal(arg):
	print("Sinal recebido: ", arg)
	if arg == "destroy":
		selfnode.queue_free()
	elif arg == "show":
		selfnode.show()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start("severo_appears")
	Dialogic.signal_event.connect(_on_dialogic_signal)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
