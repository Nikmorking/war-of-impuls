extends Node2D


var room = 0
var event = ""

var stop = load("res://dialogues/Запрет.dialogue")
var rand = load("res://dialogues/Random.dialogue")


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("start")
	$CharacterBody2D.play = false
	DialogueManager.show_dialogue_balloon(rand, "start")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_col_1(area):
	if room == 0:
		$AnimationPlayer.play("1")
		$CharacterBody2D.play = false
		$CharacterBody2D.position = $Marker2D.position
		
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
	if room == 2 and event == "meeting":
		$AnimationPlayer.play("4")
		$CharacterBody2D.play = false
		$CharacterBody2D.position = $Marker2D4.position
		room = 3
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
		DialogueManager.show_dialogue_balloon(stop, "go_out")
	pass # Replace with function body.
