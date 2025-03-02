extends Node


func load_game():
	var save_file = FileAccess.open("user://savegame.save", FileAccess.READ)
	if not save_file:
		return
	print(save_file.get_line())
	pass

func save_game():
	var save_file = FileAccess.open("user://savegame.json", FileAccess.WRITE)
	if not save_file:
		return
	var save_dict = {
		"filename" : "eeeee",
		"parent" : "rrrr"
	}
	save_file.store_line(JSON.stringify(save_dict))
	pass
