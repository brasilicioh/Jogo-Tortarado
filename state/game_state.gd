extends Node

const PLAYER_SCENE = preload("res://scenes/player.tscn")

var state = {};

signal active_player_changed
signal inventory_updated

var active_player: String

# indexed by player id
var inventories: Dictionary[String, Inventory] = {}

var active_characters: Array[String] = []

# just throw things in here if you need any debugging option
var debug: Dictionary[String, Variant]

## x start, x end, y start, y end
var camera_limits: Array[int] = [INT64_MIN, INT64_MAX, INT64_MAX, INT64_MIN]

var no_left := false

var main

#TODO: get id to change here later
func change_active_player(new_active_player: String):
	active_player = new_active_player
	
	for player in get_tree().get_nodes_in_group("player"):
		player.set_controlled(
			player.character_id == active_player
		)
	
	active_player_changed.emit()

func active_inventory() -> Inventory:
	return inventories.get_or_add(active_player, Inventory.new())

func held_item_index() -> int:
	return active_inventory().current_item

func held_item() -> ItemData:
	return active_inventory().inventory[held_item_index()]

func change_scene(scene: String, spawn_name: String):
	no_left = false
	main.load_scene(scene, spawn_name)

func load_cutscene(scene: String):
	main.load_cutscene(scene)
