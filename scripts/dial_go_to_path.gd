extends DialStep
class_name DialGoToPath

var path_id : String = ""

func _init(dialStep : Dictionary):
	path_id = dialStep["go_to"]
	pass
