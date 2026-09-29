extends Control

@onready var speed_slider: HSlider = %SpeedSlider
@onready var toggle_animation_button: Button = %ToggleAnimationButton
@onready var scene_path: LineEdit = %ScenePath
@onready var spawn_point_name: LineEdit = %SpawnPointName
@onready var submit_scene_button: Button = %SubmitSceneButton


func _ready() -> void:
	speed_slider.value_changed.connect(update_character_speed)
	toggle_animation_button.toggled.connect(toggle_animation)
	submit_scene_button.pressed.connect(change_scene)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("open_debug"):
		visible = not visible

func update_character_speed(value) -> void:
	var players = get_tree().get_nodes_in_group("player")
	
	for player in players:
		player.speed = value

func toggle_animation(value: bool):
	GameState.debug["toggle_animations"] = value

func change_scene():
	if scene_path.text.strip_edges() != "" and\
	   spawn_point_name.text.strip_edges() != "":
		GameState.change_scene(
			"res://scenes/" + scene_path.text.strip_edges() + ".tscn",
			spawn_point_name.text.strip_edges()
		)
