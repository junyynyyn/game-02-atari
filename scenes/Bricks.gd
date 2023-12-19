extends Node2D

var brick = preload("res://scenes/brick.tscn")

var Y_GAP = 50
var X_GAP = 15

var BRICK_WIDTH = 60
var BRICK_HEIGHT = 20
var START_OFFSET = 15

var ROWS = 8
var COLUMNS = 7

func _ready():
	print("Drawing bricks")
	var start = START_OFFSET + BRICK_WIDTH / 2
	for y in range(ROWS):
		for x in range(COLUMNS):
			var offset = x*(BRICK_WIDTH+X_GAP)
			createBrick(start + offset, (y+1)*Y_GAP)
	
func createBrick(x: int, y:int):
	var new_brick = brick.instantiate()
	new_brick.position = Vector2(x, y)
	add_child(new_brick)
