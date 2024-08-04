extends PathFollow2D
class_name ConveyerItem

@export var conveyer_belt : ConveyerBelt

#food and a plate are both conveyerItems

#these are the sprites from good to "bad"
#a plate would have an array of 1 with just the plate item
@export var sprites : Array[Sprite2D]
@export var renderder : Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	self.conveyer_belt = get_parent()
	self.loop = true
	self.rotates = false
	self.conveyer_belt.get_curve()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.progress_ratio += delta * conveyer_belt.speed
	pass
