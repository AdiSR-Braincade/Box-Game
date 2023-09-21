extends KinematicBody2D

var speed = 200  # Adjust the speed as needed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Input handling for movement
	var velocity = Vector2(0, 0)  # Initialize velocity as zero

	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

	# Normalize diagonal movement
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	# Move the player
	move_and_slide(velocity)

