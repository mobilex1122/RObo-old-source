extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var config = ConfigFile.new()

var number = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	rect_position.y -= (rect_position.y + (OS.window_size.y * number))/10

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	number = 1


func _on_Button2_pressed():
	number = 2

func _on_Button3_pressed():
	get_tree().quit()


func _on_TextureButton_pressed():
	number = 0


func _on_ItemList_item_activated(index):
	config.set_value("status","scnid","res://maps/"+ String(index)+".tscn")
	config.set_value("status","loading",1)
	
	config.save("user://animation.data")
