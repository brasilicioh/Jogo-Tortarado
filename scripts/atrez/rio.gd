extends Area2D

func interact(_unused):
	$CanvasModulate.color = Color(0.0, 0.0, 0.0, 1.0)
	GameState.load_cutscene("atrez/cutscene")
