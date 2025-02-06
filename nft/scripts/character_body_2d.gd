extends "res://scripts/Entity.gd"

var move
var dep = false

signal restart

@onready var start_pos = get_parent().get_node("Spawn_pos").position
@onready var ui = Gg.get_papa(1, self).get_node("UI")
#@onready var black = ui.get_node("black") 

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_released("mouse_left"):
		shoot(get_global_mouse_position())
	if Input.is_action_just_released("devlog"):
		ui.get_node("TextEdit").visible = true
		dep = true
	if Input.is_action_just_released("ui_accept"):
		if dep:
			var texter = ui.get_node("TextEdit").text
			if (texter == "gamemode casual"):
				print("{jhji}")
	pass
func _ready() -> void:
	vis_health()
	pass

func move_player() -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		velocity.x = move_toward(velocity.x, 0, SPEED)
	pass

func _physics_process(_delta: float) -> void:
	move_player()
	if(health <= 0):
		die()
	move_and_slide()
	pass

func die()->void:
	print("die")
	#black.visible = true
	$Timer.start()
	health = 100
	Enemy.play = false
	pass


func shoot(vector: Vector2) -> void:
	var pyl = load("res://сцены/Пуля.tscn").instantiate()

	get_tree().root.get_node("Node2D/Пули").add_child(pyl)
	pyl.global_position = position
	pyl.pos = vector
	pass

func vis_health()->void:
	ui.get_node("Label").text = str(health)
	pass



func call_down() -> void:
	#black.visible = false
	position = start_pos
	restart.emit()
	pass # Replace with function body.
