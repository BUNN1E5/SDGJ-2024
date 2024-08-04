extends Path2D
class_name ConveyerBelt
#Here is the functionality that needs to be implemented in this class:
#We need to make a conveyer!
#	How do we wanna implement this?
#	We have 2 conveyer belts, they run in real time
#	should there be a max? => No prob not
#	When is food considered on the floor
#		=> How about when the food isnt in between the first 2 Nodes in the path
#	How do we decide when to age a food?
#		=> food is on the floor
#		=> How about we let the food decide that
#	If bad food gets gobbled bring our rating down a level and push bad food on plate return
#	If good food gets gobbled add some money and push emty plate on plate return at the
#		at the same relative position as where it was on the 

@export_range(0, 1) var speed : float = 0.1
#var kitchen : Array[ConveyerItem]
#var hall : Array[ConveyerItem]

@export var hall_time = 20
@export var max_items = 200
var num_items = 0

func add_item(item : ConveyerItem):
	item.reparent(self)
	item.progress_ratio = 0
	item.conveyer_belt = self
	pass

func _ready():
	pass

func _process(delta):
	pass
