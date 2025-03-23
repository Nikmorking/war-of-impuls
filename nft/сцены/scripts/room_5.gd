extends Node

signal timeout
var spaw_mob

func _spawn(vid:Resource):
	var chil = get_children()
	for i in chil.size():
		if chil[i] is Marker2D:
			chil[i].spaw_mob = vid
	$room5.spawn()
	pass

func spawn():
	timeout.emit()
	pass
