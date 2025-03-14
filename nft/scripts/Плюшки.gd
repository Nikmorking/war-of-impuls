extends CollisionObject2D
class_name Pluha

func _mouse_enter() -> void:
	$Label.visible = true
	pass

func _mouse_exit() -> void:
	$Label.visible = false
	pass
