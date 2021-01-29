extends Control

signal target_selected(Battler)
export var Move : float = 0.1
var target_selection
onready var tween = $Tween
onready var targets : Array
onready var active_target : Battler


func _ready():
	pass


func _select_target(Battlers : Array) -> Battler:
	print("hofisrt")
	targets = Battlers
	active_target = targets[0]
	rect_scale.x = 1.0
	rect_global_position = active_target.target_global_position
	grab_focus()
	print("hi3")
	var seleceted_target : Battler = yield(self, "target_selected")
	return seleceted_target


func _Move_to(Battler : Battler):
	tween.interpolate_property(
		self,
		'rect_global_position',
		rect_global_position,
		Battler.target_global_position,
		Move,
		Tween.TRANS_CUBIC,
		Tween.EASE_OUT)
	tween.start()


func _gui_input(event):
	if !visible:
		return
	
	if event.is_action_pressed("ui_left"):
		emit_signal("target_selected", active_target)
		get_tree().set_input_as_handled()
	elif event.is_action_pressed("ui_cancel"):
		emit_signal("target_selected", null)
		print("cancel")
		get_tree().set_input_as_handled()
		
	var index = targets.find(active_target)
	if event.is_action_pressed("ui_down"):
		active_target = targets[(index + 1) % targets.size()]
		_Move_to(active_target)
		get_tree().set_input_as_handled()
	if event.is_action_pressed("ui_up"):
		active_target = targets[(index - 1 + targets.size()) % targets.size()]
		_Move_to(active_target)
		get_tree().set_input_as_handled()
