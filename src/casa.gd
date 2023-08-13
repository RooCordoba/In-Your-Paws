extends StaticBody2D

var level_objective_completed = false

var rata1 =preload("res://src/collectable/rat_1.tscn")
var rata2 =preload("res://src/collectable/rat_2.tscn")
var rata3 =preload("res://src/collectable/rat_3.tscn")
var rata4 =preload("res://src/collectable/rat_4.tscn")
var rataTP =preload("res://src/collectable/teleport_fish.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Event.level_completed.connect(transition_of_level)
	pass

func transition_of_level():
	await LevelTransition.fade_to_white()
	get_tree().change_scene_to_file("res://src/worlds/world_2.tscn")
	await LevelTransition.fade_from_white()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
