extends Area2D

@export var severo: Node2D
@export var belonisia: Node2D  

var dialogo_iniciado := false

func _on_dialogic_signal(arg):
	if arg == "seve_hide":
		var tween = create_tween()
		tween.tween_property(severo, "global_position", $Saida.global_position, 3)
		await tween.finished
		severo.queue_free()

func _ready() -> void:
	#body_entered.connect(_on_body_entered)
	Dialogic.signal_event.connect(_on_dialogic_signal)
	if Dialogic.VAR.Ato2.found_domingas:
		severo.visible = true
		belonisia.visible = true

func _on_area_entered(area: Area2D) -> void:
	if !dialogo_iniciado:
		if Dialogic.VAR.Ato2.found_domingas:
			dialogo_iniciado = true
			var tween = create_tween()
			tween.tween_property(belonisia, "global_position", $IdaBelo.global_position, 2)
			tween.tween_property(severo, "global_position", $IdaSevero.global_position, 2.5)
			Dialogic.start("kiss_scene")
