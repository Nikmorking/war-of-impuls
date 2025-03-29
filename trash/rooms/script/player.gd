extends CharacterBody2D

var play = true
@export var SPEED = 300.0

func _process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if play:
		var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
		if direction.x or direction.y:
			velocity = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
