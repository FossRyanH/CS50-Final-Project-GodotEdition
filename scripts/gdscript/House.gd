extends StaticBody2D

onready var house_area := $PlayerDetector
onready var house_sprite := $Sprite


func _on_PlayerDetector_body_entered(body):
	if body.name == "Player":
		house_sprite.self_modulate.a = 0.65



func _on_PlayerDetector_body_exited(body):
	if body.name == "Player":
		house_area.emit_signal("area_exited")
		house_sprite.self_modulate.a = 1.0
