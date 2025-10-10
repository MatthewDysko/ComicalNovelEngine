extends Node
class_name Dialogue

var current_step = 0
var steps : Array = []

func _init(dialogueJSON : JSON, path : String):
	for step : Dictionary in dialogueJSON.data[path]:
		if step.has("choices"):
			steps.append(DialChoiceStep.new(step))
		else:
			steps.append(DialStep.new(step))
	pass

func get_next_step():
	var next_step = steps[current_step]
	current_step += 1
	return next_step

func is_finished():
	return current_step == steps.size()
