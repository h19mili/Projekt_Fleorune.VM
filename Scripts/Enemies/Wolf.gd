extends "res://Global/Scripts/Battler.gd"

func _ready():
	pass
	
func _process(delta):
	if Current_HP <= 0:
		get_tree().change_scene("res://Scenes/World/Overworld.tscn")
