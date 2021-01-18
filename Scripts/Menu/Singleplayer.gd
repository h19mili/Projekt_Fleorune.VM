extends Control


func _ready():
	$Singleplayer_new_game.connect("pressed", self, "New_Game")
	$Singleplayer_load_game.connect("pressed", self, "Load_Game")
	$Singleplayer_back.connect("pressed", self, "Back")
	pass
	
	

func New_Game():
	pass
	
	
func Load_Game():
	pass
	
	
func Back():
	get_tree().change_scene("res://Scenes/Menu/Main.tscn")
	pass
