extends RigidBody3D

@export var puntos: int = 3
@export var cortada: String = "Nombre"
var direccion: Array

# Called when the node enters the scene tree for the first time.
func _ready():
	angular_damp = 2
	contact_monitor = true
	max_contacts_reported = 2
	rotation = get_parent().rotation
	randomize()
	#apply_impulse(Vector3(rotation.y, 5, 0).normalized()* 8, Vector3(0, 0, 0))
	apply_impulse(Vector3(direccion[0], direccion[1], direccion[2]).normalized()* 8, Vector3(randf_range(0.0, 0.5), randf_range(0.0, 0.5), randf_range(0.0, 0.5)))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	GLOBAL.entered_body = null
	queue_free()
