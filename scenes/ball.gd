extends RigidBody2D

var BASE_SPEED = 200

var LOAD_POSITION: Vector2

var speed_up = false
var reset_state = false
signal score_update

# Called when the node enters the scene tree for the first time.
func _ready():
	LOAD_POSITION = global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _integrate_forces(state):
	if (speed_up == true):
		state.linear_velocity *= 1.1
		speed_up = false
	if (reset_state == true):
		state.transform.origin = LOAD_POSITION
		var x = randi_range(0, 1)
		var y = randi_range(0, 1)
		if (x <= 0): x = -1
		if (y <= 0): y = -1
		
		state.linear_velocity = Vector2(x,y).normalized() * 200
		reset_state = false

func _on_body_entered(body):
	if (body.is_in_group("Brick")):
		body.queue_free()
		Globals.score += 100
		score_update.emit()
		speed_up = true

func reset():
	reset_state = true
