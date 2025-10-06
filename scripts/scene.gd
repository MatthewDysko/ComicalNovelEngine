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
			new_actor.pos = actor["actor"][0]
			new_actor.sprite = actor["actor"][1]
			new_actor.subset = actor["actor"][2]
			new_actor.dialogue = actor["actor"][3]
			actors.append(new_actor)
