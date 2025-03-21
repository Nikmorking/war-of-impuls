extends Node2D

var door:AnimatedSprite2D
var schot = 0
var col = 0


@export var nid:int
@export var win:int

var res = load("res://asset/dialoges/Mib1.dialogue")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	FileSave.save_game()
	Gg.connect("_open_door",Open_door)
	Gg.connect("_start_an_go",start_an_go)
	if get_node("AnimatedSprite2D"):
		door = get_node("AnimatedSprite2D")
	pass # Replace with function body.

func kill()->void:
	schot += 1
	#if(schot == win):
		#Open_door()
	if(schot == nid):
		var chel = load("res://сцены/челночки.tscn").instantiate()
		add_child(chel)
		chel.global_position = get_node("Spawn_pos").position
		nid *= 2
	get_node("Player/UI/Label3").text = str(schot)
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func Open_door():
	door.play("default")
	door.get_node("StaticBody2D").queue_free()
	pass


func _on_animated_sprite_2d_animation_finished() -> void:
	door.play("con")
	pass # Replace with function body.

func start_an_go():
	if $AnimationPlayer:
		$AnimationPlayer.play("go")
		$AudioStreamPlayer.play()
	pass




func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$AnimationPlayer.play("stop")
	pass # Replace with function body.


func _portal(body:Node2D) -> void:
	if Gg.use_portal:
		get_parent().win()
	pass # Replace with function body.


func col_1(body: Node2D) -> void:
	if col == 0:
		$room1.start()
		col = 1
	pass # Replace with function body.


func col_2(body: Node2D) -> void:
	if col == 1:
		$room2.start()
		col = 2
	pass # Replace with function body.


func col_3(body: Node2D) -> void:
	if col == 2:
		$room3.start()
		col = 3
	pass # Replace with function body.


func col_4(body: Node2D) -> void:
	if col == 3:
		$door/StaticBody2D/Coll.set_deferred("disabled", false)
		$"door/ДверьЗакрытая".show()
		$"door/ДверьОткрытая".hide()
		DialogueManager.show_dialogue_balloon(res,"start")
		col = 4
	pass # Replace with function body.


func _on_animation_finished(anim_name: StringName) -> void:
	Gg.use_portal = true
	pass # Replace with function body.
