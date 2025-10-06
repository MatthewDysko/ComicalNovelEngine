extends Control

func _input(event):
	if event.is_action_pressed("Up"):
		pass
	elif event.is_action_pressed("Down"):
		pass

func open():
	visible = true
	$Darken.modulate.a = 0;
	create_tween().tween_property($Darken,"modulate:a",0.65,0.25)
	$Sprite/AP.play("show")
	await get_tree().create_timer(0.1).timeout
	$Sprite/AS.play("show")
	await get_tree().create_timer(0.25).timeout
	$Overlay.visible = true

func close():
	$Overlay.visible = false
	$Sprite/AS.play("hide")
	await get_tree().create_timer(0.1).timeout
	$Sprite/AP.play("hide")
	create_tween().tween_property($Darken,"modulate:a",0,0.25)
	await get_tree().create_timer(0.25).timeout
	visible = false
