extends MarginContainer
class_name ContactButton

var contactData : Dictionary

func _ready():
	$Button/Name.text = "[b]" + contactData["short"]
	var path = "res://assets/sprites/pfps/"+contactData["sprite"]+".png"
	if FileAccess.file_exists(path):
		$Button/TextureRect.texture = load(path)
	else:
		$Button/TextureRect.texture = load("res://assets/sprites/pfps/not_found.png")
