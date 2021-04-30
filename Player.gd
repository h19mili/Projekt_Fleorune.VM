extends Battler


var Etarget : Battler
onready var select_arrow = get_node("../../Arrow")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		Etarget = select_arrow.active_target
		if Etarget:
			Attack()
			emit_signal("turn_done")
			print("Player End")
	pass
	
	

func my_turn(targets):
	CURRENT_DMG = get_node("Battler_Action").Attack_action()
	if Current_HP > 0:
		if not targets:
			print("End")
		Etarget = yield(select_arrow.select_target(targets),"completed")
		#emit_signal("turn_done")
	return self

func Attack():
	if Current_HP > 0 && selected:
		Etarget.Current_HP -= CURRENT_DMG
