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
	food_belt.belt_push_cooldown = min(new_food_cooldown,food_belt.belt_push_cooldown)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	new_food_timer -= delta
	if(new_food_timer <= 0):
		if(food_belt.belt_q.size() > 3):
			return #no new food if queue is full
		var item = base_item.instantiate() as ConveyerItem
		item.sprites = food_items.pick_random()
		add_food_item(item)
		new_food_timer = new_food_cooldown
	pass
	
func add_food_item(item : ConveyerItem):
	food_belt.add_item(item)
	pass

func eat_Item(item : ConveyerItem):
	pass


