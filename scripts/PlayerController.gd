extends KinematicBody2D

export var speed := 125.0

onready var sprite: Sprite = $Sprite
onready var anim_tree: AnimationTree = $AnimationTree
onready var anim_player: AnimationPlayer = $AnimationPlayer

# The threshold for changing directions
var threshold := 0.1
var direction_being_faced := "left"

func face_mouse() -> void:
	# Get mouse Position
	var mouse_pos = get_viewport().get_mouse_position()
	# Calc the angle between the character and mouse
	var angle = mouse_pos.angle_to(get_global_position())
	
	# This will likely be removed later
	sprite.rotation = angle
	

func move_towards_mouse() -> void:
	# Get mouse pos
	var mouse_pos = get_viewport().get_mouse_position()
	# Get horizontal axis
	var horizontal_axis = (mouse_pos.x - get_global_position().x) / get_viewport_rect().size.x
	
	# Check if the character should move left or right
	if horizontal_axis < -threshold:
		direction_being_faced = "idle_right"
		
		# Play the "right" animation
		anim_player.play("idle_right")
		
		# Set the "move" and "direction" parameters in the animation tree
		anim_tree.set_parameter("idle", true)
		anim_tree.set_parameter("direction", "right")
		
		# Move the character
		var velocity := Vector2(speed, 0)
		move_and_slide(velocity)
	else:
		# If character is not moving, play the idle animation
		anim_player.play("idle_down")
		# Set "move" parameter in the animation tree idle animation
		anim_tree.set_parameter("idle", false)a
		

func _input(event) -> void:
	# Check if the movement button is pressed
	if event.is_action_pressed("move_up"):
		face_mouse()
		move_towards_mouse()
