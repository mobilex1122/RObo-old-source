extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var config = ConfigFile.new()
onready var anim = get_node("AnimationPlayer")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var menushow = false
var exitshow = false
func _on_menu_pressed():
	if not menushow:
		anim.play("show")
		menushow = true
	else:
		anim.play_backwards("show")
			
		
		menushow = false


func _on_exit_pressed():
	exitshow = true
	anim.play("exit")


func _on_exit2_pressed():
	get_tree().quit()


func _on_menu2_pressed():
	config.set_value("status","scnid","res://menu-ui/menu.tscn")
	config.set_value("status","loading",1)
	
	config.save("user://animation.data")


func _on_menufin_pressed():
	config.set_value("status","scnid","res://menu-ui/menu.tscn")
	config.set_value("status","loading",1)
	
	config.save("user://animation.data")
