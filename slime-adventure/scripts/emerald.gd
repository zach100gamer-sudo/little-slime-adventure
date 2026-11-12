# == equal to.
# != not equal to.
# >= greater than equal to.
# <= less than equal to.
# < less than
# > greater than.

# var first.
# var name second. in snake_case, exception if constant, all CAPS.
# : third if declaring type.
# fourth IS type always spelt in PascalCase, with exception to int, float, bool, null.


extends CharacterBody2D

var max_jump_count : int = 1
var jump_count : int = 0

@export var animator : AnimationPlayer
@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0

func _ready() -> void:
	animator.play("idle")
	check_upgrades()

func _physics_process(delta: float) -> void:
	# handle the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		if animator.current_animation != "fall" and velocity.y >= 0:
			animator.play("fall")
		elif velocity.y < 0:
			animator.play("jump")
	else:
		jump_count = 0

	# Handle jump.
	if Input.is_action_just_pressed("jump") and jump_count < max_jump_count:
		jump_count += 1
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("walkleft", "walkright")
	if direction:
		velocity.x = direction * SPEED
		
		if animator.current_animation != "rev up" and is_on_floor() and animator.current_animation != "walk":
			animator.play("rev up")
		
		if direction < 0:
			$EmeraldSheet.flip_h = true
		elif direction > 0:
			$EmeraldSheet.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fall" and is_on_floor():
		animator.play("splat")
	elif anim_name == "fall" and not is_on_floor():
		animator.play("fall")
	elif anim_name == "splat":
		animator.play("idle")
	elif anim_name == "walk" and (velocity.x >= 0.15 or velocity.x <= -0.15) and is_on_floor():
		animator.play("walk")
	elif anim_name == "rev up" and is_on_floor():
		animator.play("walk")
	else:
		animator.play("idle")
	
func check_upgrades():
	if GameData.skills["double jump"]:
		max_jump_count = 2
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
