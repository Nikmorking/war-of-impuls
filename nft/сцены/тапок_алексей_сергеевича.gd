extends Area2D

@export var damage_up = 5

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.tipy == "Player":
			body.damage += damage_up
			body.pulla = true
			queue_free()
			print("damage_ap")
pass
