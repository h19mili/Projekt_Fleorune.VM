extends Control


var dialog = [
	'hello there, this is a test',
	'This is also test reee',
	'This is the final test' 
	]

var dialog_index = 0
var finished = false


func _ready():
	load_dialog()
	
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()


func load_dialog():
	if dialog_index < dialog.size():
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 1, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
	dialog_index += 1
	
	
	pass
# id, namn, text
