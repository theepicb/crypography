extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() :
	print(OS.get_system_dir(0))
	var path = OS.get_system_dir(0);
	create_file()
	pass # Replace with function body.

func create_file () :
	var file = FileAccess.open((OS.get_system_dir(0) + "/test"), FileAccess.WRITE)
	file.store_line("test")
	return file
	pass
