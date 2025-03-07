extends Area2D

@export var vost_xp = 10

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.tipy == "Player":
			print("xx")
			body.max_health *= 2
			body.health = body.max_health
			body.vis_health()
			queue_free()
		else:
			print("EEE")
	pass

func _on_mouse_shape_entered(shape_idx: int) -> void:
	$Label.visible = true
	print("EEEy6uty")
	pass # Replace with function body.

func _on_mouse_shape_exited(shape_idx: int) -> void:
	$Label.visible = false
	print("EEEy6uty")
	pass # Replace with function body.

func _on_mouse_entered() -> void:
	$Label.visible = true
	print("EEEy6uty")
	pass # Replace with function body.
