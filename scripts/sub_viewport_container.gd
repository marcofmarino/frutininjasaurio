extends SubViewportContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	$ViewportLeft/CameraLeft.make_current()
	# Asignar la cámara derecha al ViewportRight
	$ViewportRight/CameraRight.make_current()
	
	# Establecer el tamaño de los Viewports en función de la resolución de pantalla
	var screen_size = get_viewport_rect().size
	$ViewportLeft.size = Vector2(screen_size.x / 2, screen_size.y)
	$ViewportRight.size = Vector2(screen_size.x / 2, screen_size.y)
	
	# Ajustar las posiciones de los Viewports

	
	# Mover el ViewportRight para que se vea en la otra mitad de la pantalla
	$ViewportRight.rect_position.x = screen_size.x / 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
