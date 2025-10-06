extends RichTextLabel

@export var menu_id = 0

func highlight():
	set("theme_override_colors/default_color",Color("White"))
	set("theme_override_colors/font_outline_color",Color("Black"))
	set("theme_override_constants/outline_size",60)

func stop_highlight():
	set("theme_override_colors/default_color",Color("Black"))
	set("theme_override_colors/font_outline_color",Color("White"))
	set("theme_override_constants/outline_size",30)

func _on_hovering():
	highlight()
	get_parent().hovering.emit(menu_id)

func _on_stop_hovering():
	stop_highlight()
