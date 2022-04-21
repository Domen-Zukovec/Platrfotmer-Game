extends KinematicBody2D

var velocity = Vector2(0,0)
var coins = 0
const SPEED = 330
const JUMPFORCE = -1200
const GRAVITY = 60

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = true
	elif Input.is_action_pressed("croutch"):
		$Sprite.play("crouch")
	else:
		$Sprite.play("idle")
		
	if not is_on_floor():
		$Sprite.play("air")
		
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
		$SoundJump.play()
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x, 0, 0.2)
	

func _on_fallzone_body_entered(body: Node) -> void:
	get_tree().change_scene("res://SRC/End screen.tscn")


	
func bounce():
	velocity.y = JUMPFORCE * 0.7
	
func ouch(var enemyposx):

	velocity.y = JUMPFORCE * 0.4
	
	if position.x < enemyposx:
		velocity.x = -800
	elif position.x > enemyposx:
		velocity.x = 800
		
	Input.action_release("left")
	Input.action_release("right")
	
	$SoundOuch.play()
	
	set_modulate(Color(1, 0.3, 0.3, 0.1))
	yield(get_tree().create_timer(0.15), "timeout")
	set_modulate(Color(1, 1, 1, 1))
	yield(get_tree().create_timer(0.15), "timeout")
	set_modulate(Color(1, 0.3, 0.3, 0.15))
	yield(get_tree().create_timer(0.3), "timeout")
	set_modulate(Color(1, 1, 1, 1))

