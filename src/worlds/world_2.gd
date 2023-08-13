extends StaticBody2D

var level_objective_completed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Event.level_completed.connect(transition_of_level)
	pass

func transition_of_level():
	await LevelTransition.fade_to_white()
	get_tree().change_scene_to_file("res://src/creditos.tscn")
	await LevelTransition.fade_from_white()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
