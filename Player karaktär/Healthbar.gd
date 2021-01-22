extends TextureProgress

onready var Max_HP = get_node("..").Max_HP
onready var Current_HP = get_node("..").Current_HP


func _ready():
	_Healthbar()
	pass # Replace with function body.


func _Healthbar():
	self.max_value = Max_HP
	self.value = Current_HP
	pass
 

func _process(delta):
	_Healthbar()
	if Input.is_action_just_pressed("ui_accept"):
		Current_HP -= 1
		print(Current_HP)
