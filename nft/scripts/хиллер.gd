extends "res://scripts/воин.gd"

var bodys: Array


func _ready() -> void:
	get_player()
	nav = $NavigationAgent2D
	top = true
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
	
func add(body: Node2D) -> void:
	bodys.append(body)
	player = body
	pass


func hill() -> void:
	for i in bodys.size():
		if bodys[i] != null:
			bodys[i].health += 10
			print(bodys[i].tipy)
			if bodys[i].health >= bodys[i].max_health:
				health = max_health
				print("Всё")
	pass # Replace with function body.


func remove(body: Node2D) -> void:
	bodys[bodys.bsearch(body)] = null
	pass
