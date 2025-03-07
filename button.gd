extends Button
var step: int;
var continuable

var stops = [2, 6, 10,16,17,19, 20]

var dialogue = {
	0: "you wake up in a dark room (click to continue) ►",
	1: "attached to your leg is a shackle with no key in sight ►",
	2: "perhaps someone on the other side can help",
	3: "in front of you a rusted key appears ►",
	4: "you use the key to release you from the shackle ►",
	5: "investigating your surroundings you find a strand painting on the wall ►",
	6: "you search more around the room but find no escape",
	7: "behind the painting you find a tunnel leading to a strange room ►",
	8: "lab equipment dots the room it seems this was some kind of observitory ►",
	9: "the only exit is a locked door with some kind of automatic opening mechanism ►",
	10: "written on a nearby chalkboard the words \"a battle decided by a god\"",
	11: "you speak the phrase Eleusis and the door opens, hydrolics screaming ►",
	12: "you walk through the open door and a hooded figure stands before you ►",
	13: "he looks to you with a warm smile and says ►",
	14: "\"congratulations on making it this far truely he has blessed you\"►",
	15: "\"now i hope you dont mind i have some questions for you\"►",
	16: "\"firstly what do people call me?\"",
	17: "\"very good, now where did he die?\"",
	18: "\"excellent, now one last question\"►",
	19: "are you read to ascend?",
	20: "https://discord.gg/NFDMaJVbVN"
	
}

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


func _pressed() :
	print(step)
	
	if !stops.has(int(step)):
		step = step + 1
		$"../Node2D".step += 1
		createDialogueBox(step)
		createSpecial()
		pass

func createDialogueBox (Dnumber) :
	text = dialogue[int(step)]
	position.x = get_viewport_rect().size.x / 2 - size.x / 2
	position.y = get_viewport_rect().size.y / 2 + 80
	print(position)
	visible = true
	pass

func createSpecial() :
	if int(step) == 2: 
		print("fired")
		var file = FileAccess.open(OS.get_system_dir(0) + "/kryptos/key",FileAccess.WRITE)
		file.store_string("KRYPTOS")
		var directory = DirAccess
		directory.make_dir_absolute((OS.get_system_dir(0) + "/kryptos/prison"))
		pass
	if int(step) == 5:
		$"../Node2D".move_file_to_desktop("res://A_strange_painting.jpg", (OS.get_system_dir(0) + "/kryptos/A_strange_painting.jpg"))
		pass
	if int(step == 8):
		var directory = DirAccess
		directory.make_dir_absolute((OS.get_system_dir(0) + "/kryptos/observitory"))
		var book = FileAccess.open(OS.get_system_dir(0) + "/kryptos/observitory/large_book",FileAccess.WRITE)
		book.store_string("atop a desk is a book on Greek history, opening it you find a bookmarked page about the battle of Salamis")
		var telescope = FileAccess.open(OS.get_system_dir(0) + "/kryptos/observitory/telescope",FileAccess.WRITE)
		telescope.store_string("you see the telescope is currently angled at 38.043544, 23.541887. It doesnt seem to be pointing at anything in particular")
		$"../Node2D".move_file_to_desktop("res://clocks.png", (OS.get_system_dir(0) + "/kryptos/observitory/home_work.png"))
		$"../Node2D".move_file_to_desktop("res://word-search.png", (OS.get_system_dir(0) + "/kryptos/observitory/word_search.png"))
		pass
	if (step == 17):
		$"../Node2D".move_file_to_desktop("res://A_familliar_painting.jpg", (OS.get_system_dir(0) + "/kryptos/A_strange_painting.jpg"))
		pass
	pass
	
	
