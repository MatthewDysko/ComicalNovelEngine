extends Node
class_name DialChoiceStep

var choices : Array[DialChoiceOption] = []

func _init(Choices : Dictionary):
	for choice in Choices["choices"]:
		choices.append(DialChoiceOption.new(choice))
	
