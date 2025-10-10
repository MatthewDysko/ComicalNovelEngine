extends Control
class_name Actor

# Number of Spaces availbe for Sprites 
var screen_segments = 5

var id = ""
var pos = 1
var img = "error"
var img_sub = 0

var dialogue = ""
var big = false
var atlas : AtlasTexture = AtlasTexture.new()
var speaking = false;

func _ready():
	modulate.a = 0
	$Button.pressed.connect(open_dialogue)
	load_sprites()
	set_pos(pos)
	fade_in()
	
func fade_in():
	var og_pos_y : float = position.y
	if big: position.y += 100
	else: position.y += 200
	
	create_tween().tween_property(self,"position:y",og_pos_y,0.5).set_trans(Tween.TRANS_CUBIC)
	create_tween().tween_property(self,"modulate:a",1,0.5).set_trans(Tween.TRANS_CUBIC)
	
func open_dialogue():
	get_parent().open_dialogue(dialogue)

func load_sprites():
	atlas.atlas = load("res://assets/sprites/" + img)
	atlas.region.position.x = 512*img_sub 
	atlas.region.size = Vector2(512,512)
	$Sprite.texture = atlas
	
	if big:
		disable_button()
		$Sprite.size = Vector2(1060.0,1060.0)
		$Sprite.position = Vector2(-372.0,-366.0)

func set_pos(_pos = 1.0):
	position.x = ((get_viewport_rect().size.x/screen_segments)*_pos)-(get_viewport_rect().size.x/screen_segments)

func disable_button():
	$Button.visible = false

func enable_button():
	$Button.visible = true

func change_pos(_pos = 1.0):
	var new_pos_x = ((get_viewport_rect().size.x/screen_segments)*_pos)-(get_viewport_rect().size.x/screen_segments)
	create_tween().tween_property(self,"position:x",new_pos_x,0.5).set_trans(Tween.TRANS_CUBIC)

func change_subset(_subset = 0):
	img_sub = _subset
	if 512*img_sub != atlas.region.position.x:
		atlas.region.position.x = 512*img_sub
		$Sprite.texture = atlas
	
func jump():
	var og_y_pos = $Sprite.position.y
	create_tween().tween_property($Sprite,"position:y",og_y_pos-50,0.15).set_trans(Tween.TRANS_CUBIC)
	await get_tree().create_timer(0.15).timeout
	create_tween().tween_property($Sprite,"position:y",og_y_pos,0.1).set_trans(Tween.TRANS_CUBIC)
	
