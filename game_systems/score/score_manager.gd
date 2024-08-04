extends Node

#food rating is S -> A -> B -> C -> F with F being a failed state
#				4 -> 3 -> 2 -> 1 -> 0
#there is a counter that increases food rating back up
#when that counter reaches a value increase the food rating up
@export var food_rating : float = 4
@export var food_rating_recovery_rate : float = 0.1

#This is your money, this does nothing
@export var money = 0

signal on_food_rating_recovery
signal on_food_rating_loss

# Called when the node enters the scene tree for the first time.
func _ready():
	on_food_rating_loss.connect(food_rating_loss)
	on_food_rating_recovery.connect(food_rating_recovery)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#this runs when there is a change to the food rating
#a positive change just adds, a negative change means we lose
func food_rating_recovery():
	food_rating += food_rating_recovery_rate
	pass

#brings our food rating down a level and reset our recovery progress
func food_rating_loss():
	food_rating = floor(food_rating - 1)
	pass

func add_money(amount):
	money += amount
	pass
