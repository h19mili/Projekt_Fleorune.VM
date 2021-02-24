extends "res://Scripts/World/Hostile_Area.gd"

func _process(delta):
	if rull == 1:
		get_tree().change_scene("res://Scenes/Enemies/Bandit.tscn")
