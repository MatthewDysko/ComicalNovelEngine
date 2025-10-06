extends Node
class_name ActorSprite

var pos : float
var sprite : String
var subset : int

func _init(_pos : float , _sprite : String , _subset : int):
	pos = _pos
	sprite = _sprite
	subset = _subset
