extends PathFollow2D
class_name ConveyerItem

@export var conveyer_belt : ConveyerBelt
var collision : Area2D
var being_held = false
var bad_level = 0

var mousePath = "/root/Main/Mouse"
@onready var mouse : PlayerMouse = get_node(mousePath)
#food and a plate are both conveyerItems

#these are the sprites from good to "bad"
#a plate would have an array of 1 with just the plate item
@export var sprites : Array[Texture]
@export var renderder : Sprite2D
var time_in_hall = 0
var in_hall = false


# Called when the node enters the scene tree for the first time.
func _ready():
	self.collision = get_child(0) #get the collider (we assuming the first child)
	self.collision.monitoring = true

	self.conveyer_belt = get_parent()
	self.loop = false
	self.rotates = false
	pass # Replace with function body.
	
func _input(event):
	if event is InputEventMouseButton:
		print(self.collision.overlaps_area(mouse.selector_area))
		pass
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(self.progress_ratio >= 1):
		in_hall = true
	
	if(in_hall):
		time_in_hall += delta
	
	if in_hall == false:
		self.progress_ratio += delta * conveyer_belt.speed
	pass
