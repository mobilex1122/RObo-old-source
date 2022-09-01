extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var conf = ConfigFile.new()

var left = false
onready var leftpol = get_node("left/Polygon2D2")
var right = false
onready var rightpol = get_node("right/Polygon2D3")
signal out()

onready var pos = get_node("Position2D")

onready var endanim = get_node("end")

onready var movespeed = get_node("c/debug/move/num")
onready var rotationspeed = get_node("c/debug/rotate/num")
onready var leftsensor = get_node("c/debug/left/num")
onready var rightsensor = get_node("c/debug/right/num")

onready var finishtime = get_node("c/Panel/Label2")
onready var timelabel = get_node("c/Label")
# Called when the node enters the scene tree for the first time.

func sensordata(sensor, state):
	var file = File.new()
	file.open("usr://"+ sensor + ".sensor", File.WRITE)
	file.store_string(String(state))
	file.close()

func readdata(data):
	var file = File.new()
	file.open("usr://"+ data +".command", File.READ)
	var content = file.get_as_text()
	file.close()
	return content

func calcDist(pos1,pos2):
	var x1 = pos1.x * pos1.x
	var x2 = pos2.x * pos2.x
	
	var y1 = pos1.y * pos1.y
	var y2 = pos2.y * pos2.y
	
	var xcalc = (x1 - x2) * (x1 - x2)
	var ycalc = (y1 - y2) * (y1 - y2)
	return sqrt(xcalc + ycalc)


onready var progress = get_node("c/ProgressBar")

var startpos
var endpos

var startdistance


func _ready():
	conf.load("user://data.tmp")
	
	startpos = global_position
	endpos = conf.get_value("pos","end") - startpos
	
	startdistance = calcDist(Vector2(0,0),endpos)

func _process(delta):
	move_and_collide(Vector2(0, -int(readdata("move"))).rotated(rotation))
	movespeed.text = readdata("move")
	
	rotate(float(readdata("rotate")))
	rotationspeed.text = readdata("rotate")
	
	
	var gpos = calcDist(global_position - startpos, endpos)
	
	var distpercent = (gpos/startdistance)*1000
	
	var progress_a = -(distpercent - 1000)
	
	progress.value += (progress_a - progress.value)/20
	
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_left_area_entered(area):
	sensordata("left", true)
	leftsensor.text = "True"
	
func _on_left_area_exited(area):
	sensordata("left", false)
	leftsensor.text = "False"


func _on_right_area_entered(area):
	sensordata("right", true)
	rightsensor.text = "True"

func _on_right_area_exited(area):
	sensordata("right", false)
	rightsensor.text = "False"





func _on_out_area_entered(area):
	print("out of bounds! (reset)")
	emit_signal("out")


#debug menu

onready var debu = get_node("c/debug")
var debugshow = false

func _on_debug2_pressed():
	if not debugshow:
		debu.show()
		debugshow = true
	else:
		debugshow = false
		debu.hide()


func _on_Area2D_area_entered(area):
	finishtime.text = timelabel.text
	endanim.play("finish")


func _on_menu_pressed():
	pass # Replace with function body.
