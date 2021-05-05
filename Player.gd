extends Battler


var Etarget : Battler
onready var Mana = get_node("Mana_bar")
onready var select_arrow = get_node("../../Arrow")
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Button").hide()
	get_node("Button2").hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Show_button()
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


func Fireball_Button():
	if selected == true:
		Etarget = select_arrow.active_target
		Etarget.Current_HP -= Magic
		Mana.Current_mana -= 7
		Mana._Manabar()
		emit_signal("turn_done")
		get_node("Button").hide()
		get_node("Button2").hide()
	pass


func Basic_AtkButton():
	if selected == true:
		Etarget = select_arrow.active_target
		Etarget.Current_HP -= STR
		emit_signal("turn_done")
		get_node("Button2").hide()
		get_node("Button").hide()
	pass

func Show_button():
	if selected == true:
		get_node("Button").show()
		get_node("Button2").show()
