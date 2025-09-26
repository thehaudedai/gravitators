extends CharacterBody2D

const GRAVITY = 800.0

@onready var anim = $AnimatedSprite2D  # or AnimationPlayer, depending on your setup

func _physics_process(delta):
	# Existing fall logic
	velocity.y += 800 * delta
	move_and_slide()

	# Play idle or fall animations
	if is_on_floor():
		anim.play("idle")
	else:
		anim.play("fall")

	# Keep player upright
	rotation = -get_parent().rotation
