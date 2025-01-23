extends CharacterBody2D


@export var SPEED = 300.0
var move


func _input(event: InputEvent) -> void:
	var mouse_pos = get_global_mouse_position()
	if Input.is_action_just_released("mouse_left"):
		shoot(mouse_pos)
	pass

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
func shoot(vector: Vector2) -> void:
	var mob = load("res://сцены/Пуля.tscn").instantiate()

	get_tree().root.get_node("Node2D/Node2D").add_child(mob)
	mob.global_position = position
	mob.pos = vector
	pass
