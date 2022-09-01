extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var time := 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta: float) -> void:
	time += delta

	
	var minutes = time / 60
	var hours = minutes/60
	var seconds = fmod(time, 60)
	
	text =  "%02d:%02d:%02d" % [hours, minutes, seconds]
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
