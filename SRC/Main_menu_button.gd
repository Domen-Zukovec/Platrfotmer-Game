extends Button

func _ready() -> void:
	pass

func _on_Main_menu_button_pressed() -> void:
		get_tree().change_scene("res://SRC/TitleMenu.tscn")
