extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	if $Ambiente.playing:
		$Ambiente.stop()
	$Ambiente.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#-------------------------------------------------------------------------------

func actualizar_puntaje() -> void:
	$"Camaras/Control/PanelPuntos/HBoxContainer/CantPuntos".text = str(Global.puntos_totales)

func actualizar_combo() -> void:
	$"Camaras/Control/PanelCombo/VBoxContainer/CantCombo".text = str(Global.combo_total)

func actualizar_vida() -> void:
	$"Camaras/Control/PanelVida/HBoxContainer/CantVidas".text = str(Global.vida)
