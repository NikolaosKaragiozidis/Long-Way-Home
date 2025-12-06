extends Node2D

@onready var enemyScene: PackedScene = preload("res://scenes/enemy.tscn")

func _on_timer_timeout() -> void:
	var enemy = enemyScene.instantiate()
	enemy.position = position
	get_parent().get_node("enemySpawner").add_child(enemy)
