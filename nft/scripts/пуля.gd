extends Node2D

@export var speed = 0.1
@export var damage = 10
var vamp : String
var vampirism : bool = false


var pos
var stop = false


func _process(_delta: float) -> void:
	if pos is Vector2 and !stop:
		position = lerp(position, pos, speed)
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body is Enemy:
			stop = true
			print("gg")
			body.health -= damage
			if vampirism == true:
				get_tree().root.get_node(vamp).health += 10
			if(body.health <= 0):
				body.queue_free()
				Gg.get_papa(2, self).kill()
	else:
		stop = true
	pass 


func _on_timer_timeout() -> void:
	queue_free()
	pass
