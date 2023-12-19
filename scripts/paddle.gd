extends CharacterBody2D

var SPEED = 20.0
var MAX_SPEED = 300.0

func _ready():
	pass
	
func _process(delta):
	var movementDir = Input.get_axis("left", "right")
	if (movementDir == 0):
		velocity.x = 0
	if (abs(velocity.x) <= MAX_SPEED):
		velocity.x += movementDir * SPEED
		
	move_and_slide()
