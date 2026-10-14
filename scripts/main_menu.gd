extends Control

@export var first_scene: PackedScene

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			start_game()

	elif event is InputEventScreenTouch:
		if event.pressed:
			start_game()

func start_game() -> void:
	if OS.has_feature("web"):
		JavaScriptBridge.eval(
			"(async () => {"
			+ "try {"
			+ "if (!document.fullscreenElement && document.documentElement.requestFullscreen) "
			+ "await document.documentElement.requestFullscreen();"
			+ "if (screen.orientation && screen.orientation.lock) "
			+ "await screen.orientation.lock('landscape');"
			+ "} catch (error) { console.warn('Fullscreen/orientation unavailable:', error); }"
			+ "})();"
		)
	if first_scene:
		get_tree().change_scene_to_packed(first_scene)
