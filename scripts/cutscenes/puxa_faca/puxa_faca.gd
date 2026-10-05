extends Sprite2D

signal lost

var pulling_force: float = 5.0
var is_ended: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (is_ended):
		return

	if Input.is_action_just_pressed("interact"):
		pulling_force = clampf(0.0, pulling_force + 0.2, 5.0)
	pulling_force -= delta

	if pulling_force < 3.3:
		texture = load("res://.godot/imported/crow.png-41f65ff959041b8e8262287e4acd208a.ctex")
		print("perdendo")
		if pulling_force <= 0:
			pulling_force = 0
	elif pulling_force < 6.6:
		texture = load("res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex")
		print("meio")
	elif pulling_force < 9.9:
		texture = load("res://.godot/imported/doll.png-ca2d96423cf66c5cc6bf28a9dec44652.ctex")
		print("ganhando")
	else:
		texture = load("")
		print("Ganhou")
		is_ended = true
