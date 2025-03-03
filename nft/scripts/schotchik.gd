extends Node2D


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
			get_parent()._on_win_button_pressed()
	schot += 1
	get_node("UI/Label3").text = str(schot)
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
