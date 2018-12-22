extends MarginContainer

func _process(delta): 
	# Go back to the main menu
	if(Input.is_action_pressed('ui_back')):
		get_node("/root/global").goto_scene("res://main_menu/MainMenu.tscn")