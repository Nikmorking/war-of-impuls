extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Gg.connect("open_door_", open_door)
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


func open_door():
	if $AnimatedSprite2D:
		$AnimatedSprite2D.play("open")
		$StaticBody2D/Coll.set_deferred("disabled", true)
		get_parent().get_node("Anim/op").show()
		get_parent().get_node("Anim").play("go")
	pass

func _on_open_door_finished() -> void:
	$"ДверьЗакрытая".hide()
	$"ДверьОткрытая".show()
	$StaticBody2D/Coll.set_deferred("disabled", true)
	pass # Replace with function body.
