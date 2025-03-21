extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.key:
			$OpenDoor.play()
			body.key = false
			#$StaticBody2D.hide()
	pass # Replace with function body.


func _on_open_door_finished() -> void:
	$"ДверьЗакрытая".hide()
	$"ДверьОткрытая".show()
	$StaticBody2D/Coll.set_deferred("disabled", true)
	pass # Replace with function body.
