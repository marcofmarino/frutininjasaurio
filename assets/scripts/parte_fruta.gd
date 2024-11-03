extends RigidBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true
	max_contacts_reported = 10
	randomize()
	apply_impulse(Vector3(randf(), randf(), randf()).normalized()* 2, Vector3(0, 0, 0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	randomize()

func _on_body_entered(body):
	GLOBAL.entered_body = null
	get_parent().queue_free()
