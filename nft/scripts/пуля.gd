extends Node2D

@export var speed = 0.1
var pos
var stop = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _process(delta: float) -> void:
	if pos is Vector2 and !stop:
		position = lerp(position, pos, speed)
	pass


func _on_body_entered(body: Node2D) -> void:
	if(body != get_parent().get_parent().get_node("Player")):
		stop = true
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.
