extends Control
class_name DialWindow

@export var dialogueJSON : JSON

var PreloadedActor = preload("res://nodes/actor.tscn")
var PreloadedOptions = preload("res://nodes/options.tscn")

var step : DialStep
var dialogue : Dialogue
var is_selecting_option = false
var is_fading = false

func _ready():
	dialogue = Dialogue.new(dialogueJSON,"0")
	
	get_parent().hide_actors()
	show_dial_window()
	await get_tree().create_timer(0.5).timeout
	
	show_next_step()

func change_dialogue_path(new_path : String):
	dialogue = Dialogue.new(dialogueJSON,new_path)
	show_next_step()

func _input(event):
	if event.is_action_pressed("NextStep") and !Menu.is_opened and !is_selecting_option and !is_fading:
		show_next_step()
			
func show_next_step():
	if dialogue.is_finished():
		hide_dial_winodw()
		return

	step = dialogue.get_next_step()	
	
	if step is DialChoiceStep: 
		show_option_window()
	else: show_next_line()

func format_nametag(nametag : String) -> String :
	var new_nametag : String = ""
	for word in nametag.split(" "):
		new_nametag += "[b]" + word[0] + "[/b]"
		new_nametag += word.trim_prefix(word[0]) + " "
	new_nametag.trim_suffix(" ")
	return new_nametag

func show_dial_window():
	dialogue = Dialogue.new(dialogueJSON,"0")
	$AP.play("Show")
	$Dial.text = ""
	
	var first_nametag : String
	for _step : DialStep in dialogue.steps:
		if _step.nametag != "":
			first_nametag = _step.nametag
			return
	$Control/NameBox/MRG/Name.text = format_nametag(first_nametag)
	
func hide_dial_winodw():
	$AP.play("Hide")
	await get_tree().create_timer(0.75).timeout
	get_parent().show_actors()
	queue_free()
	return
	
func show_option_window():
	var options : Options = PreloadedOptions.instantiate()
	options.choices = step.choices
	add_child(options)
	is_selecting_option = true
	return
	
func show_next_line():
	$Dial.show_text(step)
	$Control/NameBox/MRG/Name.text = format_nametag(step.nametag)
	
	match step.effect:
		DialStep.EFFECT.FADE_IN: create_tween().tween_property($ColorRect,"color:a",1,1)
		DialStep.EFFECT.FADE_OUT: create_tween().tween_property($ColorRect,"color:a",0,1)
		DialStep.EFFECT.NONE: pass
		
	for sprite_action : SpriteAction in step.sprite_actions:
		match sprite_action.sprite_action:
			SpriteAction.ACTION.CREATE: create_actor(sprite_action)
			SpriteAction.ACTION.MODIFY: modify_existing_actor(sprite_action)

func create_actor(sprite_action):
	var actor : Actor = PreloadedActor.instantiate()
	actor.big = true
	actor.id = sprite_action.actor_id
	actor.pos = sprite_action.pos
	actor.img = sprite_action.img
	actor.img_sub = sprite_action.sub_img
	$Actors.add_child(actor)

func modify_existing_actor(sprite_action):
	for actor : Actor in $Actors.get_children():
		if actor.id == sprite_action.actor_id:
			if sprite_action.img != "" : 
				actor.img = sprite_action.img
				actor.load_sprites()
			if sprite_action.sub_img != -1: 
				actor.img_sub = sprite_action.sub_img
				actor.load_sprites()
				actor.jump()
			if sprite_action.pos != -1.0 : 
				actor.change_pos(sprite_action.pos)

func _on_button_pressed():
	show_next_step()
	
	
