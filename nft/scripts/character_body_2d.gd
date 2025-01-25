extends CharacterBody2D


@export var SPEED = 300.0
var move

var heals = 100


func _input(_event: InputEvent) -> void:
	var mouse_pos = get_global_mouse_position()
	if Input.is_action_just_released("mouse_left"):
		shoot(mouse_pos)
	pass

func move_player() -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		velocity.x = move_toward(velocity.x, 0, SPEED)
	pass

func _physics_process(_delta: float) -> void:
	move_player()
	if(heals == 70):
		print("die")
	move_and_slide()
	pass

func shoot(vector: Vector2) -> void:
	var mob = load("res://сцены/Пуля.tscn").instantiate()

	get_tree().root.get_node("Node2D/Node2D").add_child(mob)
	mob.global_position = position
	mob.pos = vector
	pass
