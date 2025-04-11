extends Node2D

@export var day_1 = load("")
@export var day_2 = load("")
@export var day_3 = load("")
@export var day_4 = load("")
@export var day_5 = load("")
@export var day_6 = load("")
@export var day_7 = load("")
@export var day_8 = load("")
@export var day_9 = load("")
@export var day_10 = load("")

var room = 0
var no_go = 1
var now_day


var stop = load("res://dialogues/Запрет.dialogue")
var rand = load("res://dialogues/Random.dialogue")


# Called when the node enters the scene tree for the first time.
func _ready():
	Gs.connect("end_day",new_day) 
	$AnimationPlayer.play("logo")
	pass # Replace with function body.


func tp_toilet():
	$CharacterBody2D.position = $Marker2D6.position
	$AnimationPlayer/Camera2D.position = $Marker2D6.position + Vector2(133, 0)
	pass


func _on_col_1(area):
	if room == 0:
		$AnimationPlayer.play("1")
		$CharacterBody2D.play = false
		$CharacterBody2D.position = $Marker2D.position
		DialogueManager.show_dialogue_balloon(now_day, "start")
		room = 1
	pass # Replace with function body.


func _on_1_anim_finished(anim_name):
	$CharacterBody2D.play = true
	pass # Replace with function body.


func _on_col_2(body):
	if room == 1:
		$AnimationPlayer.play("2")
		$CharacterBody2D.play = false
		$CharacterBody2D.position = $Marker2D2.position
		room = 2
	pass # Replace with function body.


func _on_col_3(body):
	if room == 2:
		$AnimationPlayer.play("3")
		$CharacterBody2D.play = false
		$CharacterBody2D.position = $Marker2D3.position
		room = 1
	pass # Replace with function body.


func _on_col_4(body):
	if room == 2 and Gs.event == "meeting":
		$AnimationPlayer.play("4")
		$CharacterBody2D.play = false
		$CharacterBody2D.position = $Marker2D4.position
		room = 3
	else:
		if Gs.event == "end":
			DialogueManager.show_dialogue_balloon(stop, "end_meet")
		else:
			if no_go == 1:
				DialogueManager.show_dialogue_balloon(stop, "no_go_1")
			if no_go == 2:
				DialogueManager.show_dialogue_balloon(stop, "no_go_2")
			if no_go == 3:
				DialogueManager.show_dialogue_balloon(stop, "no_go_3")
			no_go += 1
	pass # Replace with function body.


func _on_col_5(body):
	if room == 3:
		$AnimationPlayer.play("5")
		$CharacterBody2D.play = false
		$CharacterBody2D.position = $Marker2D5.position
		room = 2
	pass # Replace with function body.


func _on_col_go_out(body):
	if body is CharacterBody2D:
		DialogueManager.show_dialogue_balloon(stop, "go_out_1")
	pass # Replace with function body.


func _on_col_6(body):
	if room == 3:
		$AnimationPlayer.play("6")
		room = 4
	else:
		$AnimationPlayer.play("7")
		room = 3
	$CharacterBody2D.play = false
	pass # Replace with function body.




func _women(body):
	DialogueManager.show_dialogue_balloon(stop, "women")
	pass # Replace with function body.


func _on_col_7(body):
	if room == 4:
		$AnimationPlayer.play("8")
		room = 5
	else:
		if room == 5:
			$AnimationPlayer.play("9")
			room = 4
		else:
			go_work()
	pass # Replace with function body.


func go_work():
	DialogueManager.show_dialogue_balloon(stop, "go_work")
	$CharacterBody2D.position = $Marker2D5.position
	$AnimationPlayer.play("5")
	pass


func new_day():
	Gs.day += 1
	$CharacterBody2D.position = $Marker.position
	room = 0
	if Gs.day == 1:
		$AnimationPlayer/Camera2D/ColorRect/Label.text = "This is your first day \nat new work !"
		now_day = day_1
	else:
		if Gs.day == 10:
			$AnimationPlayer/Camera2D/ColorRect/Label.text = "Today is your birthday"
			now_day = day_10
		else:
			if Gs.day == 2:
				now_day = day_2
			if Gs.day == 3:
				now_day = day_3
			if Gs.day == 4:
				now_day = day_4
			if Gs.day == 5:
				now_day = day_5
			if Gs.day == 6:
				now_day = day_6
			if Gs.day == 7:
				now_day = day_7
			if Gs.day == 8:
				now_day = day_8
			if Gs.day == 9:
				now_day = day_9
			$AnimationPlayer/Camera2D/ColorRect/Label.text = "You come to work as usual."
	$AnimationPlayer.play("start")
	$CharacterBody2D.play = false
	pass


func _on_start_meeting(body):
	if Gs.event == "meeting":
		DialogueManager.show_dialogue_balloon(now_day, "meet")
		Gs.event = "end"
	pass # Replace with function body.

func vis():
	$Ekran2/min.show()
	$Ekran/min.show()
	pass

func end():
	get_tree().quit()
	pass
