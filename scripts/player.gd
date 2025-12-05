extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@export var gravity: int = 400
@export var jumpHeight: int = 250

func _physics_process(delta: float):
	if is_on_floor() == false:
		velocity.y += gravity * delta
	
	if is_on_floor() == true:
		if Input.is_action_just_pressed("jump"):
			velocity.y = -jumpHeight
			print("test")
	
	move_and_slide()
	
	
