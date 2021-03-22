extends Control

signal target_selected(TurnQ)
export var Move : float = 0.5
var selected
var target_selection = 0
onready var tween = $Tween
onready var targets : Array
onready var active_target : Battler


func _ready():
	pass


func select_target(battlers : Array) -> Array:
	visible = true
	targets = battlers
	active_target = targets[0]
	rect_scale.x = 1.0 if active_target.Party_member else -1.0
	rect_global_position = active_target.target_global_position
	grab_focus()
	var selected_target : Battler = yield(self, "target_selected")
	selected = selected_target
	print("selected")
	print(selected)
	print(selected_target)
	print("hi")
	if not selected_target:
		return []
		print("fail")
	return selected_target


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
		emit_signal("target_selected", active_target)
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
