extends Node
class_name Combataction

signal Attack_done
var Damage = 0
var Attacker 

func _ready():
	pass


func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		print(Attacker)


func Attack_action():
	Damage = get_parent().STR
	#Attacker.current_HP
	print("Battler_Action")
	print(Attacker)
	print(Damage)
	return Damage


