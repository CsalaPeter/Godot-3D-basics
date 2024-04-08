extends Node3D


func _input(event):
	
	if event.is_action_pressed("exit"):
		get_tree().quit()
		
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()
