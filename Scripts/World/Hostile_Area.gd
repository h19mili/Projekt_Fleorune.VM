extends Area2D
	
var rull
	
func _ready():
	randomize()
	
func _on_Combat_Trigger_timeout():
	rull = randi()%2+1
	print(rull)
		
func _on_Hostile_Area_body_entered(body):
	if (body.get_name() == "David"):
		$Combat_Trigger.start()
		
func _on_Hostile_Area_body_exited(body):
	if (body.get_name() == "David"):
		$Combat_Trigger.stop()
