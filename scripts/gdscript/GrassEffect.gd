extends Node2D


func _ready() -> void:
	$Anim.play("grass_fall")
	yield($Anim, "animation_finished")
	queue_free()
