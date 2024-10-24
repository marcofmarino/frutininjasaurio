extends Area3D

# Carga la escena de la banana cortada
var bananacut_scene = preload("res://scenes/BananaCortada.tscn")

# Almacena una referencia al cuerpo que entró al área
var entered_body: Node3D = null

func _on_body_entered(body: Node3D) -> void:
	# Verifica si el cuerpo que ha entrado es un RigidBody3D
	if body is RigidBody3D:
		print("Personaje ha entrado. Presiona la tecla para transformar en árbol...")
		entered_body = body  # Almacena la referencia del cuerpo que entró

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and entered_body:
		cortar_el_banano(entered_body)

func cortar_el_banano(body: RigidBody3D) -> void:
	# Instancia el fruto
	var banana_instance = bananacut_scene.instantiate()
	
	# Reemplaza a la banana entera por la cortada en la misma posición y rotación
	banana_instance.global_transform = body.global_transform
	
	# Añade la banana cortada a la misma jerarquía de nodos que la banana completa
	body.get_parent().add_child(banana_instance)
	
	# Elimina a la banana completa
	body.queue_free() 
	entered_body = null  # Reinicia la referencia
