extends CharacterBody2D

var play = false
@export var SPEED = 300.0

func _ready():
	Gs.connect("play_", _play)
	Gs.connect("stop_", _stop)
	pass

func _process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if play:
		var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
		if direction.x <0:
			$AnimatedSprite2D.play("left")
		if direction.x >0:
			$AnimatedSprite2D.play("right")
		if direction.y <0:
			$AnimatedSprite2D.play("up")
		if direction.y >0:
			$AnimatedSprite2D.play("down")
		if direction.x or direction.y:
			velocity = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


func _play():
	play = true
	pass


func _stop():
	$AnimatedSprite2D.play("down")
	play = false
	pass
