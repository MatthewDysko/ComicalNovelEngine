extends Node
class_name DialStep

var dial : String
var nametag : String

var new_sprite : ActorSprite
var move_sprite : ActorSprite

func _init(dialStep : Dictionary):
	dial = dialStep["dial"]
	nametag = dialStep["nametag"]
	
	if dialStep.has("new_sprite"):
		new_sprite = ActorSprite.new(
			dialStep["new_sprite"][0],
			dialStep["new_sprite"][1],
			dialStep["new_sprite"][2]
		)
	
	if dialStep.has("move_sprite"):
		move_sprite = ActorSprite.new(
			dialStep["move_sprite"][0],
			dialStep["move_sprite"][1],
			dialStep["move_sprite"][2]
		)
