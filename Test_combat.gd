extends Node2D


var scene = preload("Main.tscn").instance()
var enemies : Array = []
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
