extends CardEffect
class_name SummonCard

@export var creature_to_summon : CreatureData


func use():
	var result = CardsEffectsManager.summon(creature_to_summon)
	if result == true: get_parent().queue_free()
