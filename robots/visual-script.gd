extends WindowDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_showvs_pressed():
	show()
	rect_position = (OS.window_size / 2) - (rect_size /2)


func _on_visualscript_focus_entered():
	show_on_top = true


func _on_visualscript_focus_exited():
	show_on_top = false
