extends Node2D
class_name Creature


var data : CreatureData
var effects : Array[String] = []


func _ready():
	if not data:
		printerr("ERROR: creature ", self.name, " has no element data.")
		return
	$Sprite2D.texture = data.sprite
	self.update_effects_fx()


func add_effect(new_effect : String):
	# An effect cannot be added more than once
	if effects.has(new_effect): return false
	effects.append(new_effect)
	self.update_effects_fx()
	return true


func update_effects_fx():
	for fx in $EffectsFXManager.get_children():
		if effects.has(fx.name):
			fx.visible = true
		else:
			fx.visible = false


func get_mana() -> int:
	var multiplier = 1
	var added = 0
	if effects.has("zap"):
		multiplier += 1
		if effects.has("ice"):
			multiplier += 1
	if effects.has("acid") and not effects.has("ice"):
		added += 50
	return ceil((data.mana_on_sacrifice + added) * multiplier)
