extends Area2D

var gave_doll = false

func interact():
	if not gave_doll:
		GameState.main.load_minigame("closet_closeup")
		gave_doll = true
