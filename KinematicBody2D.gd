extends KinematicBody2D

var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var velocitat_base = 300
var velocitat_salt = -500

func _physics_process(delta):
	velocitat.x = 0
	
	
	velocitat += gravetat * delta
	
	if Input.is_action_pressed("mou dreta "):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("mou esquerra"):
		velocitat += Vector2.LEFT * velocitat_base
		
	if Input.is_action_just_pressed("mou a dalt") and is_on_floor():
		velocitat.y = velocitat_salt
	velocitat = move_and_slide(velocitat, Vector2.UP)
	anima(velocitat)
	
func anima(velocitat):
	if velocitat.x > 0 and velocitat.y > -2:
		$AnimatedSprite.play('Run')
		$AnimatedSprite.flip_h = false
	elif velocitat.x < 0 and velocitat.y > -2:
		$AnimatedSprite.play('Run')
		$AnimatedSprite.flip_h = true
	if abs(velocitat.x) < 0.1 and velocitat.y > -1:
		$AnimatedSprite.play('Idle')
	if velocitat.y < -2:
		$AnimatedSprite.play('Jump')

