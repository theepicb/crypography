extends LineEdit


func _ready () :
	print(DisplayServer.screen_get_size())
	$".".position = Vector2(get_viewport_rect().size.x / 2 - 300, get_viewport_rect().size.y / 2)
	size.x = 600
	pass

# Called when the node enters the scene tree for the first time.
func _input(ev):
	if Input.is_key_pressed(KEY_ENTER) :
		print($".".text)
		$".".clear()
		pass
	pass
	
func _process(delta):
	if $"../Node2D".step == 0:
		if is_filename_in_file("key.txt", ) :
			
			pass
		pass
	
	pass

func is_filename_in_file(target_filename: String, file_path: String) -> bool:
	if not FileAccess.file_exists(file_path):
		return false
	
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		while not file.eof_reached():
			var line = file.get_line()
			if line == target_filename:
				file.close()
				return true
		file.close()
	return false
	pass
