extends CharacterBody2D

@onready var timer: Timer = $Timer

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D

@onready var hearts = $"../CanvasLayer/UI/HBoxContainer"

@onready var scoreContainer = $"../CanvasLayer/UI/HBoxContainer2"
@onready var score = $"../CanvasLayer/UI/HBoxContainer2/ScoreCounter"

@export var gravity: int = 400
@export var jumpHeight: int = 250

func _physics_process(delta: float):
	if is_on_floor() == false:
		velocity.y += gravity * delta
	
	if is_on_floor() == true:
		if Input.is_action_just_pressed("jump"):
			velocity.y = -jumpHeight
	
	move_and_slide()


func _on_area_2d_area_entered(area) -> void:
	var heartsArr = hearts.get_children()
	Global.lifeCounter += 1
				
	if heartsArr.size() > 0 and Global.lifeCounter <= 3:
		heartsArr[Global.lifeCounter -1].visible = false
		flicker_when_damaged()
		
	if Global.lifeCounter == 3:
		$CollisionShape2D.get_parent().collision_mask = 1 << 2
		
		# CENTER SCORE CONTAINER AFTER GAME ENDS
		scoreContainer.grow_horizontal = Control.GROW_DIRECTION_BOTH
		scoreContainer.grow_vertical = Control.GROW_DIRECTION_BOTH
		scoreContainer.set_anchors_preset(Control.PRESET_CENTER)
		
		scoreContainer.offset_left = 0
		scoreContainer.offset_top = 0
		scoreContainer.offset_right = 0
		scoreContainer.offset_bottom = 0
		
		#for child in scoreContainer.get_children():
			#if child is Label:
		score.add_theme_font_size_override("font_size", 70)
	
		##########################################
		
		# DELAY 3S BEFORE RELOADING SCENE
		await get_tree().create_timer(3).timeout
		
		Global.lifeCounter = 0
		get_tree().reload_current_scene()
		

func flicker_when_damaged():
	for i in range(4):
		modulate.a = 0.5
		await get_tree().create_timer(0.1).timeout
		
		modulate.a = 1
		await get_tree().create_timer(0.1).timeout
