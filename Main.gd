extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func start_battle(enemies : Array):
	var pos = Vector2(300,0)
	for i in enemies:

		#var scenes : String = i
		var scene = load(i).instance()
		scene.position = pos
		pos.y += pos.y + 100
		get_node("TurnQ").add_child(scene)
	$TurnQ.initialize()
	
	
