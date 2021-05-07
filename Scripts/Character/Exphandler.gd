extends Node2D

export (int) var level = 1

var experience = 0
var experience_total = 0
var experience_required = get_required_experience(level + 1)
var Text_lvl
var LvPoints = 0

func get_required_experience(level):
	return round(pow(level, 2.0) + level * 4)

func gain_experience(amount):
	experience_total += amount
	experience += amount
	while experience >= experience_required:
		experience -= experience_required
		level_up()

func level_up():
	level += 1
	Text_lvl=str(level)
	experience_required = get_required_experience(level + 1)
	get_node("Level_number").set_text(Text_lvl)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		gain_experience(100)
	pass
