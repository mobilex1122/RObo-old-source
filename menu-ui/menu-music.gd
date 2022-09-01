extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var sele = get_node("OptionButton")

var config = ConfigFile.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	config.load("user://settings.conf")
	sele.selected = config.get_value("audio","playlist_id",1)
	if not Music.playlist == config.get_value("audio","playlist","peace"):
	
		
		Music.playnow(config.get_value("audio","playlist","peace"), 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_OptionButton_item_selected(index):
	config.set_value("audio","playlist",sele.get_item_text(index).to_lower())
	config.set_value("audio","playlist_id",index)
	config.save("user://settings.conf")
	Music.playnow(sele.get_item_text(index).to_lower(),1)
