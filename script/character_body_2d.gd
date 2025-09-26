extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = 400.0  # Positive because we multiply with -1 for jump

# Gravity direction (default: down)
var gravity_dir := Vector2.DOWN

func _physics_process(delta: float) -> void:
	# Apply gravity in the chosen direction
	if not is_on_floor():
		velocity += gravity_dir * get_gravity() * delta
	else:
		# Stop velocity along gravity when on floor
		velocity = velocity.slide(gravity_dir)

	# --- Handle Jump (W key) ---
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity = -gravity_dir * JUMP_VELOCITY

	# --- Movement with WASD (perpendicular to gravity) ---
	var move_input := Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		move_input.x -= 1
	if Input.is_action_pressed("move_right"):
		move_input.x += 1
	if Input.is_action_pressed("move_down"):
		move_input.y += 1
	if Input.is_action_pressed("move_up"):
		move_input.y -= 1
	
	# Only move perpendicular to gravity
	var move_dir := move_input.orthogonal()
	if move_dir.length() > 0:
		move_dir = move_dir.normalized()
		velocity = move_dir * SPEED + velocity.project(gravity_dir)
	else:
		velocity = velocity.move_toward(velocity.project(gravity_dir), SPEED * delta)

	# --- Gravity Direction Control with Arrow Keys ---
	if Input.is_action_just_pressed("ui_up"):
		gravity_dir = Vector2.UP
	elif Input.is_action_just_pressed("ui_down"):
		gravity_dir = Vector2.DOWN
	elif Input.is_action_just_pressed("ui_left"):
		gravity_dir = Vector2.LEFT
	elif Input.is_action_just_pressed("ui_right"):
		gravity_dir = Vector2.RIGHT

	move_and_slide()
