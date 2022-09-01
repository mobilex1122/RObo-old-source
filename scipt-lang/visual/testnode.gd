extends GraphNode


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var output = false
export var type = "input"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func load(filename):
	var file = File.new()
	file.open("usr://"+ String(filename), File.READ)
	var content = file.get_as_text()
	file.close()
	return content

var fileread = "none"
func _process(delta):
	var text = "n"
	if not fileread == "none":
		var file = File.new()
		file.open("usr://"+ String(fileread), File.READ)
		var content = file.get_as_text()
		file.close()
		text = String(content)

		print("error")
		
		
	if text == "True":
		output = true
	if text == "False":
		output = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LineEdit_text_entered(new_text):
	pass


func _on_OptionButton_item_selected(index):
	fileread = get_node("OptionButton").get_item_text(index)
