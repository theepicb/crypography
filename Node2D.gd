extends Node2D

var step = 0
var dialogue = 0

# Called when the node enters the scene tree for the first time.
func _ready() :
	
	print(OS.get_system_dir(0))
	var path = OS.get_system_dir(0);
	var dataLoad = load_data()
	step = dataLoad["step"]
	print("data loaded! \n" + str(dataLoad) + "\n")
	if step == 0:
		create_file()
		move_file_to_desktop("res://ReadMe.txt", (OS.get_system_dir(0) + "/kryptos/ReadMe.txt"))
		pass
	$"../Button".step = step
	$"../Button".createDialogueBox(step)
	#move_file_to_desktop("res://A_strange_painting.jpg", (OS.get_system_dir(0) + "/kryptos/A_stange_paining.jpg"))
	
	save_data()
	
	pass 

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
	}
	var file = FileAccess.open("user://savegamekryptos.json", FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(data));
		file.close()

func load_data():
	var file = FileAccess.open("user://savegamekryptos.json", FileAccess.READ)
	if file:
		var content = file.get_as_text()
		var data = JSON.parse_string(content)
		file.close()
		print(data)
		return data
	else:
		save_data()
		load_data()
		pass
		
