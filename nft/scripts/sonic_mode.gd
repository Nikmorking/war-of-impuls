extends Area2D

@export var Speed_ap = 500
@export var Speed_down = 500


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.tipy == "Player":
			Enemy.SPEED = Speed_down
			body.SPEED += Speed_ap
			print("va")
			queue_free()
pass
