extends Area2D


func _on_Area2D_body_entered(body):
	if body == "../Player":
		get_tree().change_scene("res://Enemies/Bandit.tscn")
