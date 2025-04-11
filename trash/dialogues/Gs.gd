extends Node

var day = 0
var event = ""

signal play_
signal stop_
signal end_day

func new_day():
	end_day.emit()
	pass

func _play():
	play_.emit()
	pass

func _stop():
	stop_.emit()
	pass
