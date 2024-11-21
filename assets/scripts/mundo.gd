extends Node3D

var entered_body: Node3D = null
var bananacut_scene = preload("res://scenes/banana_cortada.tscn")
var calabaza_cortada = preload("res://scenes/calabaza_cortada.tscn")
var fruta_dragon_cortada = preload("res://scenes/fruta_dragon_cortada.tscn")
var limon_cortado = preload("res://scenes/limon_cortado.tscn")
var manzana_cortada = preload("res://scenes/manzana_cortada.tscn")
var huevo_cortado = preload("res://scenes/HuevoCortadoN.tscn")
var fruta_inicio_cortada = preload("res://scenes/sandia_cortada.tscn")

var banana = preload("res://scenes/frutas_completas/banana_inicio.tscn")

var fruta_inicio = null
# Called when the node enters the scene tree for the first time.
func _ready():
	_inicio()
	if $Ambiente.playing:
		$Ambiente.stop()
	$Ambiente.play()

func _inicio():
	fruta_inicio = banana.instantiate()
	fruta_inicio.global_position = $Inicio.global_position
	$Inicio.add_child(fruta_inicio)

func _comenzar():
	$SpawnFrutas1.empezar()
	$SpawnFrutas2.empezar()
	GLOBAL.vidas = 3
	$Timer.start()
	$SonidoInicio.play()


func cortar_el_banano(body: RigidBody3D) -> void:
	# Instancia el fruto
	if not GLOBAL.entered_body == null:
		if $Camaras/Control/SubViewportContainer/ViewportLeft/CameraLeft/garras_ter/AnimationPlayer.is_playing():
			$Camaras/Control/SubViewportContainer2/ViewportRight/CameraRight/garras_ter/AnimationPlayer.play("corte_der")
		else:
			$Camaras/Control/SubViewportContainer/ViewportLeft/CameraLeft/garras_ter/AnimationPlayer.play("corte_izq")
		var banana_instance = null
		match body.cortada:
			"banana":
				banana_instance = bananacut_scene.instantiate()
			"calabaza":
				banana_instance = calabaza_cortada.instantiate()
			"dragon":
				banana_instance = fruta_dragon_cortada.instantiate()
			"limon":
				banana_instance = limon_cortado.instantiate()
			"manzana":
				banana_instance = manzana_cortada.instantiate()
			"huevo":
				banana_instance = huevo_cortado.instantiate()
				_restar_vidas()
			"fruta_inicio":
				banana_instance = fruta_inicio_cortada.instantiate()
				_comenzar()
		aumentar_puntos(body.puntos)

		# Reemplaza a la banana entera por la cortada en la misma posición y rotación
		# Añade la banana cortada a la misma jerarquía de nodos que la banana completa
		body.get_parent().add_child(banana_instance)
		banana_instance.global_position = body.global_position	

		# Elimina a la banana completa
		body.queue_free() 
		GLOBAL.entered_body = null  # Reinicia la referencia

func _physics_process(delta):
	
	$RayLeft.look_at($Camaras/Control/SubViewportContainer/ViewportLeft/CameraLeft/Node3D/Sprite3D.get_global_position())
	$RayRight.look_at($Camaras/Control/SubViewportContainer2/ViewportRight/CameraRight/Node3D/Sprite3D.get_global_position())
	if $RayLeft.is_colliding() and $RayLeft.get_collider() is RigidBody3D:
			GLOBAL.entered_body = $RayLeft.get_collider()
	else:
		GLOBAL.entered_body = null
	

func _input(event):
	if Input.is_action_just_pressed("cortar"):
		if $Camaras/Control/SubViewportContainer/ViewportLeft/CameraLeft/garras_ter/AnimationPlayer.is_playing():
			$Camaras/Control/SubViewportContainer2/ViewportRight/CameraRight/garras_ter/AnimationPlayer.play("corte_der")
		else:
			$Camaras/Control/SubViewportContainer/ViewportLeft/CameraLeft/garras_ter/AnimationPlayer.play("corte_izq")
		cortar_el_banano(GLOBAL.entered_body)

func aumentar_puntos(cant: int = 0):
	GLOBAL.puntos += cant
	_actualizar_label()

func _actualizar_label():
	$Label.text = "Puntos: " + str(GLOBAL.puntos) + "\nVidas: " + str(GLOBAL.vidas)

func _restar_vidas():
	GLOBAL.vidas -= 1
	if GLOBAL.vidas == 0:
		_parar()
	else:
		_actualizar_label()

func _parar():
	$SonidoFin.play()
	GLOBAL.puntos = 0
	_inicio()
	$Timer.stop()
	$SpawnFrutas2.parar()
	$SpawnFrutas1.parar()

func _on_timer_timeout():
	_parar()
