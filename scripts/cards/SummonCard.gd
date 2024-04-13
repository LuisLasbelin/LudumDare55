extends CardEffect
class_name SummonCard

@export var creature_to_summon : CreatureData


func use(areas : Array[Area2D]) -> bool:
	for area in areas:
		if area.name == "SummonArea":
			var result = CardsEffectsManager.summon(creature_to_summon)
			if result == true: self.destroy()
			return true
	return false
