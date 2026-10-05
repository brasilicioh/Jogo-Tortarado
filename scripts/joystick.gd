extends VirtualJoystick


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.timeline_started.connect(_on_dialogue_started)
	Dialogic.timeline_ended.connect(_on_dialogue_ended)
	
func _on_dialogue_started():
	hide()
	
func _on_dialogue_ended():
	show()
