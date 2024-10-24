extends RigidBody3D

@export var puntos: int = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true
	max_contacts_reported = 2
	rotation = get_parent().rotation
	randomize()
	apply_impulse(Vector3(1, 5, 0).normalized()* 8, Vector3(1, 0, 0.5))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	queue_free()
