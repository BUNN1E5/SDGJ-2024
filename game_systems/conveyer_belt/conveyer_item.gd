extends PathFollow2D
class_name ConveyerItem

@export var conveyer_belt : ConveyerBelt
var collision : Area2D
var being_held = false
var bad_level = 0
var chance_to_be_consumed = 0.25

var mousePath = "/root/Main/Mouse"
@onready var mouse : PlayerMouse = get_node(mousePath)


var scoreManagerPath = "/root/Main/GameManagement"
@onready var scoreManager : ScoreManager = get_node(scoreManagerPath)

#food and a plate are both conveyerItems

#these are the sprites from good to "bad"
#a plate would have an array of 1 with just the plate item
@export var sprites : AnimatedTexture
@onready var renderder : Sprite2D = get_child(2)
var time_in_hall = 0
var in_hall = false

var on_belt : bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	self.collision = get_child(0) #get the collider (we assuming the first child)
	self.collision.monitoring = true
	self.conveyer_belt = get_parent()
	self.progress_ratio = 0
	
	self.loop = false
	self.rotates = false
	if(sprites.get_frames() > 0):
		self.renderder.texture = sprites.get_frame_texture(min(bad_level, sprites.get_frames()-1))
	pass # Replace with function body.
	
func _input(event):
	if event is InputEventMouseButton:
		if(event.pressed):
			if self.collision.overlaps_area(mouse.selector_area):
				mouse.try_pickup.emit(self)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
var rng = RandomNumberGenerator.new()
@export var try_get_eaten_cooldown = 1
var try_get_eaten_timer = try_get_eaten_cooldown
func _process(delta):
	if not on_belt:
		return
		
	if in_hall:
		time_in_hall -= delta
		try_get_eaten_timer -= delta
		
		#try and get eaten
		#if we get eaten
		if(try_get_eaten_timer <= 0):
			try_get_eaten_timer = try_get_eaten_cooldown
			if(rng.randf() > chance_to_be_consumed):
				scoreManager.food_rating_recovery.emit()
		
		if(time_in_hall <= 0):
			#we are ready to come back into the conveyer
			conveyer_belt.try_push_to_start(self)
			bad_level = min(bad_level+1, sprites.get_frames()-1)
			self.renderder.texture = sprites.get_frame_texture(min(bad_level, sprites.get_frames()-1))
			in_hall = false
			on_belt = false
		pass
	else:
		if(self.progress_ratio >= 1):
			in_hall = true
			time_in_hall = conveyer_belt.hall_time
			if(bad_level > 0): #thiis is bad way
				#remove from belt
				scoreManager.food_rating_loss.emit()
		self.progress_ratio += delta * conveyer_belt.speed
	pass
