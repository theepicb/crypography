extends Node2D

var step = 0
var dialogue = 1
# Called when the node enters the scene tree for the first time.
func _ready() :
	
	# Now, we can call our save function on each node.
	print(OS.get_system_dir(0))
	var path = OS.get_system_dir(0);
	if step == 0:
		create_file()
		move_file_to_desktop("res://ReadMe.txt", (OS.get_system_dir(0) + "/kryptos/ReadMe.txt"))
		pass
	#move_file_to_desktop("res://A_strange_painting.jpg", (OS.get_system_dir(0) + "/kryptos/saturn.jpg"))
	
	save_data()
	
	pass # Replace with function body.

func create_file () :
	var directory = DirAccess
	directory.make_dir_absolute((OS.get_system_dir(0) + "/kryptos"))
	pass
	
func move_file_to_desktop(source: String, destination: String) -> bool:
	var file = FileAccess.open(source, FileAccess.ModeFlags.READ)
	var file_data = file.get_buffer(file.get_length())
	file.close()
	var new_file = FileAccess.open(destination, FileAccess.ModeFlags.WRITE)
	new_file.store_buffer(file_data)
	new_file.close()
	
	return true
	pass


func save_data():
	var data = {
		"step": step,
		"diologue": dialogue,
		"score": 0
	}
	var file = FileAccess.open("user://savegame.json", FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(data));
		file.close()

func load_data():
	var file = FileAccess.open("user://savegame.json", FileAccess.READ)
	if file:
		var content = file.get_as_text()
		var data = JSON.parse_string(content)
		file.close()
		print(data)
		return data
