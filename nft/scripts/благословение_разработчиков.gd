extends Pluha

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.tipy == "Player":
			body.nhf = false
			body.vampr = false
			body.xzz = false
			body.damage *= 70
			body.pulla = 0
			print("благо")
			queue_free()
pass
