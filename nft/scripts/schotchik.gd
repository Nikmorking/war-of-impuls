extends Node2D

@onready var door:AnimatedSprite2D = get_node("AnimatedSprite2D")
var schot = 0
@export var nid = 10
@export var win = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	FileSave.save_game()
	pass # Replace with function body.

func kill()->void:
	if(schot == nid):
		var chel = load("res://сцены/челночки.tscn").instantiate()
		add_child(chel)
		chel.global_position = get_node("Spawn_pos").position
		nid *= 2
		if(schot == win):
			Open_door()
	schot += 1
	if schot == 10:
		$Player.exp += 1
		print("Никита бесит")
	get_node("UI/Label3").text = str(schot)
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func Open_door():
	door.play("default")
	door.get_node("StaticBody2D").queue_free()
	pass


func _on_animated_sprite_2d_animation_finished() -> void:
	door.stop()
	pass # Replace with function body.


func _on_button_button_down() -> void:
	visible = false
	pass # Replace with function body.
