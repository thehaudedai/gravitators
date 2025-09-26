extends CharacterBody2D

# Gravity direction - default is DOWN
var gravity_direction := Vector2.DOWN

# Speed at which the character falls due to gravity
const GRAVITY_SPEED := 300.0

func _physics_process(_delta: float) -> void:
	# Move the character in the direction of gravity
	velocity = gravity_direction * GRAVITY_SPEED
	move_and_slide()

func _input(event):
	# Change gravity direction based on key input
	if event.is_action_pressed("gravity_up"):
		gravity_direction = Vector2.UP
	elif event.is_action_pressed("gravity_down"):
		gravity_direction = Vector2.DOWN
	elif event.is_action_pressed("gravity_left"):
		gravity_direction = Vector2.LEFT
	elif event.is_action_pressed("gravity_right"):
		gravity_direction = Vector2.RIGHT
