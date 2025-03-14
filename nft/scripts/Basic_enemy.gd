extends "res://scripts/Entity.gd"

var player
var player_position
var play = true
var hit = false
var movi = true
var top = false

@onready var nav: NavigationAgent2D = $NavigationAgent2D
@onready var start_pos = position

func move_to_player(delta: float) -> void:
	if player == null:
		player = self
	nav.target_position = player.position
	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = nav.get_next_path_position()

	velocity = current_agent_position.direction_to(next_path_position) * SPEED
	move_and_slide()
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body == player):
		movi = false
	pass # Replace with function body.
	


func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body == player):
		movi = true
	pass # Replace with function body.

func wait(time: float) -> void:
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = time
	timer.start()
	if(timer.time_left == 0):
		hit = true
	pass

func get_player() -> void:
	player = get_parent().get_node("Player")
	pass


func tik() -> void:
	$hot_bar.visible = false
	if($GPUParticles2D != null):
		$GPUParticles2D.emitting = false
	pass # Replace with function body.

func vis_health() -> void:
	var hot_bar:TextureProgressBar = get_node("hot_bar/ProgressBar")
	hot_bar.max_value = max_health
	hot_bar.value = health
	$hot_bar.visible = true
	pass

func _ready() -> void:
	health = max_health
	if(self.name != "Enemy"):
		tik()
		vis_health()
		get_player()
	pass
