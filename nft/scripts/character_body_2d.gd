extends "res://scripts/Entity.gd"

var move
var dep = false
var pulla = 0
var vampr = false
var xzz = false
var nhf = false
var lapka = 5
var play = true

signal restart

@onready var start_pos = get_parent().get_node("Spawn_pos").position
@onready var ui = Gg.get_papa(1, self).get_node("UI")
@onready var black = ui.get_node("black") 

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_released("mouse_right"):
		if lapka != 2 and lapka != 3:
			shoot()
			if lapka == 1:
				lapka = 3
				$Icon.texture = load("res://asset/импульс/импульс3.png")
			if lapka == 0:
				lapka = 2
				$Icon.texture = load("res://asset/импульс/импульс.png")
	if Input.is_action_just_released("mouse_left"):
		if lapka != 1 and lapka != 3:
			shoot()
			if lapka == 2:
				lapka = 3
				$Icon.texture = load("res://asset/импульс/импульс3.png")
			if lapka == 0:
				lapka = 1
				$Icon.texture = load("res://asset/импульс/импульс2.png")
	#if Input.is_action_just_released("devlog"):
		#ui.get_node("TextEdit").visible = true
		#dep = true
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
	if play:
		move_player()
	if(health <= 0):
		die()
	move_and_slide()
	pass

func die()->void:
	print("die")
	black.visible = true
	$Timer2.start()
	health = max_health
	Enemy.play = false
	get_parent().schot = 0
	play = false
	lapka = 0
	var pyli = get_parent().get_node("Пули").get_children()
	for i in pyli.size():
		pyli[i].queue_free()
	$Icon.texture = load("res://asset/импульс/перс.png")
	pass


func shoot() -> void:
	var pyl
	if pulla == 0:
		pyl = load("res://сцены/Пуля.tscn").instantiate()
	if pulla == 1:
		pyl = load("res://сцены/Тапок.tscn").instantiate()
	if pulla == 2:
		pyl = load("res://сцены/Тапок.tscn").instantiate()
	get_parent().get_node("Пули").add_child(pyl)
	pyl.vamp = get_path()
	pyl.global_position = position
	pyl.pos = get_global_mouse_position()
	pyl.damage = damage
	pyl.xz = xzz
	pyl.nhfa = nhf
	pyl.vampirism = vampr
	pass

func vis_health()->void:
	var bar: TextureProgressBar = ui.get_node("hot_bar/ProgressBar")
	bar.max_value = max_health
	bar.value = health
	ui.get_node("Label").text = str(health)
	pass



func call_down() -> void:
	black.visible = false
	position = start_pos
	restart.emit() 
	play = true
	pass # Replace with function body.


func Shoot() -> void:
	if lapka == 2:
		$Icon.texture = load("res://asset/импульс/перс.png")
		lapka = 0
	if lapka == 1:
		$Icon.texture = load("res://asset/импульс/перс.png")
		lapka = 0
	if lapka == 3:
		$Icon.texture = load("res://asset/импульс/импульс.png")
		lapka = 2
		
	pass # Replace with function body.


func _on_timer_2_timeout() -> void:
	Gg.get_papa(2, self)._on_lose_button_pressed()
	pass # Replace with function body.
