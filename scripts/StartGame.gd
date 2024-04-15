extends Node2D

var mana_objective : float = 500.0

# Called when the node enters the scene tree for the first time.
func _ready():
	GameState.shuffle_deck()
	GameState.draw_card()
	GameState.draw_card()
	GameState.draw_card()
	GameState.draw_card()
	GameState.draw_card()


func _process(delta):
	$Orb/BolaMana.material.set_shader_parameter("mana", GameState.current_mana / mana_objective)
	if GameState.current_mana >= mana_objective:
		$EndGameText.visible = true
