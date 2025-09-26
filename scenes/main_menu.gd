extends MarginContainer

@onready var new_game: TextureButton = $"HBoxContainer/MarginContainer/VBoxContainer/MarginContainer/VBoxContainer/New Game"

func _on_new_game_pressed() -> void:
	var tween := create_tween()
	# Animate the alpha (opacity) from current value to 0 over 0.5 seconds
	tween.tween_property(self, "modulate:a", 0.0, 0.5)
	# After fade-out completes, hide the container
	tween.tween_callback(func(): visible = false)
