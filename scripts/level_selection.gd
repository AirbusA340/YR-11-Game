extends Control

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_go_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
