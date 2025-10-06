extends Button
class_name ChoiceButton

var parent_window : DialChoiceWindow

var choice : DialChoiceOption
var fade_in_delay = 0

func _ready():
	parent_window = get_parent().get_parent()
	text = choice.option
	modulate.a = 0
	await get_tree().create_timer(fade_in_delay*0.25).timeout
	create_tween().tween_property(self,"modulate:a",1,1).set_trans(Tween.TRANS_CUBIC)

func _on_pressed():
	parent_window.choice_made.emit(choice.result)
	pass # Replace with function body.
