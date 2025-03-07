extends "res://scripts/воин.gd"

var bodys: Array
@export var add_health = 5
@export var playe:bool

func _ready() -> void:
	get_player()
	nav = $NavigationAgent2D
	top = true
	if playe:
		player = self
	pass

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
	if playe:
		bodys.append(body)
		player = body
	else:
		if body is CharacterBody2D:
			bodys.append(player)
	pass


func hill() -> void:
	$GPUParticles2D.emitting = true
	
	for i in bodys.size():
		if bodys[i] != null:
			bodys[i].vis_health()
			print(bodys[i].tipy)
			if (bodys[i].health < bodys[i].max_health):
				bodys[i].health += add_health 
				print("хил")
				if !playe:
					health -= add_health
					vis_health()
			else:
				health = max_health
	pass # Replace with function body.


func remove(body: Node2D) -> void:
	if playe:
		bodys[bodys.bsearch(body)] = null
	else:
		bodys.clear()
	pass
