extends Node
class_name SpriteAction

enum ACTION{CREATE, MODIFY}

var sprite_action : ACTION
var actor_id : String
var img : String = ""
var sub_img : int = -1
var pos : float = -1.0

func _init(
		_sprite_action : String, 
		_actor_id : String):
	match _sprite_action:
		"create": sprite_action = ACTION.CREATE
		"modify": sprite_action = ACTION.MODIFY
	actor_id = _actor_id
