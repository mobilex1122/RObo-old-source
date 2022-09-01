extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var playlists = {
	"peace": 11,
	"electro": 6
}
export var playlist = "intro"
var nowplayng = 1


var config = ConfigFile.new()
# Called when the node enters the scene tree for the first time.

func playnow(playlistname,song):
	playlist = playlistname
	stop()
	if not playlist == "none":
		nowplayng = song
		
	
		stream = load("res://assets/music/"+ playlist +"/"+ String(nowplayng) + ".wav")
		play()


func _ready():
	config.load("res://settings.conf")
	playlist = config.get_value("audio","playlist","peace")
	if not playlist == "intro":
		stream = load("res://assets/music/"+ playlist +"/"+ String(nowplayng) + ".wav")
		play()
	pass # Replace with function body.
func _process(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_music_finished():
	if not playlist == "intro" and not playlist == "none":
		nowplayng += 1
		if nowplayng == playlists[playlist] + 1:
			nowplayng = 1
		stream = load("res://assets/music/peace/"+ String(nowplayng) + ".wav")
		play()
