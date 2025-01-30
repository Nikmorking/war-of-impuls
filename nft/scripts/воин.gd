extends "res://scripts/Basic_entity.gd"

var down = true

func _ready() -> void:
	get_player()
	

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if play:
		move_to_player(delta)
		#$CollisionPolygon2D.disabled = false
	else:
		hit_player()
		#$CollisionPolygon2D.disabled = true
		
	pass

func hit_player()->void:
	if hit:
		print(111)
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
