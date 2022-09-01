extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var popup = get_node("PopupMenu")
# Called when the node enters the scene tree for the first time.
func _ready():
	Parts.hide()


	
	


	
	
func _input(event):
	if Input.is_action_just_pressed("delete"):
		pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_testnode_pressed():
	popup.hide()
	get_node("Graph").add_part("test")


func _on_outputnode_pressed():
	pass


func _on_Graph_connection_request(from, from_slot, to, to_slot):
	for con in get_node("Graph").get_connection_list():
		if con.to == to and con.to_port == to_slot:
			return
	get_node("Graph").connect_node(from, from_slot, to, to_slot)

func _on_Graph_disconnection_request(from, from_slot, to, to_slot):
	get_node("Graph").disconnect_node(from, from_slot, to, to_slot)


var selected_nodes = {}

func _on_Graph_node_selected(node):
	selected_nodes[node] = true

func _on_Graph_node_unselected(node):
	selected_nodes[node] = false


func remove_connections_to_node(node):
	for con in get_node("Graph").get_connection_list():
		if con.to == node.name or con.from == node.name:
			get_node("Graph").disconnect_node(con.from, con.from_port, con.to, con.to_port)

func _on_Graph_delete_nodes_request():
	for node in selected_nodes.keys():
		if selected_nodes[node] and not "Output" in String(selected_nodes.keys()):
			remove_connections_to_node(node)
			node.queue_free()
	selected_nodes = {}














	



onready var nodeadd = get_node("PopupMenu/nodeadd")
func _on_nodeadd_index_pressed(index):
	
	get_node("Graph").add_part(nodeadd.get_item_text(index))
	
	





func _on_Graph_resetnodes():
	pass


func _process(delta):
	print(selected_nodes.keys())
	node_to_data()

var data = {}
var temp = {}
func node_to_data():
	var g = get_node("Graph")
	var list = g.get_connection_list()
	for i in range(0, list.size()):
		
		g.get_node(list[i].to).input[list[i].to_port] = g.get_node(list[i].from).output


func _on_PopupMenu_id_pressed(id):
	if id == 1:
		get_node("save").popup_centered()
		get_node("save").current_dir = "c:/Users"
	if id == 2:
		get_node("load").popup_centered()
		get_node("load").current_dir = "c:/Users"

