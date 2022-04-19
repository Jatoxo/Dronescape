extends KinematicBody2D

var rngesus = RandomNumberGenerator.new()
var vector : Vector2 = Vector2(0,0)
var randDir = 1
var movement : Vector2 = Vector2.ZERO
func _ready():
	pass # Replace with function body.

func makedie():
	self.queue_free()
	global.enemycount -= 1
func _process(delta):
	vector = Vector2(0,0)

	if(randDir == 1 ):
		vector.x -= 1                                   
	if(randDir == 2):
		vector.x += 1
	if(randDir== 3):
		vector.y -= 1
	if(randDir == 4):
		vector.y += 1
	vector = vector.normalized()
	
	movement += vector * delta * 144.0
	movement = move_and_slide(movement)


func _on_Timer_timeout():
	$Timer.start()
	rngesus.randomize()
	randDir = rngesus.randi_range(1,4)
	pass # Replace with function body.

