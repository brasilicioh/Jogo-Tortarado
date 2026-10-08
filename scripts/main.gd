extends Node2D

signal minigame_started
signal minigame_ended

signal cutscene_started
signal cutscene_ended

const PLAYER_SCENE = preload("res://scenes/player.tscn")

@onready var level_container = $Level
@onready var ui = $Ui
@onready var cutscene_container = $Cutscene

func _enter_tree() -> void:
	GameState.main = self

func _ready() -> void:
	GameState.main = self
	await get_tree().process_frame
	load_scene("res://scenes/outside.tscn", "Outside")

func new_player(player_position: Vector2, id: String):
	var player: Node2D = PLAYER_SCENE.instantiate()
	
	player.character_id = id
	player.global_position = player_position
	
	return player

func load_scene(scene: String, spawn_name: String):
	GameState.active_characters = []
	for child in level_container.get_children():
		child.free()
	
	var current_scene: Node2D = load(scene).instantiate()
	
	level_container.add_child(current_scene)
	
	var spawns: Array[Node] = get_tree().get_nodes_in_group("spawn point")

	for spawn in spawns:
		if spawn is SpawnMarker and spawn.name == spawn_name:
			spawn = spawn as SpawnMarker
			for character in spawn.spawn_characters:
				current_scene.add_child(
					new_player(spawn.global_position, character)
				)
				GameState.active_characters.append(character)
			if spawn.active_character != null:
				GameState.change_active_player(spawn.active_character)
			break

func load_minigame(minigame_name: String):
	var minigame: PackedScene = load("res://scenes/minigames/" + minigame_name + ".tscn")
	var instance = minigame.instantiate()
	# add a separate container later
	ui.add_child(instance)
	
	minigame_started.emit()

func load_cutscene(cutscene_name: String):
	var cutscene = load("res://scenes/cutscenes/" + cutscene_name + ".tscn").instantiate()
	
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 0.2)
	
	await tween.finished
	
	GameState.active_characters = []
	for child in level_container.get_children():
		child.queue_free()
	
	cutscene_container.add_child(cutscene)
	
	var tween2 = get_tree().create_tween()
	tween2.tween_property(self, "modulate:a", 1.0, 0.2)
	
	await tween2.finished
	
	cutscene_started.emit()

func end_minigame():
	#kill 8 billion minigames
	for minigame in get_tree().get_nodes_in_group("minigame"):
		minigame.queue_free()
	
	minigame_ended.emit()

func end_cutscene():
	#kill 8 billion ~minigames~cutscenes
	for cutscene in get_tree().get_nodes_in_group("cutscene"):
		cutscene.queue_free()
	
	cutscene_ended.emit()
