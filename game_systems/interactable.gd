extends Area2D
class_name Interactable



var mousePath = "/root/Main/Mouse"
@onready var mouse : PlayerMouse = get_node(mousePath)



signal button_pressed()

var default_scale = self.scale
var hover_scale = default_scale * 1.2
# Called when the node enters the scene tree for the first time.
func _ready():
	self.monitoring = true
	pass # Replace with function body.

func on_button_pressed():
	pass

func _input(event):
	if event is InputEventMouseButton:
		if self.overlaps_area(mouse.selector_area):
			button_pressed.emit()
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.overlaps_area(mouse.selector_area):
		#change sprite in some way
		self.scale = lerp(self.scale, hover_scale, 8 * delta)
		pass
	else:
		#change it back
		self.scale = lerp(self.scale, default_scale, 8 * delta)
		pass
	pass
