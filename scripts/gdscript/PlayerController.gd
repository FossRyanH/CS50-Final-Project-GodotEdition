extends KinematicBody2D

export var speed : float = 125.0
var velocity : Vector2 = Vector2.ZERO


func _physics_process(delta: float) -> void:
	var input_movement : Vector2 = Vector2.ZERO
	input_movement.x = Input.get_axis("move_left", "move_right")
	input_movement.y = Input.get_axis("move_up", "move_down")
	
	if input_movement != Vector2.ZERO:
		velocity += input_movement * speed
		velocity = velocity.limit_length(speed)
	else:
		velocity = Vector2.ZERO
	
	move_and_slide(velocity)
