extends CharacterBody2D

@export var speed := 1000 

func _process(delta):
	position.x -= speed * delta
