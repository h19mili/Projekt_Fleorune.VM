extends Battler
class_name Enemy
signal EXP


func _ready():
	monster_member = true
	STR = 5
	pass


func _process(delta):
	if Current_HP < 0:
		queue_free()
	pass



func my_turn(targets):
	print("SPEED ENEMY")
	print(Speed)
	if Current_HP > 0:
		var Etarget : Battler = choose_target(targets)
		#yield(active_player, "emattack") # a
		Attack()
		yield(get_tree().create_timer(1.0), "timeout")
		Etarget.Current_HP -= CURRENT_DMG
		emit_signal("turn_done")
	if Current_HP < 0:
		#emit_signal("EXP")
		yield(get_tree().create_timer(0.3), "timeout")
		queue_free()
		print("ENEMY NO HP")
	return self

func choose_target(sort_valid):
	for i in sort_valid:
		if i.Party_member:
			print("found player")
			return i
		else:
			print("NO PLAYER FOUND!!")

func monster_attack(targets):
	pass
