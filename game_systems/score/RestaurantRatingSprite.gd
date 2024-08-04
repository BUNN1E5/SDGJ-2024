extends Sprite2D

@export var manager : ScoreManager

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func on_change_food_letter():
	self.texture = manager.get_food_rating_texture()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
