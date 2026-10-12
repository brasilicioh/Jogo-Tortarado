extends Area2D

func interact():
	if not GameState.state["gave_doll"]:
		GameState.main.load_minigame("closet_closeup")
