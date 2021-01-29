extends "res://Battler.gd"

func _ready():
	pass
	
func _process(delta):
#	print(Current_HP)
	if Current_HP <= 0:
		print("test")
		get_tree().change_scene("res://Jobs/Game.tscn")
