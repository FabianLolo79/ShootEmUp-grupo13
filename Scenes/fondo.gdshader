shader_type canvas_item;

uniform float scroll_speed = 1; //investigar

void fragment() {
	vec2 shifteduv = UV;
	shifteduv.y -=  scroll_speed; // TIME *
	vec4 color = texture(TEXTURE, shifteduv);
	COLOR = color;
}


