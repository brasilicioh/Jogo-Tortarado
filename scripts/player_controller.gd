extends CharacterBody2D

enum STATE {
	IDLE,
	WALK_LEFT,
	WALK_RIGHT
}

var state := STATE.IDLE

var speed = 300.0

@export var ground_raycast: RayCast2D
@export var interaction_area: Area2D

var nearby_interactable: Node = null
var can_interact: bool = true

@export var character_id: String
@export var can_move: bool = true

@onready var sprite: AnimatedSprite2D = $Sprite

func _ready() -> void:
	Dialogic.timeline_started.connect(_on_dialogue_started)
	Dialogic.timeline_ended.connect(_on_dialogue_ended)
	
	GameState.main.minigame_started.connect(_on_minigame_started)
	GameState.main.minigame_ended.connect(_on_minigame_ended)

func set_controlled(controlled: bool):
	if controlled:
		$Camera2D.enabled = true
	else:
		$Camera2D.enabled = false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if character_id == GameState.active_player and can_move:
			var direction := Input.get_axis("left", "right")
			velocity.x = direction * speed
			
			if direction > 0:
				state = STATE.WALK_RIGHT
			elif direction < 0:
				state = STATE.WALK_LEFT
			else:
				state = STATE.IDLE
	else:
		state = STATE.IDLE
		velocity.x = 0
	
	move_and_slide()

func _process(_delta: float) -> void:
	$Camera2D.enabled = character_id == GameState.active_player
	
	if GameState.debug.get("toggle_animations", false):
		match state:
			STATE.IDLE:
				sprite.play("idle")
			STATE.WALK_LEFT:
				sprite.flip_h = true
				sprite.play("walk")
			STATE.WALK_RIGHT:
				sprite.flip_h = false
				sprite.play("walk")
	else:
		sprite.play("normal")

func _input(event: InputEvent) -> void:
	if character_id == GameState.active_player\
	   and can_interact:
		if event.is_action_pressed("interact") and nearby_interactable:
			# try to use item
			if GameState.held_item_index() != -1 and\
			   nearby_interactable.has_method("use_item"):
				nearby_interactable.use_item(GameState.held_item())
				GameState.active_inventory().current_item = -1
			# normal interact
			elif GameState.held_item_index() == -1 and\
			   nearby_interactable.has_method("interact"):
				nearby_interactable.interact()

func _on_interaction_area_area_entered(area: Area2D) -> void:
	if area.has_method("interact") or area.has_method("use_item")\
	   and can_interact:
		if area.has_method("highlight"):
			area.highlight(true)
		nearby_interactable = area

func _on_interaction_area_area_exited(area: Area2D) -> void:
	if area == nearby_interactable:
		if area.has_method("highlight"):
			area.highlight(false)
		nearby_interactable = null

func _on_minigame_started():
	can_move = false
	can_interact = false

func _on_minigame_ended():
	can_move = true
	can_interact = true

func _on_dialogue_started() -> void:
	can_move = false
	can_interact = false

func _on_dialogue_ended() -> void:
	can_move = true
	can_interact = true
	
