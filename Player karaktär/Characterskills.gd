extends Node


class_name Characterskills

var Skill_text : String
var mana_cost : int
var base_damage : int
var fire_damage : int
var Hit_chance : float


func initialize(skill, Skill):
	name = skill.Skill_name
	Skill_text = skill.Skill_text
	mana_cost = skill.mana_cost
	base_damage = skill.base_damage
	fire_damage = skill.fire_damage
	Hit_chance = skill.Hit_chance
	return(self)
