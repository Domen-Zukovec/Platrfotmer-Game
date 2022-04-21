extends Control

const SAVE_DIR = "user://saves/"

var save_path = SAVE_DIR + "save.dat"

func _ready() -> void:
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path, File.READ)
		if error == OK:
			var player_data = file.get_var()
			file.close()
			$BestTime.text = String(player_data.time) + " sec"
