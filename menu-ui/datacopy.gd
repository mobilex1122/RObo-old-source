extends WindowDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func list_files_in_directory(path):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file)

	dir.list_dir_end()

	return files

onready var progress = get_node("ProgressBar")

func copyfiles(path):
	var list = list_files_in_directory(path)
	var dir = Directory.new();
	print(list)
	if not list == ["animation.data", "left.sensor", "move.command", "right.sensor", "rotate.command"]:
		for i in range(0,list.size()):
			dir.copy(String(path) + String(list[i]),"user://" + String(list[i]));
	hide()

# Called when the node enters the scene tree for the first time.
func _ready():
	popup_centered()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	
	copyfiles("res://copy-files/")
