extends Control



func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/level_selection.tscn")



func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/options.tscn")



func _on_customize_pressed():
	get_tree().change_scene_to_file("res://scenes/customize.tscn")


func _on_quit_pressed():
	get_tree().quit()
