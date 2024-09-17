extends Control

func _ready():
	$AnimationPlayer.play("RESET")
# Called when the node enters the scene tree for the first time.

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	
func testEsc():
	if Input.is_action_just_pressed("pause") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("pause") and get_tree().paused == true:
		resume()
	
func _on_resume_pressed():
	resume()
	



func _on_restart_pressed():
	resume()
	get_tree().reload_current_scene()



func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/level_selection.tscn")
	
	
func _process(_delta):
	testEsc()
