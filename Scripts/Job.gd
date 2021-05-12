tool
extends Node
class_name Job

onready var stats = get_node("..")
onready var skills = get_node("Skills")
onready var bars = get_node("../Bars")
export(Array) var Starting_skills
var skilllista = []
export(PackedScene) var character_skills_scene : PackedScene

export var statblock : Resource
func _ready():
	stats.character(statblock)
	if Starting_skills != null and Starting_skills.size() > 0:
		for skill in Starting_skills:
			var new_skill = character_skills_scene.instance()
			new_skill.initialize(skill, Skillcraft)
			skills.add_child(new_skill)
			#bars.add_child(new_skill)
	pass 
