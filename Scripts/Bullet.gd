class_name Bullet
extends KinematicBody2D



var direction = Vector2.ZERO



func _physics_process(delta):
	move_and_collide(direction.normalized()*global.Bulletspeed)
	rotation = Vector2.UP.angle_to(direction)
	


func _on_Area2D_area_entered(area):
	if(area.owner== null):
		return
	if(area.owner.is_in_group("Enemy")):
		area.owner.makedie()
		self.queue_free()
	



func _on_Timer_timeout():
	self.queue_free()
