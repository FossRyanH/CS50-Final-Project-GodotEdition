extends Area2D



func _on_Coin_body_entered(body):
	if body.name == "Player":
		$Anim.play("coin_pick")
		yield(get_node("Anim"), "animation_finished")
		queue_free()
