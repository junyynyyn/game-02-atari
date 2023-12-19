extends RigidBody2D

var speed_up = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _integrate_forces(state):
	if (speed_up == true):
		state.linear_velocity *= 1.1
		speed_up = false

func _on_body_entered(body):
	if (body.is_in_group("Brick")):
		body.queue_free()
		Globals.score += 100
		print(Globals.score)
		speed_up = true
