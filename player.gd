extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -300
var health = 100
var health_max = 100
var health_min = 0

@onready var animated_sprite = $AnimatedSprite2D

@export var sfx_jump: AudioStream
@export var sfx_footsteps: AudioStream

var footstep_frames: Array = [1,5]

func _ready() -> void:
	if Global.player_position != Vector2.ZERO:
		@warning_ignore("shadowed_variable")
		var player = get_tree().get_first_node_in_group("player")
		if player:
			player.global_position = Global.player_position

func _procces():
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		load_sfx(sfx_jump)
		%sfx_player.play()
		velocity.y = JUMP_VELOCITY

	#get input direction
	var direction := Input.get_axis("move_left", "move_right")
	
	#flip sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0 :
		animated_sprite.flip_h = true
	
	#play animations
	if is_on_floor():
		if direction == 0 :
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")

	#Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func player():
	pass

func take_damage(amount: int) -> void:
	health -= amount
	health = clamp( health, 0, health_max)
	

func restore_damage(amount: int) -> void:
	health += amount
	health = clamp( health, 0, health_max)

func load_sfx(sfx_to_load):
	if %sfx_player.stream != sfx_to_load:
		%sfx_player.stop()
		%sfx_player.stream = sfx_to_load
	
func _on_animated_sprite_2d_frame_changed() -> void:
	if %AnimatedSprite2D.animation == "idle":return
	if %AnimatedSprite2D.animation == "jump":return
	load_sfx(sfx_footsteps)
	if %AnimatedSprite2D.frame in footstep_frames: %sfx_player.play()
