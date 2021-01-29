extends YSort

class_name TurnQ
signal completed
var party : Array = []
onready var active_player = Battler
onready var select_arrow = "../Arrow"

func _ready():
	initialize()
	pass

func initialize():
	var Battlers = get_players()
	print("BATTLERS: ")
	print(Battlers)
	Battlers.sort_custom(self, 'sort_players')
	Battlers[0].raise()
	print("BATTLERS efter: ")
	print(Battlers)
	active_player = get_child(0)
	play_turn()

func play_turn():
	yield(active_player, "completed")
	print("fight")
	var new_index : int = (active_player.get_index() + 1) % get_child_count()
	active_player = get_child(new_index)
	yield(active_player, "completed")
	print("again")
	play_turn()

func _select_target(selectable_battler : Array) -> Battler:
	var selected_target : Battler = yield(select_arrow-_select_target(selectable_battler), "completed")
	print("hilast")
	return selected_target

static func sort_players(a : Battler, b : Battler) -> bool:
	return a.Speed > b.Speed

func _next_battler():
	var new_index : int = (active_player.get_index() + 1) % get_child_count()
	active_player = get_child(new_index)

func get_players():
	return get_children()

func _Done():
	emit_signal("completed")
	pass 



