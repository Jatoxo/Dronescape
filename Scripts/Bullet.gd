class_name Bullet
extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2

var direction = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


func _physics_process(delta):
	move_and_collide(direction.normalized()*global.Bulletspeed)
	rotation = Vector2.UP.angle_to(direction)
	


func _on_Area2D_area_entered(area):
	if(area.owner== null):
		return
	if(area.owner.is_in_group("Enemy")):
		area.owner.makedie()
		self.queue_free()
	
	
	pass # Replace with function body.


func _on_Timer_timeout():
	self.queue_free()
	pass # Replace with function body.
