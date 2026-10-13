extends Node2D

signal minigame_started
signal minigame_ended

signal cutscene_started
signal cutscene_ended

signal interrupt_ui

const PLAYER_SCENE = preload("res://scenes/player.tscn")

@onready var level_container = $Level
@onready var ui = $Ui
@onready var cutscene_container = $Cutscene

var is_loading_scene := false

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
	if is_loading_scene:
		return
	
	interrupt_ui.emit()
	
	is_loading_scene = true
	
	ui.hide()
	
	var tween = get_tree().create_tween()
	tween.set_parallel()
	tween.tween_property(self, "modulate:r", 0.0, 0.75)
	tween.tween_property(self, "modulate:g", 0.0, 0.75)
	tween.tween_property(self, "modulate:b", 0.0, 0.75)
	
	await tween.finished
	
	GameState.active_characters = []
	for child in level_container.get_children():
		child.queue_free()
	
	await get_tree().process_frame
	
	var current_scene: Node2D = load(scene).instantiate()

	var spawns: Array[Node] = current_scene.find_children(
		"*",
		"SpawnMarker",
		true,
		false
	)
	
	level_container.add_child(current_scene)

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
	
	is_loading_scene = false
	
	var tween2 = get_tree().create_tween()
	tween2.set_parallel()
	tween2.tween_property(self, "modulate:r", 1.0, 0.75)
	tween2.tween_property(self, "modulate:g", 1.0, 0.75)
	tween2.tween_property(self, "modulate:b", 1.0, 0.75)
	
	ui.show()

func load_minigame(minigame_name: String):
	interrupt_ui.emit()
	
	#var tween = get_tree().create_tween()
	#tween.set_parallel()
	#tween.tween_property(self, "modulate:r", 0.0, 0.75)
	#tween.tween_property(self, "modulate:g", 0.0, 0.75)
	#tween.tween_property(self, "modulate:b", 0.0, 0.75)
	#
	#await tween.finished
	
	var minigame: PackedScene = load("res://scenes/minigames/" + minigame_name + ".tscn")
	var instance = minigame.instantiate()
	# add a separate container later
	ui.add_child(instance)
	
	#var tween2 = get_tree().create_tween()
	#tween2.set_parallel()
	#tween2.tween_property(self, "modulate:r", 1.0, 0.75)
	#tween2.tween_property(self, "modulate:g", 1.0, 0.75)
	#tween2.tween_property(self, "modulate:b", 1.0, 0.75)
	#
	#await tween2.finished
	
	minigame_started.emit()

func load_cutscene(cutscene_name: String):
	interrupt_ui.emit()
	
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
	#var tween = get_tree().create_tween()
	#tween.set_parallel()
	#tween.tween_property(self, "modulate:r", 0.0, 0.75)
	#tween.tween_property(self, "modulate:g", 0.0, 0.75)
	#tween.tween_property(self, "modulate:b", 0.0, 0.75)
	#
	#await tween.finished
	
	#kill 8 billion minigames
	for minigame in get_tree().get_nodes_in_group("minigame"):
		minigame.queue_free()
		
	minigame_ended.emit()
	
	#var tween2 = get_tree().create_tween()
	#tween2.set_parallel()
	#tween2.tween_property(self, "modulate:r", 1.0, 0.75)
	#tween2.tween_property(self, "modulate:g", 1.0, 0.75)
	#tween2.tween_property(self, "modulate:b", 1.0, 0.75)

func end_cutscene():
	#kill 8 billion ~minigames~cutscenes
	for cutscene in get_tree().get_nodes_in_group("cutscene"):
		cutscene.queue_free()
	
	cutscene_ended.emit()
