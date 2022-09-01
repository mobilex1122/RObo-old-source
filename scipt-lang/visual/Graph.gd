extends GraphEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#
	
	pass
func _input(event):
	if Input.is_action_just_pressed("save"):
		save_data("res://test.tres")
		
		
		
func save_data(file_name):
	var graph_data = GraphData.new()
	graph_data.connections = get_connection_list()
	for node in get_children():
		if node is GraphNode:
			var node_data = NodeData.new()
			node_data.name = node.name
			node_data.offset = node.offset
			graph_data.nodes.append(node_data)
	if ResourceSaver.save(file_name, graph_data) == OK:
		print("saved")
	else:
		print("fail")



func load_data(file_name):
	if ResourceLoader.exists(file_name):
		var graph_data = ResourceLoader.load(file_name)
		if graph_data is GraphData:
			clear_graph(graph_data)
			
			print("loaded")
		else:
			pass
	else:
		pass


signal resetnodes()
var cleardone = false
func init_graph(graph_data: GraphData):
	
	for node in graph_data.nodes:
		# Get new node from factory autoload (singleton)
		var gnode = Parts.get_node(node.name).duplicate()
		gnode.offset = node.offset
		gnode.name = node.name
		self.add_child(gnode,true)
	for con in graph_data.connections:
		self.connect_node(con.from, con.from_port, con.to, con.to_port)

func remove_connections_to_node(node):
	for con in get_connection_list():
		if con.to == node.name or con.from == node.name:
			disconnect_node(con.from, con.from_port, con.to, con.to_port)

func clear_graph(graph_data):
	var nodes = get_children()
	for node in nodes:
		if node is GraphNode:
			
			remove_connections_to_node(node)
			print("removed")
			remove_child(node)
	init_graph(graph_data)
	

	
var lastNodePosition =Vector2(0,0)

func _process(delta):
	pass


func add_part(name: String):
	var scene = load("res://scipt-lang/visual/" + String(name) +".tscn")
	var part = scene.instance()
	var offset =Vector2(0,0)
	offset = get_local_mouse_position() + scroll_offset
	part.rect_position = Vector2(0,0)
	part.set_offset(offset/zoom)
	lastNodePosition = part.get_offset()
	add_child(part, true) # Use a friendly node name to help with save/load later
	

	# Don't connect to input that is already connected
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PopupMenu_id_pressed(id):
	pass


func _on_load_file_selected(path):
	load_data(path)


func _on_save_file_selected(path):
	save_data(path)
