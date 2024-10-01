extends RigidBody2D

func _ready():
	# Set a minimal gravity scale for the bullet
	gravity_scale = 1  # Adjust this value as needed for your desired effect

func _process(delta):
	# Get the screen size
	var screen_size = get_viewport_rect().size

	# Check if the bullet is outside the screen bounds
	if position.x < 0 or position.x > screen_size.x or position.y < 0 or position.y > screen_size.y:
		queue_free()  # Remove the bullet from the scene

func _on_disapier_timeout():
	queue_free()
