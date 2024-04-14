extends Node2D
class_name Creature


var data : CreatureData
var effects : Array[String] = []


func ready():
	if not data:
		printerr("ERROR: creature ", self.name, " has no element data.")
		return
	$Sprite2D.texture = data.sprite


func get_mana() -> int:
	var multiplier = 1
	var added = 0
	if effects.has("zap"):
		multiplier += 0.2
	if effects.has("zap") and effects.has("ice"):
		multiplier += 1
	return ceil((data.mana_on_sacrifice + added) * multiplier)
