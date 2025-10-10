extends PanelContainer
class_name Option

var option_id : int
var option_text : String = ""
var result_dialogue : String = ""

func _ready():
	modulate.a = 0;
	create_tween().tween_property(self,"modulate:a",1,0.25).set_trans(Tween.TRANS_CUBIC)
	
	$MRG/Option.text = option_text

func highlight():
	create_tween().tween_property(self,"position:x",-75,0.25).set_trans(Tween.TRANS_CUBIC)

func de_highlight():
	create_tween().tween_property(self,"position:x",0,0.25).set_trans(Tween.TRANS_CUBIC)

func _on_mouse_entered():
	highlight()
	pass # Replace with function body.

func _on_mouse_exited():
	de_highlight()
	pass # Replace with function body.

func _on_button_pressed():
	get_parent().get_parent().option_confirmed.emit(self)
	pass # Replace with function body.
