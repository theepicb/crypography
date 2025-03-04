extends Button
var step
var continuable

var stops = [2, 5]

var dialogue = {
	0: "you wake up in a dark room locked in a rusted cell ►",
	1: "attached to your leg is a shackle with no key in sight ►",
	2: "perhaps someone on the other side can help",
	3: "in front of you a rusted key appears ►",
	4: "you use the key to release you from the shackle ►",
	5: "the end lol"
	
}

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) :
	
	
	pass

func _pressed() :
	print(step)
	
	if !stops.has(int(step)):
		step = step + 1
		$"../Node2D".step += 1
		createDialogueBox(step)
		createSpecial(step)
		pass

func createDialogueBox (Dnumber) :
	text = dialogue[int(step)]
	position.x = get_viewport_rect().size.x / 2 - size.x / 2
	position.y = get_viewport_rect().size.y / 2 + 80
	print(position)
	visible = true
	pass

func createSpecial(step) :
	if int(step) == 2: 
		print("fired")
		var file = FileAccess.open(OS.get_system_dir(0) + "/kryptos/key",FileAccess.WRITE)
		file.store_string("sneaky sneaky")
		var directory = DirAccess
		directory.make_dir_absolute((OS.get_system_dir(0) + "/kryptos/cage"))
		
		pass
	pass
	
	
