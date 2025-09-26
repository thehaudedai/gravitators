extends RigidBody2D

func _ready():
	# Connect the body_entered signal dynamically
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("blockage_area"):
		# Stop droplet and become static
		mode = RigidBody2D.MODE_STATIC
		linear_velocity = Vector2.ZERO
