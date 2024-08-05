extends Node

@export var anime : AnimationPlayer
@export var animation : String
# Called when the node enters the scene tree for the first time.
func _ready():
	anime.play(animation)
	pass # Replace with function body.
