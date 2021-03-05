extends Control

var dialogue_data = {}

func load_json(json, type):
	var file = File.new();
	file.open(json["dialogue"], File.READ);
	dialogue_data = parse_json(file.get_as_text())
	file.close()
