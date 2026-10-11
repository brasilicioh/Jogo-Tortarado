extends Area2D

@export var severo: Node2D
@export var belonisia: Node2D  

func _on_body_entered(body):
	if Dialogic.VAR.Ato2.found_domingas:
		Dialogic.start("kiss_scene")
		
func _on_dialogic_signal(arg):
	print("Sinal recebido: ", arg)
	if arg == "seve_hide":
		severo.queue_free()
	elif arg == "destroy2":
		belonisia.queue_free()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	Dialogic.signal_event.connect(_on_dialogic_signal)
	if Dialogic.VAR.Ato2.found_domingas:
		severo.visible = true
		belonisia.visible = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
