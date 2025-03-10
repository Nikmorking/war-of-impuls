extends Pluha


@export var damage_up = 5

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.tipy == "Player":
			get_parent().add_child(load("res://сцены/лепёшка.tscn").instantiate())
			queue_free()
	pass
