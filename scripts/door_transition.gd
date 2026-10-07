class_name DoorTransition
extends Area2D

@export_file("*.tscn") var target_scene
@export var spawn_point: String

func _ready() -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", false)

func interact():
	print(target_scene, spawn_point)
	GameState.change_scene(target_scene, spawn_point)

func highlight(state: bool) -> void:
	if $Sprite2D is Node:
		$Sprite2D.set_instance_shader_parameter("outline_enabled", state)
