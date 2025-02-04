extends "res://scripts/Basic_enemy.gd"

var down = true

func _ready() -> void:
	nav = $NavigationAgent2D
	get_player()
	$RayCast2D.target_position.x = $Area2D/CollisionShape2D.shape.radius

func _process(delta: float) -> void:
	if play:
		if movi:
			move_to_player(delta)
		else:
			hit_player()
	pass


func hit_player()->void:
	if hit:
		print(222)
		shoot()
		down = true
		hit = false
	else:
		if down:
			$Timer.start()
			down = false
	pass

func shoot() -> void:
	#$RayCast2D.target_position = player.position
	$RayCast2D.look_at(player.position)
	if $RayCast2D.is_colliding():
		if $RayCast2D.get_collider() == player:
			var pyl = load("res://сцены/fire_ball.tscn").instantiate()
			get_tree().root.get_node("Node2D/Пули").add_child(pyl)
			pyl.global_position = position
			pyl.pos = player.position
		pass


func call_down() -> void:
	hit = true
	pass # Replace with function body.

func _on_player_restart() -> void:
	position = start_pos
	pass # Replace with function body.
