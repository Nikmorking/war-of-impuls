extends Area2D

@export var vost_xp = 10

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.tipy == "Player":
			print("xx")
			body.max_health *= 2
			body.health = body.max_health
			body.vis_health()
			queue_free()
		else:
			print("EEE")
	pass
