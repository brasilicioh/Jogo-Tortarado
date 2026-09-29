extends Control

@onready var speed_slider: HSlider = %SpeedSlider
@onready var toggle_animation_button: Button = %ToggleAnimation

func _ready() -> void:
	speed_slider.value_changed.connect(update_character_speed)
	toggle_animation_button.toggled.connect(toggle_animation)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("open_debug"):
		visible = not visible

func update_character_speed(value) -> void:
	var players = get_tree().get_nodes_in_group("player")
	
	for player in players:
		player.speed = value

func toggle_animation(value: bool):
	GameState.debug["toggle_animations"] = value
