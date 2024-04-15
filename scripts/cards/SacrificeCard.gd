extends CardEffect
class_name SacrificeCard

func use(areas : Array[Area2D]) -> bool:
	for area in areas:
		if area.name == "CreatureArea":
			var result = CardsEffectsManager.sacrifice(area.get_parent())
			if result == true: self.destroy()
			return true
	return false
