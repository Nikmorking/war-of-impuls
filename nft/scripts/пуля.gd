extends Node2D

@export var speed = 0.1
@export var damage = 10
var vamp : String
var vampirism : bool = false
var xz = false
var nhfa = false

var pos
var stop = false


func _process(_delta: float) -> void:
	if pos is Vector2 and !stop:
		position = lerp(position, pos, speed)
	if pos == position:
		stop = true
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if stop:
			if body.tipy == "Player":
				body.Shoot()
				queue_free()
		if body is Enemy:
			if body.tipy == "леп":
				return
			body.health -= damage
			if body.tipy =="враг":
				if xz == true:
					body.health -= body.health
			if body.tipy =="Лучник":
				if nhfa == true:
					body.health -= body.health
			stop = true
			print("gg")
			if vampirism == true:
				get_tree().root.get_node(vamp).health += 10
			body.health -= damage
			body.vis_health()
			if(body.health <= 0):
				body.queue_free()
				Gg.get_papa(2, self).kill()
	else:
		stop = true
	pass 


func _on_timer_timeout() -> void:
	stop = true
	pass # Replace with function body.
