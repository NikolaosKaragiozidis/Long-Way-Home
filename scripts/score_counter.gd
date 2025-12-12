extends Label

var time_passed = 0.0
var time_to_wait = 0.3

func _process(delta: float) -> void:
	time_passed += delta
	
	if time_passed >= time_to_wait:
		Global.score += 10
		self.text = str(Global.score)
		time_passed = 0.0
	
	if Global.lifeCounter == 3:
		set_process(false)
		Global.score = 0
