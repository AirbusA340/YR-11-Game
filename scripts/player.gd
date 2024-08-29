extends CharacterBody2D

var speed: float = 300
var accel: float = 100
var y_speed: float = 10000
var y_accel: float = 10000
const SPEED = 300.0
const JUMP_VELOCITY = -200.0

@onready var animated_sprite = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(_delta):
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		if not is_on_floor():
			velocity.y += gravity * _delta
			
	
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "flip_up", "flip_down")

	var direction_x = Input.get_axis("move_left", "move_right")

	velocity.x = move_toward(velocity.x, speed * direction.x, accel)
	velocity.y = move_toward(velocity.y, y_speed * direction.y, y_accel)
	
	if Input.is_action_just_pressed("flip_up"):
		animated_sprite.flip_v = true
	elif Input.is_action_just_pressed("flip_down"):
		animated_sprite.flip_v = false

	
	if direction_x > 0:
		animated_sprite.flip_h = false
	elif direction_x < 0:
		animated_sprite.flip_h = true
	
	if direction_x == 0:
		animated_sprite.play("Idle")
	else:
		animated_sprite.play("Run")
		
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)	
	
	move_and_slide()
