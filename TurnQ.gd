extends YSort

class_name TurnQ
signal completed
signal turn_done
#signal Attack_done
signal targets_selected(selected_target)
var party : Array = []
var Etarget
#onready var Battler_action = $Battler_Action #Combataction
onready var active_player = Battler
onready var select_arrow = get_node("../Arrow")

func _ready():
	Etarget = get_child(1)
	initialize()
	pass

func initialize():
	var Battlers = get_players()
	#for i in Battlers:
		#if i.Party_member == true:
			#party.append(i)
	Battlers.sort_custom(self, 'sort_players')
	Battlers[0].raise()
	active_player = get_child(0)
	select_arrow.select_target(Battlers)
	#Etarget=select_arrow.selected
	play_turn()

func play_turn():
	var battler : Battler = active_player
	if battler.Current_HP > 0:
		battler.selected = true
		var targets : Array = get_players()
		if not targets:
			print("NO TARGETS!! END!")
		battler.my_turn(targets)
		yield(battler,"turn_done")
		print("JAG ÄR FÖRBI!!!")
		battler.selected = false
	
		var new_index : int = (active_player.get_index() + 1) % get_child_count()
		active_player = get_child(new_index)
		play_turn()

#func _select_target(selectable_battlers : Array) -> Battler:
	#var selected_target : Battler = select_arrow.select_target(selectable_battlers)#, "target_selected")
	#var selected_target : Battler = yield(select_arrow.select_target(selectable_battlers), "completed")
	#print("hilast")
	#return selected_target


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
	emit_signal("turn_done")
	pass 



