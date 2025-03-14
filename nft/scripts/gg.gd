extends Node
var manik = false
signal _vis_ui
signal _vis_man
signal _open_door

func get_papa(col: float, sel: Node) -> Node:
	for i in col:
		sel = sel.get_parent()
	return sel

func vis_ui():
	_vis_ui.emit()
	pass

func open_door():
	_open_door.emit()
	pass

func vis_man():
	_vis_man.emit()
	pass
