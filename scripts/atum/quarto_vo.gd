extends Node2D

var timeline: DialogicTimeline = preload("res://assets/timelines/atum/pos_faca.dtl")
var ida_irma = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ida_irma = get_node("IdaIrma")
	Dialogic.signal_event.connect(trocar_cena)

			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameState.state["gave_key"]:
		$disfarce.show()
	else:
		$disfarce.hide()
	if GameState.state["gave_knife"] and not GameState.state["cutscene_pos_faca"]:
		GameState.state["cutscene_pos_faca"] = true
		var player = null
		for chars in GameState.active_characters:
			if chars != GameState.active_player:
				for node in get_tree().get_nodes_in_group("player"):
					if node.character_id == chars:
						player = node
						continue
				continue
		var tween = create_tween()
		tween.tween_property(player, "global_position", ida_irma.global_position, 1.2)
		await tween.finished
		Dialogic.start(timeline)

func trocar_cena(event_name):
	if event_name == "dialogic_end":
		GameState.change_scene("res://scenes/atdois/quarto_crianca2.tscn", "Bedroom")
