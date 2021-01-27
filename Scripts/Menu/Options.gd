extends Control

var can_select = true
var select_timer = 5

var sp_pause = false
var sp_use = false

var ready = true
var ready_timer = 5

func _ready():
	$Options_video.connect("pressed", self, "Video")
	$Options_audio.connect("pressed", self, "Audio")
	$Options_contorls.connect("pressed", self, "Controls")
	$Options_back.connect("pressed", self, "Back")
	$Options_cntrl_Video/btn_Resolution.connect("item_selected", self, "Resolution")
	$Options_cntrl_Video/btn_Fullscreen.connect("item_selected", self, "Fullscreen")
	$Options_cntrl_Audio/btn_Master_Mute.connect("pressed", self, "Mute_Master")
	$Options_cntrl_Audio/sldr_Master.connect("value_changed", self, "Master_Volume")
	$Options_cntrl_Audio/btn_Music_Mute.connect("pressed", self, "Mute_Music")
	$Options_cntrl_Audio/sldr_Music.connect("value_changed", self, "Music_Volume")
	$Options_cntrl_Audio/btn_Effects_Mute.connect("pressed", self, "Mute_Effects")
	$Options_cntrl_Audio/sldr_Effects.connect("value_changed", self, "Effects_Volume")
	$Options_cntrl_Controls/btn_use.connect("pressed", self, "Use_Button")
	$Options_cntrl_Controls/btn_pause.connect("pressed", self, "Pause_Button")
	
	
	$Options_cntrl_Video/btn_Resolution.add_item("800 X 600", 0)
	$Options_cntrl_Video/btn_Resolution.add_item("1920 X 1080", 1)
	$Options_cntrl_Video/btn_Resolution.add_item("2560 X 1440", 2)
	
	if(Options.res_width == 800 and Options.res_height == 600):
		$Options_cntrl_Video/btn_Resolution.select(0)
	elif(Options.res_width == 1920 and Options.res_height == 1080):
		$Options_cntrl_Video/btn_Resolution.select(1)
	elif(Options.res_width == 2560 and Options.res_height == 1440):
		$Options_cntrl_Video/btn_Resolution.select(2)
	
	$Options_cntrl_Video/btn_Fullscreen.add_item("Fullscreen", 0)
	$Options_cntrl_Video/btn_Fullscreen.add_item("Windowed", 1)
	
	if(Options.fullscreen == true):
		$Options_cntrl_Video/btn_Fullscreen.select(0)
	elif(Options.fullscreen == false):
		$Options_cntrl_Video/btn_Fullscreen.select(1)
	
	
	$Options_cntrl_Audio/sldr_Master.set_value(Options.Master_Volume)
	$Options_cntrl_Audio/sldr_Music.set_value(Options.Music_Volume)
	$Options_cntrl_Audio/sldr_Effects.set_value(Options.Effects_Volume)
	
	
	$Options_label.set_size(Vector2(1920,340))
	$Options_cntrl_Video.set_size(Vector2(1920,702))
	$Options_cntrl_Video.set_position(Vector2(0,378))
	$Options_cntrl_Audio.set_size(Vector2(1920,702))
	$Options_cntrl_Audio.set_position(Vector2(0,378))
	$Options_cntrl_Controls.set_size(Vector2(1920,702))
	$Options_cntrl_Controls.set_position(Vector2(0,378))
	
	if(Options.Master_Mute == true):
		$Options_cntrl_Audio/sldr_Master.set_modulate(Color(1,1,1,0.1))
	elif(Options.Master_Mute == false):
		$Options_cntrl_Audio/sldr_Master.set_modulate(Color(1,1,1,1))
	
	if(Options.Music_Mute == true):
		$Options_cntrl_Audio/sldr_Music.set_modulate(Color(1,1,1,0.1))
	elif(Options.Music_Mute == false):
		$Options_cntrl_Audio/sldr_Music.set_modulate(Color(1,1,1,1))
	
	if(Options.Effects_Mute == true):
		$Options_cntrl_Audio/sldr_Effects.set_modulate(Color(1,1,1,0.1))
	elif(Options.Effects_Mute == false):
		$Options_cntrl_Audio/sldr_Effects.set_modulate(Color(1,1,1,1))
	
	pass


func _process(delta):
	
	if(select_timer > 0):
		select_timer -= 1
		can_select = false
	else:
		can_select
	
	if(ready_timer > 0):
		ready_timer -= 1
		ready = true
	else:
		ready = false
	
	
	if($Options_cntrl_Controls.is_visible()):
		$Options_cntrl_Controls/lbl_use.set_text(OS.get_scancode_string(Options.sp_use))
		$Options_cntrl_Controls/lbl_pause.set_text(OS.get_scancode_string(Options.sp_pause))
	pass


