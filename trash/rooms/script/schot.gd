extends Sprite2D

var sec = 0
var min = 0


func _on_button_down():
	$Timer.start()
	pass # Replace with function body.


func _on_button_up():
	$Timer.stop()
	pass # Replace with function body.


func _on_timeout():
	sec += 1
	if sec == 60:
		min += 1
		sec = 0
	$min.text = str(min) 
	$sec.text = str(sec)
	pass # Replace with function body.
