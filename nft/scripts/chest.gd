extends Node2D

var lot = true
var open = false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("open"):
		if open:
			if lot:
				$AnimatedSprite2D.play("open")
				$OpenChest.play()
				lot = false
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	$Label.show()
	open = true
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	$Label.hide()
	open = false
	pass # Replace with function body.


func _on_animated_sprite_2d_animation_finished() -> void:
	$AnimatedSprite2D.play("opened")
	var key = load("res://сцены/плюшки/кто_ты_воин.tscn").instantiate()
	add_child(key)
	key.position = $Area2D.position
	pass # Replace with function body.
