extends "res://scripts/лучник.gd"


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



func call_down() -> void:
	hit = true
	pass # Replace with function body.

func _on_player_restart() -> void:
	position = start_pos
	pass # Replace with function body.
