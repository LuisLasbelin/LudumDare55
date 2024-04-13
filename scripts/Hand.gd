extends Node2D


var card_template = preload("res://scenes/card.tscn")


func _ready():
	GameState.drawn_card.connect(draw_card)


# Called when signal draw card goes on
func draw_card(card : CardData):
	var card_instance = card_template.instantiate()
	card_instance.card_data = card
	self.add_child(card_instance)
	update_hand()


func update_hand():
	var offset = 0
	for child in self.get_children():
		child.origin_position = Vector2(offset,0)
		child.position = Vector2(offset,0)
		offset += 200
