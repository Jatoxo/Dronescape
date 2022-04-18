extends KinematicBody2D
var rngesus = RandomNumberGenerator.new()
onready var Player = get_tree().get_nodes_in_group("Player")
var direction : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func makedie():
	self.queue_free()
	global.enemycount -= 1

func _process(delta):
	direction =  Player[0].global_position - self.global_position 
	rngesus.randomize()
	direction = direction.normalized() * rngesus.randi_range(100,250) 
	direction = move_and_slide(direction)
	rotation = Vector2.UP.angle_to(direction)
	pass
