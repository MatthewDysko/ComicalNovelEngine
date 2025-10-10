extends Control
class_name MainMenu

var PreloadedContacts = preload("res://nodes/contacts.tscn")

signal hovering(id : int)

var currently_selected = null
var in_a_submenu : bool = false

func _ready():
	hovering.connect(deselect_all)
	currently_selected = $Contacts
	currently_selected.highlight()
	$AP.play("Show")

func deselect_all(except : int):
	currently_selected = get_menu_button(except)
	for button in get_all_menu_buttons():
		if button.menu_id != except:
			button.stop_highlight()

func _input(event):
	if event.is_action_pressed("Down") and !in_a_submenu:
		if currently_selected == null: 
			currently_selected = get_menu_button()
			currently_selected.highlight()
			return
		currently_selected.stop_highlight()
		var new_id = currently_selected.menu_id + 1
		if new_id == 5: new_id = 0
		currently_selected = get_menu_button(new_id)
		currently_selected.highlight()
	elif event.is_action_pressed("Up") and !in_a_submenu:
		if currently_selected == null: 
			currently_selected = get_menu_button()
			currently_selected.highlight()
			return
		currently_selected.stop_highlight()
		var new_id = currently_selected.menu_id - 1
		if new_id == -1: new_id = 4
		currently_selected = get_menu_button(new_id)
		currently_selected.highlight()
	elif event.is_action_pressed("NextStep") and !in_a_submenu:
		open_submenu()
		
func get_menu_button(id : int = 0):
	return get_all_menu_buttons()[id]

func get_all_menu_buttons():
	return [$Contacts, $"Past Dialogue", $SaveGame, $Settings, $Quit]
	
func close():
	$AP.play("Hide")
	await $AP.animation_finished
	queue_free()
	
func open_submenu():
	if currently_selected == null: return
	match currently_selected.menu_id:
		0:
			$AP.play("open_contacts")
			add_child(PreloadedContacts.instantiate())
			in_a_submenu = true
	
func close_submenu():
	match currently_selected.menu_id:
		0:
			$AP.play("close_contacts")
			$ContactPage.hide_contacts()
			
	in_a_submenu = false

func shake_phone():
	$Phone/Phone/AnimationPlayer.play("shake")
