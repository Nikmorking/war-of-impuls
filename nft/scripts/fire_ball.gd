extends Area2D

@export var speed = 0.1
@export var damage = 10

var pos
var stop = false

func _process(_delta: float) -> void:
	if pos is Vector2 :
		position = lerp(position, pos, speed)
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		print("gg2222")
		body.health -= damage
		if body.tipy == "Player":
			body.vis_health()
	pass

func _on_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.
