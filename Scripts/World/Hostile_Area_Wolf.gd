extends "res://Scripts/World/Hostile_Area.gd"

onready var Spelare = get_node("../David")
var Global = GlobalData
var scene = preload("res://Main.tscn").instance()
var enemies : Array = []

func _process(delta):
	if rull == 1:
		Global.playerpos=Spelare.position
		var NoOfEnemies = randi() % 3+1
		for i in range(NoOfEnemies):
			enemies.append("res://Scenes/Enemies/Wolf.tscn")
		get_tree().get_root().add_child(scene)
		scene.start_battle(enemies) # init root node
		get_tree().set_current_scene(scene)
		get_node("..").queue_free()
