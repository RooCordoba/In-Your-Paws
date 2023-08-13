extends CanvasLayer

@onready var animation_player = $AnimationPlayer

func fade_to_white():
	animation_player.play("fade_to_white")
	await animation_player.animation_finished
	
func fade_from_white():
	animation_player.play("fade_from_white")
	await animation_player.animation_finished
