extends Control

var PreloadedDialoge : PackedScene = preload("res://nodes/DialWindow.tscn")

@export var sceneJSON : JSON

var menu_opened : bool = false

var scene : Scene
var actors : Array[Actor]

func _ready():
	scene_setup()

func scene_setup():
	scene = Scene.new(sceneJSON)
	$Backdrop.texture = scene.backdrop
	
	for actor : Actor in scene.actors:
		add_child(actor)
		actors.append(actor)

func open_dialogue(dialName : String):
	var dialWindow : DialWindow = PreloadedDialoge.instantiate()
	var dialPath = "res://scenes/dialogues/"+dialName+".json"
	if FileAccess.file_exists(dialPath):
		dialWindow.dialogueJSON = load(dialPath)
	else:
		dialWindow.dialogueJSON = load("res://scenes/dialogues/dial_err.json")
	
	add_child(dialWindow)

func hide_actors():
	for actor : Actor in actors:
		actor.disable_button()
		create_tween().tween_property(actor,"modulate:a",0,0.25)

func show_actors():
	for actor : Actor in actors:
		actor.enable_button()
		create_tween().tween_property(actor,"modulate:a",1,0.25)
