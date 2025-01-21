extends CharacterBody2D


@export var SPEED = 300.0


func _physics_process(delta: float) -> void:
	var direction_y := Input.get_axis("ui_up", "ui_down")
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x := Input.get_axis("ui_left", "ui_right")
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	pass

func _input(event):
	# Mouse in viewport coordinates.
	var mouse_pos
	if event is InputEventMouseButton:
		mouse_pos = event.position
		print("Mouse Click/Unclick at: ", mouse_pos)
	pass
