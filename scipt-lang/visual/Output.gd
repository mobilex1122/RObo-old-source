extends GraphNode


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var input = [0,0]
export var type = "output"
# Called when the node enters the scene tree for the first time.

func senddata(command, state):
	var file = File.new()
	for i in range(0, command.size()):
		file.open("usr://"+ command[i] + ".command", File.WRITE)
		file.store_string(String(state[i]))
		file.close()
		print(state)


var active = 0
func _ready():
	pass

func load(filename):
	pass

func _process(delta):
	senddata(["move","rotate"],input)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


