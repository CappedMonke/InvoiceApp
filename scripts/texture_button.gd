@tool
extends TextureButton


@export var texture: Texture2D:
	set(new_texture):
		texture = new_texture
		texture_normal = texture
		texture_hover = texture
		texture_pressed = texture
		texture_focused = texture
