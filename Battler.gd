extends Node2D
class_name Battler
signal turn_done
signal completed
signal emattack
signal Attack_done
signal target_selected
var selected : bool = false setget set_selected
var selectable : bool = false setget set_selectable
export var Party_member = false
onready var target_global_position = self.global_position

var Max_HP : int
var Current_HP : int
var Max_Mana : int
var Speed : int
var STR : int
var DEF : int
var CURRENT_DMG : int

func _ready():
	init(Max_HP, Current_HP)
	selectable = true
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_a"):
		#emit_signal("emattack")
		#emit_signal("Attack_done")
		print("stop")
		pass
	#Attack()

func set_selected(value):
	selected = value

func set_selectable(value):
	selectable = value
	if not selectable:
		set_selected(false)

func init(Max_HP, Current_HP):
	self.Current_HP = Max_HP * 1.0
	self.Current_HP = clamp(Current_HP * 1.0, 0, Max_HP)

func Healthbar(value):
	self.Max_HP = Max_HP * 1.0
	self.Current_HP = clamp((Current_HP - value), 0, Max_HP)
	update()
	#Current_HP < 0

func update():
	var percentage = Current_HP / Max_HP

func character(stats : Statblock):
	Max_HP = stats.Max_HP
	Max_Mana = stats.Max_Mana
	STR = stats.STR
	DEF = stats.DEF
	Speed = stats.Speed
	Current_HP = Max_HP

func Attack():
	if Party_member == false:
		if selected == true:
			CURRENT_DMG = get_node("Battler_Action").Attack_action()
			#emit_signal("emattack")
			emit_signal("Attack_done")
			print("Enemy Attack")


func my_turn(targets):
	pass



