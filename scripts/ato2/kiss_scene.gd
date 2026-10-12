extends Area2D

@export var severo: Node2D
@export var belonisia: Node2D  

var dialogo_iniciado := false
		
func _on_dialogic_signal(arg):
	print("Sinal recebido: ", arg)
	if arg == "seve_hide":
		severo.queue_free()
	elif arg == "destroy2":
		belonisia.queue_free()

func _ready() -> void:
	#body_entered.connect(_on_body_entered)
	Dialogic.signal_event.connect(_on_dialogic_signal)
	if Dialogic.VAR.Ato2.found_domingas:
		severo.visible = true
		belonisia.visible = true

func _process(delta: float) -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	print("ENTROU NA ÁREA: ", area.name)
	if !dialogo_iniciado:
		if Dialogic.VAR.Ato2.found_domingas:
			dialogo_iniciado = true
			Dialogic.start("kiss_scene")
