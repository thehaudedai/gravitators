extends Area2D

var receiver: Node2D

func _ready() -> void:
	# Look for TeleportReceiver as a direct child
	receiver = get_node("TeleportReceiver")
	
	if receiver:
		print("✅ Found TeleportReceiver:", receiver.name)
	else:
		print("❌ TeleportReceiver not found!")

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("teleport") and receiver:
		body.global_position = receiver.global_position
