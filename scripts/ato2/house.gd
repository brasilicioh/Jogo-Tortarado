extends Node2D

var timeline: DialogicTimeline = preload("res://assets/timelines/ato2/house.dtl")

# Called when the node eters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(funcao)
	if Dialogic.VAR.Ato2.GaveItems.cups:
		$Background2/CupsGiver.hide()
	if Dialogic.VAR.Ato2.GaveItems.decor:
		$Background2/DecorGiver.hide()	
	if not GameState.state.get("alredy_exit"):
		Dialogic.start(timeline)
		GameState.state["alredy_exit"] = true

func _process(delta: float) -> void:
	if not (Dialogic.VAR.Ato2.PutItems.cups and Dialogic.VAR.Ato2.PutItems.cloth and Dialogic.VAR.Ato2.PutItems.decor):
		$DoorTransition.process_mode = Node.PROCESS_MODE_DISABLED
	else:
		$DoorTransition.process_mode = Node.PROCESS_MODE_INHERIT

func funcao(name):
	if name == "ir_outside_ato2":
		GameState.change_scene("res://scenes/atdois/outside3.tscn","OutsideMarker2")
