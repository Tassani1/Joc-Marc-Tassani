extends Area2D
export (String) var escena

func _on_portafinal_body_entered(body):
	$CanvasLayer/NinePatchRect.visible = true
