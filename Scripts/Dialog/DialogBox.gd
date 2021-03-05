extends Control

onready var json = get_node("..")

var dialog = [
	'hej'
]

var conversation_id = "001"
var dialog_index = 0
var finished = false


func _ready():
	load_dialog()


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()


func load_dialog():
	if dialog_index < json.json_parse[conversation_id].size():
		$RichTextLabel.bbcode_text = json.json_parse[conversation_id][dialog_index].text
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 1, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
	dialog_index += 1
