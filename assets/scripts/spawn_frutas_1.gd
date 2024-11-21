extends Marker3D

var banana = preload("res://scenes/frutas_completas/banana_completa.tscn")
var calabaza = preload("res://scenes/frutas_completas/calabaza_completa.tscn")
var fruta_dragon = preload("res://scenes/frutas_completas/fruta_dragon_completa.tscn")
var limon = preload("res://scenes/frutas_completas/limon_completo.tscn")
var manzana = preload("res://scenes/frutas_completas/manzana_completa.tscn")
var huevo = preload("res://scenes/HuevoCompletoN.tscn")
var array_frutas : Array

@export var direccion: Array = [0, 0, 0]
@export var tiempo_inicio: float = 1.0
# Called when the node enters the scene tree for the first time.

func _ready():
	$Timer.wait_time = tiempo_inicio
	array_frutas.append(banana)
	array_frutas.append(calabaza)
	array_frutas.append(fruta_dragon)
	array_frutas.append(limon)
	array_frutas.append(manzana)
	array_frutas.append(huevo)


func _on_timer_timeout():
	randomize()
	$Timer.wait_time = randf_range(1.5, 3.0)
	$AudioStreamPlayer3D.play()
	var nueva_fruta = array_frutas.pick_random().instantiate()
	nueva_fruta.direccion = direccion
	add_child(nueva_fruta)

func empezar():
	$Timer.start()

func parar():
	$Timer.stop()
