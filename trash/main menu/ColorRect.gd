extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = str(Gs.day + 1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_button_down():
	if Gs.day < 9:
		Gs.day += 1
		$Label.text = str(Gs.day + 1)
	print(Gs.day)
	pass # Replace with function body.


func _on_button_2_button_down():
	if Gs.day > 0:
		Gs.day -= 1
		$Label.text = str(Gs.day+1)
	print(Gs.day)
	pass # Replace with function body.
