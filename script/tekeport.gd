extends Area2D

# The place where the player will be teleported
@export var target_position: Vector2

# Optional: Pull strength for a nice “suction” effect
@export var pull_strength: float = 300.0

func _process(delta):
	for body in get_overlapping_bodies():
		if body.is_in_group("player"):
			var direction = (global_position - body.global_position).normalized()
			var distance = body.global_position.distance_to(global_position)
			
			# Pull player toward blackhole
			body.position += direction * pull_strength * delta / distance
			
			# Teleport when close enough
			if distance < 10:
				body.global_position = target_position
