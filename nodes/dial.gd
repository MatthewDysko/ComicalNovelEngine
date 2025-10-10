extends RichTextLabel
class_name DialText

var tween : Tween
var og_pos_y : float

func _ready():
	og_pos_y = position.y

func show_text(dialStep : DialStep):
	create_tween().tween_property(self,"position:y",og_pos_y+50,0.25).set_trans(Tween.TRANS_CUBIC)
	create_tween().tween_property(self,"modulate:a",0,0.25).set_trans(Tween.TRANS_CUBIC)
	await get_tree().create_timer(0.25).timeout
	text = dialStep.dial
	create_tween().tween_property(self,"position:y",og_pos_y,0.25).set_trans(Tween.TRANS_CUBIC)
	create_tween().tween_property(self,"modulate:a",1,0.25).set_trans(Tween.TRANS_CUBIC)
	
