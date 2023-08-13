extends Area2D

func _on_body_entered(body):
	$".".queue_free()
	$"../GrayCat".can_move = false
	$"..".level_objective_completed = true
	print($"..".level_objective_completed)