func _input(event):
	
	if(event is InputEventKey):
		if(sp_use == true):
			Options.sp_use = event.scancode
			sp_use = false
			select_timer = 5
			can_select = false
			$Options_cntrl_Controls/Key.hide()
			
		if(sp_pause == true):
			Options.sp_use = event.scancode
			sp_use = false
			select_timer = 5
			can_select = false
			$Options_cntrl_Controls/Key.hide()
			
	pass


func Video():
	$Options_cntrl_Video.show()
	$Options_cntrl_Audio.hide()
	$Options_cntrl_Controls.hide()
	pass


func Audio():
	$Options_cntrl_Video.hide()
	$Options_cntrl_Audio.show()
	$Options_cntrl_Controls.hide()
	pass


func Controls():
	$Options_cntrl_Video.hide()
	$Options_cntrl_Audio.hide()
	$Options_cntrl_Controls.show()
	pass


func Back():
	if(Options.paused == false):
		get_tree().change_scene("res://Scenes/Menu/Main.tscn")
	elif(Options.paused == true):
		Options.pause_menu = true
	pass


func Resolution(item):
	
	match item:
		0:
			Options.res_width = 800
			Options.res_height = 600
			Options.resolution()
			Options.save_game()
		1:
			Options.res_width = 1920
			Options.res_height = 1080
			Options.resolution()
			Options.save_game()
		2:
			Options.res_width = 2560
			Options.res_height = 1440
			Options.resolution()
			Options.save_game()
	pass


func Fullscreen(item):
	
	match item:
		0:
			Options.fullscreen = true
			Options.resolution()
			Options.save_game()
		1:
			Options.fullscreen = false
			Options.resolution()
			Options.save_game()
	pass


func Mute_Master():
	if(ready == false):
		if(Options.Master_Mute == false):
			Options.Master_Mute = true
			$Options_cntrl_Audio/sldr_Master.set_modulate(Color(1,1,1,0.1))
		elif(Options.Master_Mute == true):
			Options.Master_Mute = false
			$Options_cntrl_Audio/sldr_Master.set_modulate(Color(1,1,1,1))
	Options.choose_music()
	Options.save_game()
	pass


func Master_Volume(value):
	if(ready == false):
		if(Options.Master_Mute == true):
			Options.Master_Mute = false
			$Options_cntrl_Audio/sldr_Master.set_modulate(Color(1,1,1,1))
	Options.Master_Volume = $Options_cntrl_Audio/sldr_Master.get_value()
	Options.save_game()
	pass


func Mute_Music():
	if(ready == false):
		if(Options.Music_Mute == false):
			Options.Music_Mute = true
			$Options_cntrl_Audio/sldr_Music.set_modulate(Color(1,1,1,0.1))
		elif(Options.Music_Mute == true):
			Options.Music_Mute = false
			$Options_cntrl_Audio/sldr_Music.set_modulate(Color(1,1,1,1))
	Options.choose_music()
	Options.save_game()
	pass


func Music_Volume(value):
	if(ready == false):
		if(Options.Music_Mute == true):
			Options.Music_Mute = false
			$Options_cntrl_Audio/sldr_Music.set_modulate(Color(1,1,1,1))
	Options.Music_Volume = $Options_cntrl_Audio/sldr_Music.get_value()
	Options.save_game()
	pass


func Mute_Effects():
	if(ready == false):
		if(Options.Effects_Mute == false):
			Options.Effects_Mute = true
			$Options_cntrl_Audio/sldr_Effects.set_modulate(Color(1,1,1,0.1))
		elif(Options.Effects_Mute == true):
			Options.Effects_Mute = false
			$Options_cntrl_Audio/sldr_Effects.set_modulate(Color(1,1,1,1))
	Options.save_game()
	pass


func Effects_Volume(value):
	if(ready == false):
		if(Options.Effects_Mute == true):
			Options.Effects_Mute = false
			$Options_cntrl_Audio/sldr_Effects.set_modulate(Color(1,1,1,1))
	Options.Effects_Volume = $Options_cntrl_Audio/sldr_Effects.get_value()
	Options.save_game()
	pass


func Use_Button():
	if(can_select == true):
		sp_use = true
		$Options_cntrl_Controls/Key.show()
		
	pass


func Pause_Button():
	if(can_select == true):
		sp_pause = true
		$Options_cntrl_Controls/Key.show()
		
	pass
