extends Pluha
@export var vampirism = 10


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.tipy == "Player":
			body.vampr = true
			print("va")
			queue_free()
pass
