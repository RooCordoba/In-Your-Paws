extends StaticBody2D



func _on_area_2d_body_entered(body):
	if body.name == "GrayCat" and $"..".level_objective_completed == true:
		print("entro")
		$"../GrayCat".get_node("AnimatedSprite2D").hide()
		Event.level_completed.emit()



func _on_area_2d_body_exited(body):
	if body.name == "GrayCat" and $"..".level_objective_completed == true:
		$"..".level_objective_completed = false
