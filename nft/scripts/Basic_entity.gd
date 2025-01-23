extends CharacterBody2D

@export var speed = 0.1

var player
var pos_player
var play = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_parent().get_node("Player")
	pass # Replace with function body.
