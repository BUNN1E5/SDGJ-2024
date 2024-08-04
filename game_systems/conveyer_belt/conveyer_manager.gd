extends Node2D
class_name ConveyerManager

@export var food_belt : ConveyerBelt
@export var plate_belt : ConveyerBelt

@export var food_items : Array[AnimatedTexture]
@export var base_item : PackedScene

@export var new_food_cooldown = 1.0
var new_food_timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	new_food_timer -= delta
	if(new_food_timer <= 0):
		var item = base_item.instantiate() as ConveyerItem
		print("spawning " + str(item))
		item.sprites = food_items.pick_random()
		print("picked " + str(item.sprites))
		add_food_item(item)
		new_food_timer = new_food_cooldown
	pass
	
func add_food_item(item : ConveyerItem):
	food_belt.add_item(item)
	pass

func eat_Item(item : ConveyerItem):
	pass


