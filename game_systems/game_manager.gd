extends Node

@export var main_scene : PackedScene
@export var game_over_scene : PackedScene
@export var title_scene : PackedScene

func quit():
	get_tree().quit()
	pass
	
func start():
	get_tree().change_scene_to_packed(main_scene)
	pass

func title_screen():
	get_tree().change_scene_to_packed(title_scene)	

func game_over():
	get_tree().change_scene_to_packed(game_over_scene)	
