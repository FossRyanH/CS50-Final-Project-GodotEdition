extends KinematicBody2D

onready var state = MOVE
enum {
	MOVE,
	ATTACK
}

onready var anim_tree : AnimationTree = $AnimationTree
onready var anim_state = anim_tree.get("parameters/playback")

export var speed : float = 125.0
var velocity : Vector2 = Vector2.ZERO


func _physics_process(delta: float) -> void:
	match state:
		MOVE:
			move_state()
		ATTACK:
			attack_state()
	

func move_state() -> void:
	var input_movement : Vector2 = Vector2.ZERO
	input_movement.x = Input.get_axis("move_left", "move_right")
	input_movement.y = Input.get_axis("move_up", "move_down")
	
	if input_movement != Vector2.ZERO:
		anim_tree.set("parameters/idle/blend_position", input_movement)
		anim_tree.set("parameters/walk/blend_position", input_movement)
		anim_tree.set("parameters/attack/blend_position", input_movement)
		anim_state.travel("walk")
		velocity += input_movement * speed
		velocity = velocity.limit_length(speed)
	else:
		anim_state.travel("idle")
		velocity = Vector2.ZERO
	
	move_and_slide(velocity)


func attack_state() -> void:
	pass
