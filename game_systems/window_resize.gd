extends Node

var last_size
var aspect_ratio_w = 4
var aspect_ratio_h = 3
	
func _ready():
	get_viewport().set_transparent_background(true)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_TRANSPARENT, true)
	last_size = DisplayServer.window_get_size()

func _process(delta):
	var curr_size = DisplayServer.window_get_size()
	if(last_size != curr_size):
		#find nearest 4:3
		var diff = abs(last_size - DisplayServer.window_get_size())
		var bdiff = 1 if diff.x > diff.y else -1
		var new_size = Vector2i(curr_size.x * (bdiff + 1)/2 + curr_size.y * -(bdiff - 1)/2 * aspect_ratio_w/aspect_ratio_h,
								curr_size.x * (bdiff + 1)/2 * aspect_ratio_h/aspect_ratio_w + curr_size.y * -(bdiff - 1)/2)
		print("X: " + str((bdiff + 1)/2) + " Y: " + str(-(bdiff - 1)/2))
		#print("bdiff: " + str(bdiff) + " | diff " + str(diff))	
		print("window Size: " + str(curr_size) + " | new size " + str(new_size))	
		#get_viewport().size = new_size
		#DisplayServer.window_set_size(new_size)
		#last_size = new_size
		#pass
	
	#get_viewport().size = curr_size - Vector2i.ONE	
	#DisplayServer.window_set_size(curr_size - Vector2i.ONE)
	last_size = curr_size
	pass
