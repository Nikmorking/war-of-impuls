extends "res://scripts/Basic_enemy.gd"

var down = true
var coll = true

func _ready() -> void:
	nav = $NavigationAgent2D
	get_player()
	$RayCast2D.target_position.x = $Area2D/CollisionShape2D.shape.radius

func _process(delta: float) -> void:
	if play:
		if movi:
			move_to_player(delta)
		else: 
			if ray_cast():
				hit_player()
			else:
				if coll:
					movi = true
					$Timer2.start()
					coll = false
				
			
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

func ray_cast()->bool:
	$RayCast2D.look_at(player.position)
	if $RayCast2D.is_colliding():
		var col = $RayCast2D.get_collider()
		return col == player
	return false
	pass


func shoot() -> void:
	var pyl
	if self.name == "Лучник":
		pyl = load("res://сцены/стрела.tscn").instantiate()
	if self.name == "маг":
		pyl = load("res://сцены/fire_ball.tscn").instantiate()
	if pyl:
		get_tree().root.get_node("Node2D/Пули").add_child(pyl)
		pyl.global_position = position
		pyl.pos = player.position
		pyl.look_at(player.position)
		pyl.damage = damage
	pass

func call_down() -> void:
	hit = true
	pass # Replace with function body.

func _on_player_restart() -> void:
	position = start_pos
	pass # Replace with function body.


func move_() -> void:
	movi = false
	coll = true
	pass # Replace with function body.
