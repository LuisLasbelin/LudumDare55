extends Node

var creature_template = preload("res://scenes/creature.tscn")
@export var spawns = [
	{
		"position" : Vector2(337,583),
		"creature" : false
	},
	{
		"position" : Vector2(480,583),
		"creature" : false
	}
]


func summon(creature_data : CreatureData): 
	for spawn in spawns:
		if spawn["creature"] == false:
			var creature = creature_template.instantiate()
			creature.data = creature_data
			creature.position = spawn["position"]
			get_parent().add_child(creature)
			spawn["creature"] = creature
			return true
	print("DEBUG: there are no places left to spawn another creature.")
	return false


func add_effect(effect, target : Creature):
	pass


func sacrifice(creature : Creature):
	for spawn in spawns:
		if spawn["creature"] == creature:
			GameState.current_mana += creature.get_mana()
			spawn["creature"] = false
			creature.queue_free()
			print("DEBUG: sacrificed for ", creature.get_mana(), " player now has ", GameState.current_mana, " mana.")
			return true
	printerr("ERROR: there has been an error with sacrificing ", creature)
	return false
