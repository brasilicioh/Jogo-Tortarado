extends Area2D
@export var selfnode: Node2D;

func _on_dialogic_signal(arg):
	if arg == "destroy":
		selfnode.queue_free()
	elif arg == "show":
		selfnode.show()
	elif arg == "leave":
		sair_personagem()
	elif arg == "enter":
		entra_personagem()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start("severo_appears")
	Dialogic.signal_event.connect(_on_dialogic_signal)

func sair_personagem():
	selfnode.scale.x = 1.0
	var tween = create_tween()
	tween.tween_property(
		selfnode,
		"position",
		Vector2(1077.0, 0.0),
		2.0
	)
	await tween.finished
	selfnode.queue_free()
	
func entra_personagem():
	var tween = create_tween()
	tween.tween_property(
		selfnode,
		"position",
		Vector2(677.0, 0.0),
		2.0
	)
	
