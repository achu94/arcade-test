extends Node2D

const MAX_TOP = 300
const MAX_BOTTOM = 540

var usage_per_second: int = 1

const bullet_tscn = preload("res://scenes/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if get_global_mouse_position().y > MAX_TOP and get_global_mouse_position().y < MAX_BOTTOM:
		look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("main_fire"):
		fire_bullet(delta)
	
func fire_bullet(delta):
	
	# Check if there is enough water before firing
	if PlayerStats.currentLevel <= 0:
		print("No Water")
		return
	
	# Consume water
	consume(delta)
	
	var bullet_instance = bullet_tscn.instantiate()
	
	 # Set the bullet's global position to the parent's current position
	bullet_instance.global_position = global_position  # Or any specific position

	  # Calculate the direction from the gun to the mouse
	var direction = (get_global_mouse_position() - bullet_instance.global_position).normalized()
	
	# Set the bullet's velocity in the calculated direction
	bullet_instance.linear_velocity = direction * 1000  # Adjust the speed as needed
	
	# Add the bullet to the scene
	get_tree().root.add_child(bullet_instance)  # Add directly to the root to avoid inheriting parent transforms

func consume(delta):
	# Calculate water consumption per frame using delta
	var consumed_water = usage_per_second * delta  # Consumes based on seconds elapsed (delta)

	# Decrease the water level
	PlayerStats.currentLevel -= consumed_water

	# Ensure current water level doesn't go negative
	if PlayerStats.currentLevel < 0:
		PlayerStats.currentLevel = 0
