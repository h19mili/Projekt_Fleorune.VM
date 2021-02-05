extends Control

signal target_selected(Battler)
export var Move : float = 0.1
var target_selection = 0
onready var tween = $Tween
onready var targets : Array
onready var active_target : Battler


func _ready():
	pass


func select_target(battlers : Array) -> Array:
	visible = true
	print("battler0")
	print(battlers)
	targets = battlers
	active_target = targets[0]
	print("HI")
	print(targets)
	rect_scale.x = 1.0 if active_target.Party_member else -1.0
	rect_global_position = active_target.target_global_position
	#grab_focus()
	var selected_target = active_target  #: Battler = yield(self, "target_selected")
	#targets = []
	print(targets)
	return selected_target
	#if not selected_target:
		#return []
	#return [selected_target]


func _Move_to(battler : Battler):
	tween.interpolate_property(
		self,
		'rect_global_position',
		rect_global_position,
		battler.target_global_position,
		Move,
		Tween.TRANS_CUBIC,
		Tween.EASE_OUT
		)
	tween.start()


func _input(event):
	if !visible:
		return
	
	if event.is_action_pressed("ui_left"):
		emit_signal("target_selected", targets)
		accept_event()
	elif event.is_action_pressed("ui_cancel"):
		emit_signal("target_selected", null)
		print("cancel")
		accept_event()
		
	var index = targets.find(active_target)
	if event.is_action_pressed("ui_down"):
		active_target = targets[(index + 1) % targets.size()]
		_Move_to(active_target)
		get_tree().set_input_as_handled()
	if event.is_action_pressed("ui_up"):
		active_target = targets[(index - 1 + targets.size()) % targets.size()]
		_Move_to(active_target)
		get_tree().set_input_as_handled()
