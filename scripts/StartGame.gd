extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	GameState.shuffle_deck()
	GameState.draw_card()
	GameState.draw_card()
	GameState.draw_card()

