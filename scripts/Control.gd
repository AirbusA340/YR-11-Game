extends Control


# Called when the node enters the scene tree for the first time.
func resume():
	get_tree().paused = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func pause(delta):
	get_tree().paused = true
	
func testEsc():
	
