extends Node

var PreloadedMenu = preload("res://nodes/menu.tscn")
var menu = null

func _input(event):
	if event.is_action_pressed("OpenMenu"):
		if menu == null:
			open()
		else: 
			menu.close()
			menu = null

func open():
	if menu != null:
		menu.queue_free()
	menu = PreloadedMenu.instantiate()
	get_tree().root.add_child(menu)
