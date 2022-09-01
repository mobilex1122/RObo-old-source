extends GraphNode


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var input = [true]
export var output = 0
var trueval = 0
var falseval = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if input[0] == true:
		output = trueval
	if input[0] == false:
		output = falseval
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_true_value_changed(value):
	trueval = value


func _on_false_value_changed(value):
	falseval = value
