extends "res://scripts/Basic_enemy.gd"

var down = true

func _ready() -> void:
	nav = $NavigationAgent2D
	get_player()
	

func _process(delta: float) -> void:
	if play:
		if movi:
			move_to_player(delta)
			#$CollisionPolygon2D.disabled = false
		else:
			hit_player()
		#$CollisionPolygon2D.disabled = true
		
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
	var pyl = load("res://сцены/стрела.tscn").instantiate()

	get_tree().root.get_node("Node2D/Пули").add_child(pyl)
	pyl.global_position = position
	pyl.pos = player.position
	pyl.look_at(player.position)
	pass


func call_down() -> void:
	hit = true
	pass # Replace with function body.


func _on_player_restart() -> void:
	position = start_pos
	pass # Replace with function body.
