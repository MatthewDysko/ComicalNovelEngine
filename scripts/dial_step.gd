extends Node
class_name DialStep

enum EFFECT{NONE,FADE_IN,FADE_OUT}

var dial : String
var nametag : String = ""
var sprite_actions : Array[SpriteAction]
var effect : EFFECT = EFFECT.NONE
	
func _init(dialStep : Dictionary):
	dial = dialStep["dial"]
	nametag = dialStep["nametag"]
	
	if dialStep.has("sprites"):
		for action : Dictionary in dialStep["sprites"]:
			
			var sprite_action = SpriteAction.new(
				action["action"],
				action["id"]
			)
			if action.has("img"): sprite_action.img = action["img"]
			if action.has("sub_img"): sprite_action.sub_img = action["sub_img"]
			if action.has("position"): sprite_action.pos = action["position"]
			sprite_actions.append(sprite_action)
	if dialStep.has("effect"):
		match dialStep["effect"]:
			"fade_in": effect = EFFECT.FADE_IN
			"fade_out": effect = EFFECT.FADE_OUT
		pass
