extends Area2D

@export var vost_xp = 10


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.tipy == "Player":
			print("xx")
			body.health += vost_xp
			body.vis_health()
		else:
			print("EEE")
	pass
