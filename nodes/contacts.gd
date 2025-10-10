extends Control

@export var contactsJSON : JSON
var PreloadedContactButton = preload("res://nodes/contact_button.tscn")


var menu : MainMenu 
var current_contact_id : int = 0;
var current_contact_selected = null
var contacts : Array

var enter_animation_finished = false

func _ready():
	menu = get_parent()
	
	var pos_y = 0
	for contactData : Dictionary in contactsJSON.data["class"]:
		var contact : ContactButton = PreloadedContactButton.instantiate()
		contact.contactData = contactData
		contact.position.x += 200
		contact.position.y = pos_y
		pos_y += 126
		contact.modulate.a = 0
		add_child(contact)
	
	contacts = get_children()
	
	for contact : MarginContainer in contacts:
		create_tween().tween_property(contact,"modulate:a",1,0.5).set_trans(Tween.TRANS_CUBIC)
		if contact == contacts[0]:
			create_tween().tween_property(contact,"position:x",contact.position.x-280,0.5).set_trans(Tween.TRANS_CUBIC)
			current_contact_selected = contacts[current_contact_id]
		else:
			create_tween().tween_property(contact,"position:x",contact.position.x-200,0.5).set_trans(Tween.TRANS_CUBIC)
		await get_tree().create_timer(0.05).timeout
		pass
	
func hide_contacts():
	for contact : MarginContainer in contacts:
		create_tween().tween_property(contact,"modulate:a",0,0.25).set_trans(Tween.TRANS_CUBIC)
		create_tween().tween_property(contact,"position:x",contact.position.x-500,0.25).set_trans(Tween.TRANS_CUBIC)
		await get_tree().create_timer(0.015).timeout
	await get_tree().create_timer(0.1).timeout
	queue_free()

func _input(event):
	if menu.in_a_submenu and menu.currently_selected.menu_id == 0:
		if event.is_action_released("Down"):
			if current_contact_id == contacts.size()-1: return
			current_contact_id += 1
			create_tween().tween_property(self,"position:y",position.y-126,0.15).set_trans(Tween.TRANS_CUBIC)
			highlight_option()
		
		elif event.is_action_released("Up"):
			if current_contact_id == 0: return
			current_contact_id -= 1
			create_tween().tween_property(self,"position:y",position.y+126,0.15).set_trans(Tween.TRANS_CUBIC)
			highlight_option()

func highlight_option():
	get_parent().shake_phone()
	create_tween().tween_property(current_contact_selected,"position:x",0,0.15).set_trans(Tween.TRANS_CUBIC)
	current_contact_selected = contacts[current_contact_id]
	create_tween().tween_property(current_contact_selected,"position:x",-80,0.15).set_trans(Tween.TRANS_CUBIC)
