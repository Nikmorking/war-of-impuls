extends Node2D

var res = load("res://asset/dialoges/gman.dialogue")
var manik = 0

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(res, "start")
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if manik == 1:
			DialogueManager.show_dialogue_balloon(res, "snova")
			get_parent().get_node("Player/UI").visible = false
		if manik == 0:
			manik = 1
			DialogueManager.show_dialogue_balloon(res, "podhod")
			get_parent().get_node("Player/UI").visible = false
		if manik == 2:
			DialogueManager.show_dialogue_balloon(res, "cont")
			manik = 5
			get_parent().get_node("Player/UI").visible = false
		
	pass # Replace with function body.




func vis_ui():
	get_parent().get_node("Player/UI").visible = true
	pass
