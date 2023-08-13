extends StaticBody2D

func _on_area_2d_body_entered(body):
	print("body entered")
	if(body.name == "GrayCat"):
		$"../GrayCat".allow_drop = true

func _on_area_2d_body_exited(body):
	if(body.name == "GrayCat"):
		$"../GrayCat".allow_drop = false
