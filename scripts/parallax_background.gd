extends ParallaxBackground

@export var speed := 150.0

func _process(delta):
	scroll_base_offset.x -= speed * delta
