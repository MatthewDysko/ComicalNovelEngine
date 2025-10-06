extends Control
class_name DialWindow


@export var dialogueJSON : JSON

var PreloadedDialText = preload("res://nodes/dial_text.tscn")
var PreloadedDialChoice = preload("res://nodes/dial_choice_step_window.tscn")
var PreloadedActor = preload("res://nodes/actor.tscn")

var dialogue : Dialogue

var current_dial_text : DialText
var finished_showing_dial_text = false

func _ready():
	get_parent().hide_actors()
	dialogue = Dialogue.new(dialogueJSON,"0")
	next()

func _input(event):
	if event.is_action_pressed("NextDialStep"):
		if finished_showing_dial_text:
			finished_showing_dial_text = false
			next()
		else:
			current_dial_text.show_all_text()
			finished_showing_dial_text = true
			

func next():
	if dialogue.is_finished():
		fade_out_dialogue()
		return
	
	var step = dialogue.get_next_step()
	if step is DialStep:
		age_children()
		
		move_any_actor(step)
		spawn_new_actor(step)

		spawn_new_text(step)
	
	elif step is DialChoiceStep:
		var dial_choice_window : DialChoiceWindow = PreloadedDialChoice.instantiate()
		dial_choice_window.choices = step.choices
		add_child(dial_choice_window)
		var selected_choice : String = await dial_choice_window.choice_made
		dial_choice_window.queue_free()
		dialogue = Dialogue.new(dialogueJSON,selected_choice)
		next()

func move_any_actor(step : DialStep):
	if step.move_sprite == null: return
	for actor : Actor in $Actors.get_children():
		if actor.sprite == step.move_sprite.sprite:
			actor.change_pos(step.move_sprite.pos)
			actor.change_subset(step.move_sprite.subset)

func spawn_new_actor(step : DialStep):
	if step.new_sprite == null: return
	var actor : Actor = PreloadedActor.instantiate()
	actor.big = true
	actor.pos = step.new_sprite.pos
	actor.sprite = step.new_sprite.sprite
	actor.subset = step.new_sprite.subset
	$Actors.add_child(actor)
		
func spawn_new_text(step : DialStep):
	current_dial_text = PreloadedDialText.instantiate()
	current_dial_text.text = step.dial # 715.0
	add_child(current_dial_text)
	
	var actor : Actor = get_actor(step)
	if actor != null:
		actor.speak()
		await current_dial_text.finished_showing
		get_actor(step).stop_speaking()
		finished_showing_dial_text = true

func age_children():
	for child in get_children():
		if child is DialText:
			child.age()

func fade_out_dialogue():
	create_tween().tween_property(self,"modulate:a",0,0.15).set_trans(Tween.TRANS_CUBIC)
	get_parent().show_actors()
	await get_tree().create_timer(0.25).timeout
	queue_free()

func get_actor(step : DialStep):
	for actor : Actor in $Actors.get_children():
		if actor.sprite == step.nametag:
			return actor
	return null
	
	
	
