extends Area2D
	
var counter = 0
var rull
var bodyinside = self
	
func _ready():
	randomize()
	
func _process(delta_):
	if (bodyinside.get_name() == "David"):
		if bodyinside.velocity != Vector2(0,0):
			counter += 1
			if counter >120:
				rull = randi()%4+1
				print(rull)
				counter = 0
	
		
func _on_Hostile_Area_body_entered(body):
	if (body.get_name() == "David"):
		bodyinside = body
	
func _on_Hostile_Area_body_exited(body):
	if (body.get_name() == "David"):
		bodyinside = self
