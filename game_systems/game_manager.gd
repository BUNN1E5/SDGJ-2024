extends Node

@export var main_scene : PackedScene

func quit():
	get_tree().quit()
	pass
	
func start():
	get_tree().change_scene_to_packed(main_scene)
	pass
