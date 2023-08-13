extends CanvasLayer

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://src/casa.tscn")
	pass

func _on_quit_button_pressed() -> void:
	get_tree().quit()
