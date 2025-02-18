extends "res://scripts/хиллер.gd"

func _ready() -> void:
	get_player()
	nav = $NavigationAgent2D
	player = self

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
	player = body
	if !body.top:
		body.damage += 10
		body.SPEED += 10
		body.top = true
	pass


func topr(body: Node2D) -> void:
	body.top = false
	pass # Replace with function body.
