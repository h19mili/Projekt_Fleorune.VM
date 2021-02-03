extends YSort

class_name TurnQ
signal completed
var party : Array = []
onready var active_player = Battler
onready var select_arrow = get_node("../Arrow")

func _ready():
	#select_arrow._select_target()
	initialize()
	pass

func initialize():
	var Battlers = get_players()
	for i in Battlers:
		print(i.Party_member)
		if i.Party_member == true:
			party.append(i)
	print("BATTLERS: ")
	print(Battlers)
	Battlers.sort_custom(self, 'sort_players')
	Battlers[0].raise()
	print("BATTLERS efter: ")
	print(Battlers)
	active_player = get_child(0)
	select_arrow._select_target(Battlers)
	play_turn()

func play_turn():
	var battler : Battler = active_player
	if battler.Current_HP > 0:
		battler.selected = true
		print(battler.selected)
	
		var targets : Array = party
		print(targets)
		if not targets:
			print("End")
			return
		var target : Battler
		if battler.Party_member:
			print("hallå")
			emit_signal("completed")
		else:
			pass
		yield(battler, "completed")
		battler.selected = false
	
		var new_index : int = (active_player.get_index() + 1) % get_child_count()
		active_player = get_child(new_index)
		#yield(active_player, "completed")
		print("again")
		play_turn()

func _select_target(selectable_battler : Battler): #-> Battler:
	print(selectable_battler)
	var selected_target : Battler = yield(select_arrow._select_target(selectable_battler), "completed")
	print("hilast")
	return selected_target

func _get_targets(in_party: bool = false) -> Array:
	var targets: Array = []
	for child in get_children():
		if child.party_member == in_party && child.stats.health > 0:
			targets.append(child)
	return targets

static func sort_players(a : Battler, b : Battler) -> bool:
	return a.Speed > b.Speed

func _next_battler():
	var new_index : int = (active_player.get_index() + 1) % get_child_count()
	active_player = get_child(new_index)

func get_active_player():
	pass

func get_players():
	return get_children()

func _Done():
	emit_signal("completed")
	pass 



