extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var config = ConfigFile.new()
onready var anim = get_node("AnimationPlayer")
var isplayng = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _process(delta):
	config.load("user://animation.data")
	var state = config.get_value("status","loading",0)
	if state == 1:
		config.set_value("status","loading",0)
		anim.play("close")
	if state == 2 and not isplayng:
		isplayng = true
		anim.play("open")
	
	config.save("user://animation.data")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	isplayng = false
	config.load("user://animation.data")
	var level = config.get_value("status","scnid","res://menu-ui/menu.tscn")
	if anim_name == "close":
		config.set_value("status","loading",2)
		config.save("user://animation.data")
		get_tree().change_scene(level)
	if anim_name == "open":
		config.set_value("status","loading",0)
		config.save("user://animation.data")

