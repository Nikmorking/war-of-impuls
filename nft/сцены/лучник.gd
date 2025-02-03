extends "res://scripts/Basic_enemy.gd"

var down = true

func _ready() -> void:
	get_player()
	nav = $NavigationAgent2D
	

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
		player.health -= damage
		player.vis_health()
		down = true
		hit = false
	else:
		if down:
			$Timer.start()
			down = false
	pass



func call_down() -> void:
	hit = true
	pass # Replace with function body.


func _on_player_restart() -> void:
	position = start_pos
	pass # Replace with function body.
