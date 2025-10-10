extends RichTextLabel

@export var menu_id = 0

func highlight():
	set("theme_override_colors/default_color",Color("White"))
	set("theme_override_colors/font_outline_color",Color("Black"))
	set("theme_override_constants/outline_size",40)
	for node in get_children():
		if node is Button: return
		node.set("theme_override_colors/default_color",Color("White"))
		node.set("theme_override_colors/font_outline_color",Color("Black"))
		node.set("theme_override_constants/outline_size",60)

func stop_highlight():
	set("theme_override_colors/default_color",Color("Black"))
	set("theme_override_colors/font_outline_color",Color("White"))
	set("theme_override_constants/outline_size",30)
	for node in get_children():
		if node is Button: return
		node.set("theme_override_colors/default_color",Color("Black"))
		node.set("theme_override_colors/font_outline_color",Color("White"))
		node.set("theme_override_constants/outline_size",30)

func _on_hovering():
	if get_parent().in_a_submenu: 
		return
	highlight()
	get_parent().hovering.emit(menu_id)

func _on_stop_hovering():
	if get_parent().in_a_submenu: 
		return
	stop_highlight()
