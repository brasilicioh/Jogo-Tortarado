extends Button

func _ready() -> void:
	if DisplayServer.is_touchscreen_available():
		show()
	
	Dialogic.timeline_started.connect(_on_dialogue_started)
	Dialogic.timeline_ended.connect(_on_dialogue_ended)
	
func _on_dialogue_started():
	hide()
	
func _on_dialogue_ended():
	if DisplayServer.is_touchscreen_available():
		show()

func _on_pressed() -> void:
	Input.action_press("change_character")
	Input.action_release("change_character")
