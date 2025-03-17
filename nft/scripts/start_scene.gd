extends Node2D

var end = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("start")
	pass # Replace with function body.


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("mouse_left") or Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_cancel"):
		if end:
			get_parent().win()
		else:
			$AnimationPlayer.play("end")
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	end = true
	pass # Replace with function body.
