class_name SprintingPlayerState extends PlayerMovementState

@export var SPEED: float = 7.0
@export var ACCELERATION : float = 0.1
@export var DECELERATION : float = 0.25
@export var TOP_ANIMATION_SPEED : float = 1.6

func  enter() -> void:
	ANIMATION.play("Sprinting", 0.5, 1.0)

func  update(delta):
	PLAYER.update_gravity(delta)
	PLAYER.update_input(SPEED, ACCELERATION, DECELERATION)
	PLAYER.update_velocity()
	
	set_animation_speed(PLAYER.velocity.length())
	
	if Input.is_action_just_released("sprint"):
		transition.emit("WalkingPlayerState")
	
	if Input.is_action_just_pressed("jump") and PLAYER.is_on_floor():
		transition.emit("JumpingPlayerState")

func set_animation_speed(speed):
	var alpha = remap(speed, 0.0, SPEED, 0.0, 1.0)
	ANIMATION.speed_scale = lerp(0.0, TOP_ANIMATION_SPEED, alpha)

