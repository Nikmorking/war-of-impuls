extends Pluha

@export var Speed_ap = 500
@export var Speed_down = 0.1


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.tipy == "Player":
			for enemy in get_tree().get_nodes_in_group("Enemys"):
				enemy.SPEED *= Speed_down
			body.SPEED += Speed_ap
			print("va")
			queue_free()
pass
