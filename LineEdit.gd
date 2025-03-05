extends LineEdit
var challange1 = false


func _ready () :
	print(DisplayServer.screen_get_size())
	$".".position = Vector2(get_viewport_rect().size.x / 2 - 300, get_viewport_rect().size.y / 2)
	size.x = 600
	pass

# Called when the node enters the scene tree for the first time.
func _input(ev):
	if Input.is_key_pressed(KEY_ENTER) :
		print($".".text)
		checkText($".".text)
		$".".clear()
		pass
	pass
	
func _process(delta):
	if $"../Button".step == 2:
		if is_filename_in_file("key", OS.get_system_dir(0) + "/kryptos/cage") :
			$"../Button".step += 1
			$"../Button".createDialogueBox($"../Button".step)
			print("key")
			pass
		pass
	
	pass

func is_filename_in_file(target_filename: String, file_path: String) -> bool:
	var dir = DirAccess.open(file_path)
	var file_to_search = file_path + "/" + target_filename
	if dir.file_exists(file_to_search):
		print("worked")
		return true
		pass
	return false
	
	pass
	
func checkText (text):
	print(text)
	if str(text) == "red herring":
		print("inputed")
		if challange1 == false:
			challange1 = true
			var cert1 = Label.new()
			cert1.text = "challange 1: red herring"
			cert1.add_theme_color_override("font_color", "green")
			cert1.anchor_left = 0
			cert1.position.x = 0
			cert1.position.y = get_viewport_rect().size.y / 2 - 80
			print(cert1.position)
			add_child(cert1)
			print("made")
		pass
	
	pass
