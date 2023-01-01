extends Area2D

onready var grass = preload("res://scenes/GrassEffect.tscn")


func _on_Grass_area_entered(area):
	if area.is_in_group("Sword"):
		var grassFX = grass.instance()
		get_parent().add_child(grassFX)
		grassFX.global_position = global_position
		queue_free()
