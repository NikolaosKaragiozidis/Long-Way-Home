extends CanvasLayer

var is_menu_open = false

func _ready():
	# Allow this node to process input even when the game is paused
	process_mode = Node.PROCESS_MODE_ALWAYS
	# Initially hide the menu
	is_menu_open = true

#func _input(event):
	#get_viewport().set_input_as_handled()

func show_menu():
	$Overlay.visible = true
	$MenuPanel.visible = true
	is_menu_open = true
	# Pause the game when menu is open
	get_tree().paused = true

func hide_menu():
	$Overlay.visible = false
	$MenuPanel.visible = false
	is_menu_open = false
	# Unpause the game when menu is closed
	get_tree().paused = false

# Button signal handlers
func _on_resume_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_options_pressed():
	print("Options button pressed - you can implement options here!")

func _on_credits_pressed():
	print("Credits button pressed - you can implement credits here!")

func _on_quit_pressed():
	# Quit the game
	get_tree().quit()
