extends RichTextLabel

signal finished_showing

var current_age = 0

var visible_ratio_tween : Tween = create_tween()

func _ready():
	create_tween().tween_property(self,"self_modulate:a",1,0.5).set_trans(Tween.TRANS_CUBIC)
	visible_ratio_tween.tween_property(self,"visible_ratio",1,0.025*text.length())
	await get_tree().create_timer(0.025*text.length()).timeout
	finished_showing.emit()

func show_all_text():
	visible_ratio_tween.stop()
	visible_ratio = 1
	finished_showing.emit()

func age():
	if current_age != 1:
		lower()
	else: 
		fade_out()

func lower():
	current_age += 1
	create_tween().tween_property(self,"position",Vector2(0.0,820.0),0.5).set_trans(Tween.TRANS_CUBIC)
	create_tween().tween_property(self,"theme_override_font_sizes/normal_font_size",24,0.5).set_trans(Tween.TRANS_CUBIC)
	create_tween().tween_property(self,"theme_override_colors/default_color",Color("b7b7b7"),0.5).set_trans(Tween.TRANS_CUBIC)
	
func fade_out():
	create_tween().tween_property(self,"self_modulate:a",0,0.5).set_trans(Tween.TRANS_CUBIC)
	create_tween().tween_property(self,"position",Vector2(0.0,1000.0),0.5).set_trans(Tween.TRANS_CUBIC)
	
