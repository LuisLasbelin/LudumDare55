extends Node2D

var origin_position : Vector2
var picked : bool = false
@export var card_data : CardData # must be set before added to the scene

# Called when the node enters the scene tree for the first time.
func _ready():
	origin_position = self.global_position
	# Create node with effect
	var card_effect_inv = card_data.card_effect_node.instantiate()
	self.add_child(card_effect_inv)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if picked:
		self.global_position = get_viewport().get_mouse_position()


func _on_area_2d_input_event(viewport, event : InputEvent, shape_idx):
	if event.is_action_pressed("pick"):
		picked = true
	if event.is_action_released("pick"):
		# Check if it is on a valid area to use the card
		picked = false
		self.position = origin_position
