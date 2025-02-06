extends Node2D

var mob

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	mob = load("res://сцены/Воин.tscn").instantiate()
	get_parent().add_child(mob)
	mob.global_position = global_position
	pass # Replace with function body.
