extends Area2D

func _on_body_entered(body):
	print("estoy en el to fish")
	Event.level_completed.emit()

