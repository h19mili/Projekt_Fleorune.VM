extends TextureProgress

onready var Parent = get_node("..")


func _ready():
	_Healthbar()
	pass # Replace with function body.


func _Healthbar():
	self.max_value = Parent.Max_HP
	self.value = Parent.Current_HP
	pass
 

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		Parent.Current_HP -= 1
		_Healthbar()
		print("Hp= ", Parent.Current_HP)
