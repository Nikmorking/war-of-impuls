extends Pluha

@export var damage_ap = 5

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.tipy == "Player":
			body.damage += damage_ap
			queue_free()
			print("damage_ap")
pass
