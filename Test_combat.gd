extends Node2D


var scene = preload("Main.tscn").instance()
var enemies : Array = []


func _ready():
	randomize()
	pass


func _process(delta):
	if Input.is_action_just_pressed("ui_a"):
		var rull = randi() % 3+1
		for i in range(rull):
			enemies.append("res://Enemy.tscn")
		get_tree().get_root().add_child(scene)
		scene.start_battle(enemies) # init root node
		get_tree().set_current_scene(scene)
		queue_free()


#	pass
