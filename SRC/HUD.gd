extends CanvasLayer

var coins = 0
var sec = 0

var data = {
		"time" : SaveScreen.DisplayValue,
	}

const SAVE_DIR = "user://saves/"
var save_path = SAVE_DIR + "save.dat"

func _ready() -> void:
	$Coins.text = String(coins)
	$Time.text = String(SaveScreen.DisplayValue) + " sec"
	
func _on_coin_collected() -> void:
	coins = coins + 1
	
func _physics_process(delta: float) -> void:
	$Time.text = String(SaveScreen.DisplayValue) + " sec"
	
	_ready()
	if coins == 18:
		yield(get_tree().create_timer(0.9), "timeout")
		get_tree().change_scene("res://LEVELS/Win screen.tscn")
		
		var data = {
		"time" : SaveScreen.DisplayValue,
		}
	
		var dir = Directory.new()
		if !dir.dir_exists(SAVE_DIR):
			dir.make_dir_recursive(SAVE_DIR)
		
		var file = File.new()
		var error = file.open(save_path, File.WRITE)
		if error == OK:
			file.store_var(data)
			file.close()


func _on_MenuButton_pressed() -> void:
	get_tree().change_scene("res://SRC/TitleMenu.tscn")
