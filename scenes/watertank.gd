extends TextureProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	max_value = PlayerStats.tankMaxLevel
	value = PlayerStats.currentLevel


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	value = PlayerStats.currentLevel
