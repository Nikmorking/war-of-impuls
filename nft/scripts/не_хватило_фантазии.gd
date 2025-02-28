extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.tipy == "Player":
			body.nhf = true
			print("vav")
			queue_free()
pass# смерть лучника с одного выстрела;
