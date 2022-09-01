extends PopupMenu


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	add_submenu_item("Add","nodeadd",0)
	add_item("Save",1)
	add_item("Load",2)

func _input(event):
	if Input.is_action_just_pressed("minimenu"):
		rect_global_position = get_global_mouse_position()
		popup()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_menu_pressed():
	rect_global_position = get_global_mouse_position()
	popup()
