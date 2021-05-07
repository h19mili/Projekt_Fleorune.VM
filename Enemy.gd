extends Battler


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	STR = 5
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
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
	else:
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