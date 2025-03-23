extends "res://scripts/Basic_enemy.gd"

var down = true
var res = load("res://asset/dialoges/Mib1.dialogue")

@export var pri = false
@export var mib = false
# Called when the node enters the scene tree for the first time.

func _enter_tree():
	play = !mib
	Gg.connect("_start_bos", start)
	Gg.connect("_win_bos", win)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if play:
		if movi:
			move_to_player(delta)
			#$CollisionPolygon2D.disabled = false
		else:
			hit_player()
		#$CollisionPolygon2D.disabled = true
		if health < 100 and mib:
			play = false
			DialogueManager.show_dialogue_balloon(res, "win")
	else:
		if !pri:
			health = max_health
	pass

func hit_player()->void:
	if hit:
		print(111)
		player.health -= damage
		player.vis_health()
		down = true
		hit = false
	else:
		if down:
			$Timer.start()
			down = false
	pass


func call_down() -> void:
	hit = true
	pass # Replace with function body.

func win():
	if mib:
		var lep = load("res://сцены/плюшки/челночки.tscn").instantiate()
		get_parent().add_child(lep)
		lep.position = position
	queue_free()
	pass

func start():
	play = true
	if $GPUParticles2D:
		$GPUParticles2D.emitting = true
	if $ff:
		$ff.emitting = true
	pass


func _on_player_restart() -> void:
	position = start_pos
	pass # Replace with function body.
