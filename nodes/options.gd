extends Control
class_name Options

signal option_confirmed(option_id)

@export var choices : Array[DialChoiceOption]
var PreloadedOption = preload("res://nodes/option.tscn")

var selected_option = 99;
var unlock_input = false

func _input(event):
	if event.is_action_pressed("Down") and unlock_input:
		selected_option += 1
		if selected_option > $HBOX.get_child_count()-1:
			selected_option = 0
		highlight_option(selected_option)
	elif event.is_action_pressed("Up") and unlock_input:
		selected_option -= 1
		if selected_option < 0:
			selected_option = $HBOX.get_child_count()-1
		highlight_option(selected_option)
	elif event.is_action_pressed("NextStep") and unlock_input:
		if selected_option == 99:
			selected_option = 0
			highlight_option(selected_option)
			return
		confirm_option($HBOX.get_child(selected_option))

func _ready():
	
	option_confirmed.connect(confirm_option)
	
	var option_id = 0
	for choice : DialChoiceOption in choices:
		var option : Option = PreloadedOption.instantiate()
		option.option_id = option_id
		option.option_text = choice.option
		option.result_dialogue = choice.result
		$HBOX.add_child(option)
		option_id += 1
	unlock_input = true
		
func confirm_option(_confirmed_option : Option):
	var dialWindow : DialWindow = get_parent()
	dialWindow.change_dialogue_path(_confirmed_option.result_dialogue)
	dialWindow.is_selecting_option = false
	queue_free()
	
func highlight_option(_selected_option):
	for option : Option in $HBOX.get_children():
		if option.option_id == _selected_option:
			option.highlight()
		else:
			option.de_highlight()
