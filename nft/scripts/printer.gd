extends Node2D

var res = load("res://asset/dialoges/принтер.dialogue")
var mob1 = load("res://сцены/враги и другие/Воин.tscn")
var mob2 = load("res://сцены/враги и другие/лучник.tscn")
var mob3 = load("res://сцены/враги и другие/Маг.tscn")
var mob4 = load("res://сцены/враги и другие/хиллер.tscn")
var vid


func _start_dial():
	DialogueManager.show_dialogue_balloon(res, "start")
	pass

func start():
	$"Миб2(живой)".hide()
	$"Миб2(думает)".show()
	$CharacterBody2D.pri = true
	$CharacterBody2D/Tik.start()
	$CharacterBody2D/Timer.start()
	_on_tik_timeout()
	pass

func vis():
	$"Миб2(живой)".show()
	$"Миб2(вещь)".hide()
	pass


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Gg.connect("_start_bos_2", start)
	Gg.connect("_vis_bos",vis)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $CharacterBody2D:
		if $CharacterBody2D.health < 50:
			Gg.get_papa(2, self).win()
	pass


func _on_tik_timeout() -> void:
	$"Миб2(думает)".hide()
	vid = randi_range(1,4)
	if vid == 1:
		$"Миб2(воин)".show()
		$room5._spawn(mob1)
	if vid == 2:
		$"Миб2(стрелок)".show()
		$room5._spawn(mob2)
	if vid == 3:
		$"Миб2(маг)".show()
		$room5._spawn(mob3)
	if vid == 4:
		$"Миб2(хиллер)".show()
		$room5._spawn(mob4)
	
		
		
		
	print(vid)
	pass # Replace with function body.


func _on_invis() -> void:
	$"Миб2(думает)".show()
	if vid == 1:
		$"Миб2(воин)".hide()
	if vid == 2:
		$"Миб2(стрелок)".hide()
	if vid == 3:
		$"Миб2(маг)".hide()
	if vid == 4:
		$"Миб2(хиллер)".hide()
		
	pass # Replace with function body.
