extends Area2D

onready var Spelare = get_node("../David")
var inside = 0

onready var body = get_node("res://Scenes/Character/David.tscn")

func _on_Area2D_body_entered(body):
	inside = 1
	get_node("../Label").show()
func _process(delta):
	if Input.is_action_just_pressed("interact") and inside == 1:
		get_tree().change_scene("res://Scenes/Dialog/Dialog.tscn")

func _on_Area2D_body_exited(body):
	inside = 0
	get_node("../Label").hide()

