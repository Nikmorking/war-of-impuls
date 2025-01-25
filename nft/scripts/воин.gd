extends "res://scripts/Basic_entity.gd"

var timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_player()
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 0.5
	timer.connect("timeout", self, "hit")
	timer.start()

func hit() -> void:
	player.heals -= 1
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if play:
		move_to_player(delta)
	pass
