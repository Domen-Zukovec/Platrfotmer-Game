extends Button

func _ready() -> void:
	pass

func _on_PlayButton_pressed() -> void:
	SaveScreen.DisplayValue = 0
	get_tree().change_scene("res://LEVELS/Level1.tscn")
