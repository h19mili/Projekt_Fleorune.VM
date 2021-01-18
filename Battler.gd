extends Node2D

class_name Battler
signal completed
export var Speed = 0

func _ready():
	pass # Replace with function body.



func _process(delta):
	emit_signal("completed")
	pass
