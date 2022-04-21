extends Area2D

signal coin_collected

func _on_Coin_body_entered(body: Node) -> void:
	set_collision_mask_bit(0, false)
	set_collision_layer_bit(3, false)
	$AnimationPlayer.play("bounce")
	emit_signal("coin_collected")
	$SoundCoinCollect.play()

	
func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	queue_free()
