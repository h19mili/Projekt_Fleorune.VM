extends Node2D

class_name Battler
signal completed

var Max_HP : int
var Current_HP : int 
var Max_Mana : int
var Speed : int
var STR : int 
var DEF : int

func _ready():
	init(Max_HP, Current_HP)
	pass 

func _process(delta):
	pass

func init(Max_HP, Current_HP):
	self.Current_HP = Max_HP * 1.0
	self.Current_HP = clamp(Current_HP * 1.0, 0, Max_HP)

func Healthbar(value):
	self.Max_HP = Max_HP * 1.0
	self.Current_HP = clamp((Current_HP - value), 0, Max_HP)
	update()
	Current_HP < 0 

func update():
	var percentage = Current_HP / Max_HP

func character(stats : Statblock):
	Max_HP = stats.Max_HP
	Max_Mana = stats.Max_Mana
	STR = stats.STR
	DEF = stats.DEF
	Speed = stats.Speed
	Current_HP = Max_HP
