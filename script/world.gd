extends Node2D

var target_rotation := 0.0  # in radians
var rotation_speed := 5.0   # how fast to interpolate rotation
var rotation_step := deg_to_rad(90)  # 90 degree steps per input

func _process(delta: float) -> void:
	# Smoothly rotate the world toward the target
	rotation = lerp_angle(rotation, target_rotation, delta * rotation_speed)

func _input(event):
	if event.is_action_pressed("gravity_right"):
		target_rotation += rotation_step
	elif event.is_action_pressed("gravity_left"):
		target_rotation -= rotation_step
		
	target_rotation = fmod(target_rotation + PI, TAU) - PI
