extends Node

@export var mouse_smoothness = 16

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	self.position = self.position.lerp(mouse_pos, delta * mouse_smoothness)
	pass
