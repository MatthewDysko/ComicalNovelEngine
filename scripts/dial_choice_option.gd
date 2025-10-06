extends Node
class_name DialChoiceOption

var option : String 
var result : String 

func _init(choice : Dictionary):
	option = choice["option"]
	result = choice["result"]
