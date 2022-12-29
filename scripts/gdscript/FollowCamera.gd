extends Camera2D

onready var player = $"../Player"


func _process(delta: float) -> void:
	position = player.global_position
	var x_pos = floor(position.x / 512) * 512
	var y_pos = floor(position.y / 300) * 300
	global_position = Vector2(x_pos, y_pos)
