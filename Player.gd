extends Battler


var Etarget : Battler
onready var Mana = get_node("Mana_bar")
onready var select_arrow = get_node("../../Arrow")
onready var bars = get_node("Bars")
onready var skills = get_node("Job")
onready var EXPlevel = get_node("Exphandler")
onready var enemies : Enemy
onready var turnq : TurnQ


func _ready():
	get_node("Fireball").hide()
	get_node("Attack").hide()
	get_node("Heal").hide()
	signal_EXP()


func _process(delta):
	Show_button()
	if Input.is_action_just_pressed("ui_accept"):
		Etarget = select_arrow.active_target
		if Etarget:
			Attack()
			emit_signal("turn_done")
			print("Player End")


func my_turn(targets):
	CURRENT_DMG = get_node("Battler_Action").Attack_action()
	if Current_HP > 0:
		if not targets:
			print("End")
		Etarget = yield(select_arrow.select_target(targets),"completed")
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
		get_node("Fireball").hide()
		get_node("Attack").hide()
		get_node("Heal").hide()


func Basic_AtkButton():
	if selected == true:
		Etarget = select_arrow.active_target
		Etarget.Current_HP -= STR
		emit_signal("turn_done")
		get_node("Fireball").hide()
		get_node("Attack").hide()
		get_node("Heal").hide()


func Show_button():
	if selected == true:
		get_node("Fireball").show()
		get_node("Attack").show()
		get_node("Heal").show()


func Heal_pressed():
	if selected == true:
		Etarget = select_arrow.active_target
		Etarget.Current_HP += Magic
		emit_signal("turn_done")
		get_node("Fireball").hide()
		get_node("Attack").hide()
		get_node("Heal").hide()


func signal_EXP():
	yield(get_tree().create_timer(0.3), "timeout")
	#yield(, "EXP")
	EXPlevel.gain_experience(100)

