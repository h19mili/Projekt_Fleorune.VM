extends Control


func _ready():
	$Options_video.connect("pressed", self, "Video")
	$Options_audio.connect("pressed", self, "Audio")
	$Options_contorls.connect("pressed", self, "Controls")
	$Options_back.connect("pressed", self, "Back")
	pass


func Video():
	pass


func Audio():
	pass


func Controls():
	pass


func Back():
	get_tree().change_scene("res://Scenes/Menu/Main.tscn")
	pass











