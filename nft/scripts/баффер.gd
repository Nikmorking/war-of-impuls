extends "res://scripts/воин.gd"

func _ready() -> void:
	get_player()
	nav = $NavigationAgent2D
	

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if play:
		if movi:
			move_to_player(delta)
			#$CollisionPolygon2D.disabled = false
		else:
			hit_player()
		#$CollisionPolygon2D.disabled = true
		
	pass
	
func baf(body: Node2D) -> void:
	if body == Enemy:
		body.damage += 10
	pass
