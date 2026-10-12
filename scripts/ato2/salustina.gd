extends Node2D

@export var selfnode: Node2D;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Dialogic.VAR.Ato2.second_intro_played == false:
		Dialogic.start("salutana_appears2")
		Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(arg):
	print("Sinal recebido: ", arg)
	if arg == "destroy1":
		selfnode.queue_free()
	elif arg == "show":
		selfnode.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
