extends Node

signal Attack_done
var Damage = 0

func _ready():
	pass 

func Attack_action():
	Damage = get_parent().STR
	print(Damage)
	return Damage
	pass
