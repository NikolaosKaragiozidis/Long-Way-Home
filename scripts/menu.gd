extends CanvasLayer

# Track menu state
var is_menu_open = false

func _ready():
	# Allow this node to process input even when the game is paused
	process_mode = Node.PROCESS_MODE_ALWAYS
	# Initially hide the menu
	hide_menu()

func _input(event):
	# Toggle menu when ESC is pressed
	if event.is_action_pressed("ui_cancel"):
		toggle_menu()
		# Accept the event so it doesn't propagate
		get_viewport().set_input_as_handled()

func toggle_menu():
	if is_menu_open:
		hide_menu()
	else:
		show_menu()

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
	hide_menu()

func _on_options_pressed():
	print("Options button pressed - you can implement options here!")

func _on_credits_pressed():
	print("Credits button pressed - you can implement credits here!")

func _on_quit_pressed():
	# Quit the game
	get_tree().quit()
