extends Node
class_name Combataction

var Damage = 0
var Attacker
#onready var turnq : TurnQ

func _ready():
	pass


func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		print(Attacker)


func Attack_action():
	Damage = get_parent().STR
	#emit_signal("Attack_done")
	print("Battler_Action")
	print(Attacker)
	print(Damage)
	return Damage



