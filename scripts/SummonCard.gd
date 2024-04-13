extends Card
class_name SummonCard

var origin_position : Vector2
var picked : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	origin_position = self.global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if picked:
		self.global_position = get_viewport().get_mouse_position()


func _on_area_2d_input_event(viewport, event : InputEvent, shape_idx):
	if event.is_action_pressed("pick"):
		picked = true
	if event.is_action_released("pick"):
		picked = false
		self.position = origin_position
