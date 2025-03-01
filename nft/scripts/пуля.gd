extends Node2D

@export var speed = 0.1
@export var damage = 10

var pos
var stop = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _process(_delta: float) -> void:
	if pos is Vector2 and !stop:
		position = lerp(position, pos, speed)
	if pos == position:
		stop = true
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if stop:
			if body.tipy == "Player":
				body.Shoot()
				queue_free()
		if body is Enemy:
			stop = true
			print("gg")
			body.health -= damage
			body.vis_health()
			if(body.health <= 0):
				body.queue_free()
				Gg.get_papa(2, self).kill()
	else:
		stop = true
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	stop = true
	pass # Replace with function body.
