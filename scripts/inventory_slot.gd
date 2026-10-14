extends Control

@export var id: int

@export var modulate_color = Color(0.2, 0.2, 0.2, 1.0)

var icon: Texture2D:
	set(value):
		$PanelContainer/Icon.texture = value

func _ready() -> void:
	UiManager.clear_selected.connect(clear_selected)
	$PanelContainer/Icon.modulate = modulate_color

func clear_selected() -> void:
	$PanelContainer/Button.set_pressed_no_signal(false)
	$PanelContainer/Icon.modulate = modulate_color

func _on_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		UiManager.clear_selected.emit()
		
		$PanelContainer/Icon.modulate = Color.WHITE
		GameState.active_inventory().current_item = id
		$PanelContainer/Button.set_pressed_no_signal(true)
	else:
		$PanelContainer/Icon.modulate = modulate_color
