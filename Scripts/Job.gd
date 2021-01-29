tool
extends Node
class_name Job

onready var stats = get_node("..")

export var statblock : Resource
func _ready():
	stats.character(statblock)
	pass 
