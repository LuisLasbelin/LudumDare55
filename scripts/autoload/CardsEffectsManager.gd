extends Node

var creature_template = preload("res://scenes/creature.tscn")
@export var spawns = []


func _ready():
	var spawn_nodes = get_tree().get_nodes_in_group("Spawn")
	for s in spawn_nodes:
		spawns.append({
			"spawn_node": s,
			"creature": null
		})


func summon(creature_data : CreatureData): 
	for spawn in spawns:
		if spawn["creature"] == null:
			var creature = creature_template.instantiate()
			creature.data = creature_data
			creature.position = spawn["spawn_node"].position
			get_parent().add_child(creature)
			spawn["creature"] = creature
			return true
	print("DEBUG: there are no places left to spawn another creature.")
	return false


func add_effect(effect : String, creature : Creature):
	var result = creature.add_effect(effect)
	if result == false: return false
	print("DEBUG: ", creature.name, " now has ", effect)
	return true


func sacrifice(creature : Creature):
	for spawn in spawns:
		if spawn["spawn_node"] == creature.get_parent(): 
			spawn["creature"] = null
	print("DEBUG: sacrificed for ", creature.get_mana(), " player now has ", GameState.current_mana, " mana.")
	GameState.current_mana += creature.get_mana()
	creature.queue_free()
	return true
