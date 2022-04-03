extends Area2D
export (String) var escena


func _on_portafinal_body_entered(body):
	if body.name == "KinematicBody2D2":
		get_tree().change_scene("res://imatges/escenes/PantallaCossos.tscn")
