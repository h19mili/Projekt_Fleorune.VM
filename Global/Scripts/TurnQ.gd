extends YSort

class_name TurnQ
signal turn_done
var party : Array = []
var Etarget
onready var active_player = Battler
onready var select_arrow = get_node("../Arrow")

func _ready():
	#Etarget = get_child(1)
	#initialize()
	pass
func _process(delta):
	var targets : Array = get_players()
	var active_monster = 0
	var active_Hero = 0
	for H in targets:
		if H.Party_member == true:
			active_Hero += 1
	for M in targets:
		if M.monster_member == true:
			active_monster += 1
	if active_monster < 1:
		print("Battle End You Win")
		#yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://Scenes/World/Overworld.tscn")
		get_node("..").queue_free()
	if active_Hero == 0:
		print("Battle End You Lose")
		#yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://Scenes/World/Overworld.tscn")
		get_node("..").queue_free()


func initialize():
	Etarget = get_child(1)
	var Battlers = get_players()
	Battlers.sort_custom(self, 'sort_players')
	Battlers[0].raise()
	active_player = get_child(0)
	select_arrow.select_target(Battlers)
	play_turn()

func play_turn():
	Combat_Done()
	var battler : Battler = active_player
	var active_monster = 0
	if battler.Current_HP > 0:
		battler.selected = true
		var targets : Array = get_players()
		battler.my_turn(targets)
		yield(battler,"turn_done")
		battler.selected = false
	
		var new_index : int = (active_player.get_index() + 1) % get_child_count()
		active_player = get_child(new_index)
		play_turn()
	if battler.Current_HP < 0:
		battler.selectable = false
		battler.selected = false
		_next_battler()
		play_turn()


static func sort_players(a : Battler, b : Battler) -> bool:
	return a.Speed < b.Speed

func _next_battler():
	var new_index : int = (active_player.get_index() + 1) % get_child_count()
	active_player = get_child(new_index)

func get_active_player():
	pass

func get_players():
	return get_children()

func Combat_Done():
	var active_monster = 0
	var targets : Array = get_players()
	for M in targets:
		if M.monster_member == true:
			active_monster += 1
			print("active_monster")
			print(active_monster)
	if not active_monster:
		print("Battle End You Win")
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://Scenes/World/Overworld.tscn")

