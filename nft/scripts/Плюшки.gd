extends CollisionObject2D
class_name Pluha

func _mouse_enter() -> void:
	$Label.visible = true
	print("tt")
	pass

func _mouse_exit() -> void:
	$Label.visible = false
	print("77")
	pass
