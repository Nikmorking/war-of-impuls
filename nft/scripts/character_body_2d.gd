extends "res://scripts/Entity.gd"

var move
var dep = false
var call = 2
var pulla = 0
var vampr = false
var xzz = false
var nhf = false

signal restart

@onready var start_pos = get_parent().get_node("Spawn_pos").position
@onready var ui = Gg.get_papa(1, self).get_node("UI")
@onready var black = ui.get_node("black") 

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_released("mouse_left"):
		if call == 2:
			shoot(get_global_mouse_position())
			$Icon.texture = load("res://asset/импульс.png")
			call = 1
		if call == 1:
			$Timer2.start()
			call = 0
	if Input.is_action_just_released("devlog"):
		ui.get_nodea("TextEdit").visible = true
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
	if health >= max_health:
		health = max_health
	if(health <= 0):
		die()
	move_and_slide()
	pass

func die()->void:
	print("die")
	#black.visible = true
	$Timer.start()
	health = max_health
	Enemy.play = false
	get_parent().schot = 0
	pass


func shoot(vector: Vector2) -> void:
	var pyl
	if pulla == 0:
		pyl = load("res://сцены/Пуля.tscn").instantiate()
	if pulla == 1:
		pyl = load("res://сцены/Тапок.tscn").instantiate()
	if pulla == 2:
		pyl = load("res://сцены/Тапок.tscn").instantiate()
	get_tree().root.get_node("Node2D/Пули").add_child(pyl)
	pyl.vamp = get_path()
	pyl.global_position = position
	pyl.pos = vector
	pyl.damage = damage
	pyl.xz = xzz
	pyl.nhfa = nhf
	pyl.vampirism = vampr
	pass

func vis_health()->void:
	ui.get_node("Label").text = str(health)
	pass



func call_down() -> void:
	#black.visible = false
	position = start_pos
	restart.emit()
	pass # Replace with function body.


func Shoot() -> void:
	call = 2
	$Icon.texture = load("res://asset/перс.png")
	pass # Replace with function body.
