extends LineEdit


func _ready () :
	print(DisplayServer.screen_get_size())
	$".".position = Vector2(DisplayServer.screen_get_size() / 2.4)
	pass

# Called when the node enters the scene tree for the first time.
func _input(ev):
	if Input.is_key_pressed(KEY_ENTER) :
		print($".".text)
		$".".clear()
		
		pass
	pass
