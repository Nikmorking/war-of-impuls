extends Area2D

@export var vost_xp = 10
var xp

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.tipy == "Player":
			print("xx")
			if(body.max_health != body.health):
				xp = body.health
				xp = xp / 100.0
				print(xp)
				xp=xp*22
				body.health = body.health + xp
				body.health = body.health/1
				body.vis_health()
				queue_free()
	pass
