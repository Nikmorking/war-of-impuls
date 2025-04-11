extends Sprite2D


@export var main: Node2D



func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		if visible == true:
			hide()
		else:
			show()
	pass

func _on_button_button_down():
	hide()
	main.new_day()
	pass # Replace with function body.


func _on_button_2_button_down():
	$ColorRect.show()
	pass # Replace with function body.


func _on_button_3_button_down():
	get_tree().quit()
	pass # Replace with function body.
