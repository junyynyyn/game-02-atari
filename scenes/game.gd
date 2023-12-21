extends Node2D

func _ready():
	$Ball.reset()
	
func _on_rigid_body_2d_score_update():
	$UI/Score.text = "Score: " + str(Globals.score)

func _on_out_area_body_entered(body):
	Globals.lives -= 1
	$UI/Lives.text = "Lives: " + str(Globals.lives)
	$Ball.reset()
