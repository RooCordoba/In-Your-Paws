extends CharacterBody2D

const ACCELERATION = 2500
const FRICTION = 1500.0
const SPEED = 350.0
const JUMP_VELOCITY = -700.0

var allow_drop = false
var can_move = true

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var starting_position = global_position

func _physics_process(delta: float) -> void:

	apply_gravity(delta)
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_axis := Input.get_axis("ui_left", "ui_right")
	
	
	apply_friction(input_axis, delta)
	

	move_and_slide()
	if can_move:
		handle_jump()
		handle_acceletarion(input_axis, delta)
		update_animation(input_axis)
	
	if(velocity.x >0):
		$AnimatedSprite2D.flip_h = false
	elif(velocity.x < 0):
		$AnimatedSprite2D.flip_h = true

func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * 1.0 * delta

func handle_jump():
	if is_on_floor():
		if (allow_drop == true) and Input.is_action_just_pressed("ui_accept") and Input.is_action_pressed("ui_down"):
			drop()
		elif Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
	else:
		# hace que se puedan hacer saltos mas cortoss
		if Input.is_action_just_released("ui_accept") and velocity.y< JUMP_VELOCITY/2:
			velocity.y = JUMP_VELOCITY/2
			
			
func apply_friction(input_axis, delta):
	if input_axis == 0:
		velocity.x = move_toward(velocity.x, 0 , FRICTION * delta)

func handle_acceletarion(input_axis, delta):
	if input_axis !=0:
		velocity.x = move_toward(velocity.x,  SPEED * input_axis , ACCELERATION * delta )

func update_animation(input_axis):
	if input_axis != 0:
		animated_sprite_2d.play("running")
	else:
		animated_sprite_2d.play("idle")
	if not is_on_floor():
		animated_sprite_2d.play("jump")

func _on_hazard_detector_area_entered(area):
	#get_tree().paused = true
	pass

func drop():
	position.y += 1
	print("trying to drop")
