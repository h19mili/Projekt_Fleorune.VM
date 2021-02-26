extends "res://Global/Scripts/Battler.gd"
	
var Movement = 100
	
var velocity = Vector2()
	
func _ready():
	self.position = GlobalData.playerpos
	pass
	
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * Movement
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	
	
	
