extends LineEdit
var challenge1 = false
var challenge2 = false
var challenge3 = false
var challenge4 = false

func _ready () :
	print(DisplayServer.screen_get_size())
	$".".position = Vector2(get_viewport_rect().size.x / 2 - 300, get_viewport_rect().size.y / 2)
	size.x = 600
	pass

# Called when the node enters the scene tree for the first time.
func _input(ev):
	if Input.is_key_pressed(KEY_ENTER) :
		text = text.to_lower()
		checkText($".".text)
		print($".".text)
		$".".clear()
		pass
	pass
	
func _process(delta):
	if $"../Button".step == 2:
		if is_filename_in_file("key", OS.get_system_dir(0) + "/kryptos/prison") :
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
	
func checkText(text):
	#in txt file
	if text == "red herring":
		if challenge1 == false:
			challenge1 = true
			var cert1 = Label.new()
			cert1.text = "challenge 1: red herring"
			cert1.add_theme_color_override("font_color", "green")
			cert1.position.x = -30
			cert1.position.y = get_viewport_rect().size.y / 2 - 150
			add_child(cert1)
			print("made")
			pass
		pass
	if text == "he chose you":
		if challenge2 == false:
			challenge2 = true
			var cert2 = Label.new()
			cert2.text = "challenge 2: many uses for a key"
			cert2.add_theme_color_override("font_color", "orange")
			cert2.position.x = -30
			cert2.position.y = get_viewport_rect().size.y / 2 - 120
			add_child(cert2)
			print("made")
			pass
		pass
		#clock puzzle
	if text == "he was seen here first":
		if challenge3 == false:
			challenge3 = true
			var cert3 = Label.new()
			cert3.text = "challenge 3: clocks"
			cert3.add_theme_color_override("font_color", "red")
			cert3.position.x = -30
			cert3.position.y = get_viewport_rect().size.y / 2 - 90
			add_child(cert3)
			print("made")
			pass
		pass
	#corrupted file
	if text == "iacchus lives":
		if challenge4 == false:
			challenge4 = true
			var cert4 = Label.new()
			cert4.text = "challenge 4: crosswords"
			cert4.add_theme_color_override("font_color", "red")
			cert4.position.x = -30
			cert4.position.y = get_viewport_rect().size.y / 2 - 60
			add_child(cert4)
			print("made")
			pass
		pass
	if $"../Button".step == 6:
		print("step worked")
		if  str(text) == "behind the painting":
			print("painting puzzle solved")
			$"../Button".step += 1
			$"../Button".createDialogueBox($"../Button".step)
		pass
	if ($"../Button".step == 10 and text == "eleusis"):
		$"../Button".step += 1
		$"../Button".createDialogueBox($"../Button".step)
		pass
	if ($"../Button".step == 16 and text == "the scholar"):
		$"../Button".step += 1
		$"../Button".createDialogueBox($"../Button".step)
		pass
	if ($"../Button".step == 17 and text == "athens"):
		$"../Button".step += 1
		$"../Button".createDialogueBox($"../Button".step)
		pass
	if ($"../Button".step == 19 and text == "yes"):
		$"../Button".step += 1
		$"../Button".createDialogueBox($"../Button".step)
	pass
