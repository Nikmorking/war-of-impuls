extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("spawn"):
		var mob = load("res://сцены/Воин.tscn").instantiate()
		get_parent().add_child(mob)
		mob.global_position = global_position
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
