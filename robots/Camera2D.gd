extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var anim = get_node("AnimationPlayer")
var auto_move = true
var pos = Vector2(0,0)
var speed = 10
var anima = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	if Input.is_action_pressed("cam-down"):
		pos.y += speed
		auto_move = false
	if Input.is_action_pressed("cam-up"):
		pos.y -= speed
		auto_move = false
	if Input.is_action_pressed("cam-left"):
		pos.x -= speed
		auto_move = false
	if Input.is_action_pressed("cam-right"):
		pos.x += speed
		auto_move = false
	
	
	if auto_move:
		smoothing_enabled = true
		position = Vector2(0,0)
		pos = global_position
	else:
		if not anima:
			anima = true
			anim.play("movecam")
		smoothing_enabled = false
		global_position = pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_camerareset_pressed():
	anima = false
	anim.play_backwards("movecam")
	auto_move = true
