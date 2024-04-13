extends Node2D
class_name Creature


var data : CreatureData


func ready():
	if not data:
		printerr("ERROR: creature ", self.name, " has no element data.")
		return
	$Sprite2D.texture = data.sprite


func get_mana() -> int:
	return ceil(data.mana_on_sacrifice)
