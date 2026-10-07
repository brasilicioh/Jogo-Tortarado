extends Area2D

var knife: ItemData = load("res://assets/items/knife.tres")
var mala: ItemData = load("res://assets/items/rock.tres")

@export var door: DoorTransition

func interact():
	GameState.active_inventory().add_item(knife)
	GameState.active_inventory().add_item(mala)
	
	door.process_mode = Node.PROCESS_MODE_INHERIT
	
	queue_free()
