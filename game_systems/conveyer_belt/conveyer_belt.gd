extends Node2D

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

#We will figure out which we wanna use later
@export var sushi_path : Path2D 
@export var plate_path : Path2D

@export var food_conveyer : Array[Node2D] #Holds all the food on the conveyer to the customer
@export var plate_conveyer : Array[Node2D] #Holds any plates that are returned including "BAD" food

func process(delta):
	pass
