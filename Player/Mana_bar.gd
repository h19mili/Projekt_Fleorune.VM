extends TextureProgress

onready var Max_mana = get_node("..").Max_Mana
onready var Current_mana = Max_mana


func _ready():
	_Manabar()


func _Manabar():
	self.max_value = Max_mana
	self.value = Current_mana

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		Current_mana -= 1
		print(Current_mana)
		_Manabar()
		pass
