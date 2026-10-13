extends Area2D

func interact():
	$CanvasModulate.color = Color(0.0, 0.0, 0.0, 1.0)
	GameState.load_cutscene("atrez/cutscene")
