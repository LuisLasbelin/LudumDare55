extends Node2D
class_name Creature


var data : CreatureData
var effects : Array[GameState.Effects] = []


func ready():
	if not data:
		printerr("ERROR: creature ", self.name, " has no element data.")
		return
	$Sprite2D.texture = data.sprite


func get_mana() -> int:
	var multiplier = 1
	var added = 0
	if effects.has(GameState.Effects.ZAP):
		multiplier += 0.2
	if effects.has(GameState.Effects.ZAP) and effects.has(GameState.Effects.ICE):
		multiplier += 1
	return ceil((data.mana_on_sacrifice + added) * multiplier)
