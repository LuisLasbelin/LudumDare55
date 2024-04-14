extends CardEffect
class_name EffectCard


@export var effect : GameState.Effects

func use(areas : Array[Area2D]) -> bool:
	for area in areas:
		if area.name == "CreatureArea":
			var result = CardsEffectsManager.add_effect(effect, area.get_parent())
			if result == true: self.destroy()
			return true
	return false
