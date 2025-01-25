extends CharacterBody2D

var player
var player_position
var play = true

@export var SPEED = 10
@export var damage = 1

func move_to_player(delta: float) -> void:
	player_position = player.global_position
	var enemy_position = global_position
	var direction = player_position - enemy_position
	direction = direction.normalized()
	var motion = direction * SPEED * delta
	move_and_collide(motion)
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body == player):
		play = false
		$Timer.start()
	pass # Replace with function body.
	


func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body == player):
		play = true
	pass # Replace with function body.

func wait(time: float)->
 timer = Timer.new()
 add_child(timer)
 timer.wait_time = time
 timer.connect("timeout", self, hit())
 timer.start()



func get_player() -> void:
	player = get_parent().get_node("Player")
	pass
