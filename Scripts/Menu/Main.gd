extends Control


func _ready():
	$main_menu_singleplayer.connect("pressed", self, "Singleplayer")
	$main_menu_options.connect("pressed", self, "Options")
	$main_menu_quit.connect("pressed", self, "Quit")
	pass


func Singleplayer():
	pass


func Options():
	pass


func Quit():
	get_tree().quit()
	pass
