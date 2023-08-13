extends StaticBody2D



func _on_area_2d_body_entered(body):
	if body.name == "GrayCat" and $"..".level_objective_completed == true:
		print("cambio de nivel")
		$"../GrayCat".get_node("AnimatedSprite2D").hide()
		Event.level_completed.emit()



func _on_area_2d_body_exited(body):
	pass # Replace with function body.
