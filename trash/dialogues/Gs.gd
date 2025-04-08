extends Node

var day = 0
var event = ""

signal play_
signal stop_


func _play():
	play_.emit()
	pass

func _stop():
	stop_.emit()
	pass
