extends Area2D

@export var selfnode: Node2D;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	if get_parent().get_parent().name == "QuartoCrianca" and Dialogic.VAR.Ato2.interacted_with_belonisia_firsttime == true:
		selfnode.queue_free()

func _on_dialogic_signal(arg):
	print("Sinal recebido: ", arg)
	if arg == "destroy":
		selfnode.queue_free()

func interact() -> void:
	print("interagiu")
	Dialogic.start("ask_domingas")
