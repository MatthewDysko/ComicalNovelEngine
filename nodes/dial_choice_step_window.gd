extends Control
class_name DialChoiceWindow

@warning_ignore("unused_signal")
signal choice_made(next_dial : String)

var PreloadedChoiceButton = preload("res://nodes/choice_button.tscn")

var choices : Array[DialChoiceOption] = []

func _ready():
	var x = 0
	for choice : DialChoiceOption in choices:
		var choice_button : ChoiceButton = PreloadedChoiceButton.instantiate()
		choice_button.choice = choice
		choice_button.fade_in_delay = x
		$Vbox.add_child(choice_button)
		x += 1
