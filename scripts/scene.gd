extends Node
class_name Scene

var PreloadedActor = preload("res://nodes/actor.tscn")

var backdrop : Texture2D
var actors : Array

func _init(sceneJSON : JSON):
	var scene : Dictionary = sceneJSON.data
	
	if scene.has("backdrop"):
		backdrop = load("res://assets/rooms/" + scene["backdrop"])
	
	if scene.has("actors"):
		for actor : Dictionary in scene["actors"]:
			var new_actor : Actor = PreloadedActor.instantiate()
			new_actor.id = actor["actor"]["id"]
			new_actor.img = actor["actor"]["img"]
			new_actor.img_sub = actor["actor"]["sub_img"]
			new_actor.pos = actor["actor"]["position"]
			
			if actor["actor"].has("dialogue"):
				new_actor.dialogue = actor["actor"]["dialogue"]
			
			actors.append(new_actor)
