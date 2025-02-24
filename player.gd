extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


@onready var animation_player = $AnimationPlayer
@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	#Gets infpu derection (-1 or 1)
	var direction = Input.get_axis("ui_left", "ui_right")
	
	#flips sprite
	if direction < 0:
		animation_player.flip_h = false
	elif direction > 0:
		animation_player.flip_h = true
	
	#Gets infpu derection (-1 or 1)
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
