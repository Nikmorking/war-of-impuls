extends Node2D

var mob

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	var mob
	if Input.is_action_just_pressed("spawn_1"):
		mob = load("res://сцены/враги и другие/Воин.tscn").instantiate()
	if Input.is_action_just_pressed("spawn_2"):
		mob = load("res://сцены/враги и другие/лучник.tscn").instantiate()
	if Input.is_action_just_pressed("spawn_3"):
		mob = load("res://сцены/враги и другие/Маг.tscn").instantiate()
	if Input.is_action_just_pressed("spawn_4"):
		mob = load("res://сцены/враги и другие/баффер.tscn").instantiate()
	if Input.is_action_just_pressed("spawn_5"):
		mob = load("res://сцены/враги и другие/хилл3ер.tscn").instantiate()
	if mob:
		get_parent().add_child(mob)
		mob.global_position = global_position
		mob.add_to_group("Enemys")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	mob = load("res://сцены/Воин.tscn").instantiate()
	get_parent().add_child(mob)
	mob.global_position = global_position
	pass # Replace with function body.
