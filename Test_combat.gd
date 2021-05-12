extends Node2D


var scene = preload("Main.tscn").instance()
var enemies : Array = []



# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_a"):
		var rull = 2#randi() % 3+1
		for i in range(rull):
			enemies.append("res://Enemy.tscn")
		get_tree().get_root().add_child(scene)
		scene.start_battle(enemies) # init root node
		get_tree().set_current_scene(scene)
		queue_free()


#	pass
