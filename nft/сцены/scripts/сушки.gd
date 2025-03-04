extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.tipy == "Player":
			
			print("vamp")
			queue_free()
pass
