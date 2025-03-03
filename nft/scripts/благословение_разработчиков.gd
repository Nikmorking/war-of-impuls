extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.tipy == "Player":
			body.nhf = false
			body.vampr = false
			body.xzz = false
			body.damage *= 70
			body.SPEED = 1000
			body.pulla = false
			print("благо")
			queue_free()
pass
