extends Node
class_name CardEffect


func use(areas : Array[Area2D]) -> bool:
	printerr("ERROR: this card has no effect.")
	return false


func destroy():
	# delete card from scene and change card to discarded pile
	GameState.discard(self.get_parent().card_data)
	self.get_parent().origin_position = Vector2(-999,-999)
