extends Node

signal Attack_done
var Damage = 0
var Cstats = Battler

func _ready():
	pass 

func Attack_action():
	Damage += Cstats.STR
	print(Damage)
	pass
