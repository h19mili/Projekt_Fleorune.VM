extends Control

var json_parse = {}
var json_file

var conversation_id = "003"
var dialog_index = 0
var finished = false


func _ready():
	json_file = _load()
	print(json_file)
	json_parse = JSON.parse(json_file).result
	print(json_parse)
	
	load_dialog()


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()


func load_dialog():
	if dialog_index < json_parse[conversation_id].size():
		$RichTextLabel.bbcode_text = json_parse[conversation_id][dialog_index].text
		$name.bbcode_text = json_parse[conversation_id][dialog_index].name
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 1, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
	dialog_index += 1
	
	
func _load():
	var file = File.new()
	file.open("res://Data/dialog.json", File.READ)
	var content = file.get_as_text()
	print (content)
	file.close()
	return content
	pass
