extends Area2D

@export var target: Vector2

func interact() -> void:
	for player in get_tree().get_nodes_in_group("player") as Array[Node2D]:
		if player.character_id == GameState.active_player:
			player.global_position = target
