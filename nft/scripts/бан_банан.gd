extends Pluha

@export var damage_up = 100

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.tipy == "Player":
			body.health = 1
			body.max_health = 1
			body.damage = damage_up
			body.pulla = 2
			body.vis_health()
			queue_free()
			print("damage_ap")
pass
