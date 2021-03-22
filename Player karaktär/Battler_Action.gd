extends Node
class_name Combataction

signal Attack_done
var Damage = 0
var Attacker


func _ready():
	pass


func _process(delta):
	Attacker = get_node("/root/Main/TurnQ").Etarget
	pass


func Attack_action():
	Damage = get_parent().STR
	
	print(Damage)
	return Damage


