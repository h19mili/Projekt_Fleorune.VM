extends Area2D

func _on_Hostile_Area_body_entered(body):
	if (body.get_name() == "Player"):
		get_tree().change_scene("res://Scenes/Enemies/Wolf.tscn")
