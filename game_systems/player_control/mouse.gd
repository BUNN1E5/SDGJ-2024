extends Node
class_name PlayerMouse

@export var toggle_or_hold = false

@export var selector_area : Area2D #assume the child of mouse is an Area2D

@export var mouse_smoothness = 16
@export_range(0, 1) var mouse_pickup_modifier = 0.1
@export var use_modifier = false

# Called when the node enters the scene tree for the first time.
func _ready():
	selector_area = get_child(0)
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	#Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	
	pass # Replace with function body.

func _input(event):
	#mouse click and unclick
	if event is InputEventMouseButton:
		if toggle_or_hold:
			#toggle on click
			if(event.pressed):
				use_modifier = !use_modifier
		else:
			use_modifier = event.pressed #This is for holding
		
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	self.position = self.position.lerp(mouse_pos, delta * mouse_smoothness * (1 if !use_modifier else mouse_pickup_modifier))
	pass
