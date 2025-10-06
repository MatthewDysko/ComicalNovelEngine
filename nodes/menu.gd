extends Control

signal hovering(id : int)

var currently_selected = null

func _ready():
	hovering.connect(deselect_all)
	$AP.play("Show")

func deselect_all(except : int):
	currently_selected = get_menu_button(except)
	for button in get_all_menu_buttons():
		if button.menu_id != except:
			button.stop_highlight()

func _input(event):
	if event.is_action_pressed("Down"):
		if currently_selected == null: 
			currently_selected = get_menu_button()
			currently_selected.highlight()
			return
		currently_selected.stop_highlight()
		var new_id = currently_selected.menu_id + 1
		if new_id == 5: new_id = 0
		currently_selected = get_menu_button(new_id)
		currently_selected.highlight()
	elif event.is_action_pressed("Up"):
		if currently_selected == null: 
			currently_selected = get_menu_button()
			currently_selected.highlight()
			return
		currently_selected.stop_highlight()
		var new_id = currently_selected.menu_id - 1
		if new_id == -1: new_id = 4
		currently_selected = get_menu_button(new_id)
		currently_selected.highlight()

func get_menu_button(id : int = 0):
	match id:
		0: return $Messeges
		1: return $ClassBoard
		2: return $PastDialogue
		3: return $Settings
		4: return $Quit

func get_all_menu_buttons():
	return [$Messeges, $ClassBoard, $PastDialogue, $Settings, $Quit]
	
func close():
	$AP.play("Hide")
	await $AP.animation_finished
	queue_free()
