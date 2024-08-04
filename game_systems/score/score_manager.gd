extends Node
class_name ScoreManager

#food rating is S -> A -> B -> C -> F with F being a failed state
#				4 -> 3 -> 2 -> 1 -> 0
#there is a counter that increases food rating back up
#when that counter reaches a value increase the food rating up
@export var food_rating : float = 1
@export var food_rating_int : int = floor(food_rating)
@export var food_rating_recovery_rate : float = 0.005
@export var food_rating_textures : AnimatedTexture



#This is your money, this does nothing
@export var money = 0

signal food_rating_recovery
signal food_rating_loss
signal food_rating_change

# Called when the node enters the scene tree for the first time.
func _ready():
	food_rating_loss.connect(on_food_rating_loss)
	food_rating_recovery.connect(on_food_rating_recovery)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_food_rating_texture():
	return food_rating_textures.get_frame_texture(
		min(floor(food_rating), food_rating_textures.get_frames()))

#this runs when there is a change to the food rating
#a positive change just adds, a negative change means we lose
func on_food_rating_recovery():
	food_rating = min(food_rating + food_rating_recovery_rate, 5)
	if(food_rating_int != floor(food_rating)):
		food_rating_int = floor(food_rating)
		food_rating_change.emit()
	pass

#brings our food rating down a level and reset our recovery progress
func on_food_rating_loss():
	food_rating = floor(food_rating - 1)
	if(food_rating_int != floor(food_rating)):
		food_rating_int = floor(food_rating)
		food_rating_change.emit()
	pass

func add_money(amount):
	money += amount
	pass
