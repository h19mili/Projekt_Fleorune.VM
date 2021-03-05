extends Control

var json_parse = {}
var json_file


func _ready():
	json_file = _load()
	print(json_file)
	json_parse = JSON.parse(json_file).result
	print(json_parse)
	pass


func _process(delta):
	pass


func _load():
	var file = File.new()
	file.open("res://Data/dialog.json", File.READ)
	var content = file.get_as_text()
	print (content)
	file.close()
	return content
	pass
