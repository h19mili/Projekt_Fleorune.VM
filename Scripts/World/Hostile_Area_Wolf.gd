extends "res://Scripts/World/Hostile_Area.gd"

onready var Spelare = get_node("../David")
var Global = GlobalData

func _process(delta):
	if rull == 1:
		Global.playerpos=Spelare.position
		get_tree().change_scene("res://Scenes/Enemies/Bandit.tscn")
