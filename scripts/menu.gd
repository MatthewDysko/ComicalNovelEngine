extends Node

var PreloadedMenu = preload("res://nodes/menu.tscn")
var menu : MainMenu = null

var is_opened = false

func _input(event):
	if event.is_action_pressed("OpenMenu"):
		if menu == null:
			open()
			is_opened = true
		else: 
			if menu.in_a_submenu:
				menu.close_submenu()
			else:
				menu.close()
				is_opened = false
				menu = null
			

func open():
	if menu != null:
		menu.queue_free()
	menu = PreloadedMenu.instantiate()
	get_tree().root.add_child(menu)
