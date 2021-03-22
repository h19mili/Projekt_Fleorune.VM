extends TextureProgress

onready var Max_HP = get_node("..")
var Text_health

func _ready():
	_Healthbar()
	pass # Replace with function body.


func _Healthbar():
	self.max_value = Max_HP.Max_HP
	self.value = Max_HP.Current_HP
	Text_health=str(value)
	get_node("Healthnumber").set_text(Text_health)
	pass
 

func _process(delta):
	_Healthbar()
	#if Input.is_action_just_pressed("ui_accept"):
		#Current_HP -= 1
		#print(Current_HP)
