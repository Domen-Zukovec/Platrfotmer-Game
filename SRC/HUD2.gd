extends CanvasLayer

var hearts = 3

const SAVE_DIR = "user://saves/"

var save_path = SAVE_DIR + "save.dat"



func _ready() -> void:
	
	var file = File.new()

	if file.file_exists(save_path):
		var error = file.open(save_path, File.READ)
		if error == OK:
			var player_data = file.get_var()
			file.close()
			$TTB.text = "Time to beat: " + String(player_data.time) + " sec"
	$Hearts.text = String(hearts)
	


func _on_enemy_heart_down() -> void:
	hearts = hearts - 1
	_ready()
	if hearts == 0:
		yield(get_tree().create_timer(0.3), "timeout")
		get_tree().change_scene("res://SRC/End screen.tscn")
