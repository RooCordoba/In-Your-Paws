extends Area2D

func _on_body_entered(body):
	print("estoy en el to fish")
	$".".queue_free()
	$"../GrayCat".can_move = false
	$"..".level_objective_completed = true

