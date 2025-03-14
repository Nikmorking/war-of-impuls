extends Enemies

func _ready() -> void:
	Gg.connect("_vis_man",vis_this)
	health = max_health
	pass


func _process(delta: float) -> void:
	if health <= 40:
		get_parent().get_node("ЧелвЧёрном").manik = 2
		queue_free()
	pass

func vis_this():
	show()
	pass
