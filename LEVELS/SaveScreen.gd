extends Control

var DisplayValue
	
onready var timer = get_node("Timer")

func _ready() -> void:
	DisplayValue = 0
	timer.set_wait_time(1)
	timer.start()

func _on_Timer_timeout() -> void:
	DisplayValue += 1

