extends Node
var manik = false
var use_portal = false
signal _vis_ui
signal _vis_man
signal _open_door
signal _start_an_go
signal _start_bos
signal _win_bos
signal open_door_
signal _start_bos_2

func get_papa(col: float, sel: Node) -> Node:
	for i in col:
		sel = sel.get_parent()
	return sel

func vis_ui():
	_vis_ui.emit()
	pass

func opendoor():
	open_door_.emit()
	pass
	

func open_door():
	_open_door.emit()
	pass

func vis_man():
	_vis_man.emit()
	pass

func start_an_go():
	_start_an_go.emit()
	pass

func start_bos():
	_start_bos.emit()
	pass


func start_bos_2():
	_start_bos_2.emit()
	pass


func win_bos():
	_win_bos.emit()
	pass
