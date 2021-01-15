extends Node2D
class_name Battler
signal completed
export var Speed = 0

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TurnQ_completed():
	emit_signal("completed")
	pass 
