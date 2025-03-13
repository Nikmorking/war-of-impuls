extends Node2D

var res = load("res://asset/dialoges/gman.dialogue")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		DialogueManager.show_dialogue_balloon(res, "start")
	pass # Replace with function body.
