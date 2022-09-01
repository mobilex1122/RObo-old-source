extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var conf = ConfigFile.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	conf.set_value("pos","end", global_position)
	conf.save("user://data.tmp")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
