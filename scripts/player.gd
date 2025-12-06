extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D

@onready var hearts = $"../CanvasLayer/UI/HBoxContainer"
@onready var noob = $"../CanvasLayer/UI/noob"

@export var gravity: int = 400
@export var jumpHeight: int = 250

func _physics_process(delta: float):
	if is_on_floor() == false:
		velocity.y += gravity * delta
	
	if is_on_floor() == true:
		if Input.is_action_just_pressed("jump"):
			velocity.y = -jumpHeight
	
	move_and_slide()


var counter = 0

func _on_area_2d_area_entered(area) -> void:
	var heartsArr = hearts.get_children()
	counter += 1
		
	if heartsArr.size() > 0 and counter <= 3:
		heartsArr[counter -1].visible = false
		
	if counter == 3:
		$CollisionShape2D.get_parent().collision_mask = 1 << 2
		noob.visible = true
		await get_tree().create_timer(3).timeout
		
		get_tree().reload_current_scene()
