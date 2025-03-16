extends Node

signal level_won
signal level_lost

var level_state : LevelStateExample

func win():
	level_won.emit()
	pass

func _on_lose_button_pressed():
	level_lost.emit()

func _on_win_button_pressed():
	level_won.emit()

#func _ready():
	#level_state = GameStateExample.get_level_state(scene_file_path)
func _on_color_picker_button_color_changed(color):
	%BackgroundColor.color = color
	level_state.color = color
	GlobalState.save()
