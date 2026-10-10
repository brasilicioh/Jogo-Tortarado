extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start("ato_2.dtl")
	print("dialogic começou")
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
	
func interact() -> void:
	print("interagiu")
	Dialogic.VAR.Ato2.interacted_with_belonisia_firsttime = true
	Dialogic.start("ato_2")
	
