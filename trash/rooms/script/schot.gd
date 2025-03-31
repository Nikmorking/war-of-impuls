extends Sprite2D

var schot = 0


func _on_button_down():
	$Monitor/preesed.show()
	$Monitor/not.hide()
	pass # Replace with function body.


func _on_button_up():
	$Monitor/preesed.hide()
	$Monitor/not.show()
	pass # Replace with function body.


func _on_timeout():
	schot += 1
	pass # Replace with function body.
