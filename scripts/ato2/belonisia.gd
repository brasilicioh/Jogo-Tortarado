extends Area2D

@export var selfnode: Node2D;
@export var targetnode: Node2D

func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	if get_parent().get_parent().name == "QuartoCrianca" and Dialogic.VAR.Ato2.interacted_with_belonisia_firsttime == true:
		selfnode.queue_free()
	else:
		GameState.state["alredy_talk"] = false

func _on_dialogic_signal(arg):
	print("Sinal recebido: ", arg)
	if arg == "destroy1":
		selfnode.queue_free()
	elif arg == "move":
		mover_personagem()

func interact() -> void:
	print("interagiu")
	Dialogic.start("ato_2")

func mover_personagem():
	var tween = create_tween()
	tween.tween_property(
		selfnode,
		"position",
		Vector2(targetnode.position.x, 0.0),
		2.0
	)
	await tween.finished
	selfnode.queue_free()
	GameState.state["alredy_talk"] = true
