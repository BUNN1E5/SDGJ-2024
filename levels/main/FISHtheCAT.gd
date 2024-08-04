extends Node2D

@onready var sprite : AnimatedSprite2D = get_child(0)

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play("Idle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
