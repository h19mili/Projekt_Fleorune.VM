extends Node2D


func start_battle(enemies : Array):
	var pos = Vector2(300,0)
	for i in enemies:

		#var scenes : String = i
		var scene = load(i).instance()
		scene.position = pos
		pos.y += pos.y + 100
		get_node("TurnQ").add_child(scene)
	$TurnQ.initialize()
	
	
