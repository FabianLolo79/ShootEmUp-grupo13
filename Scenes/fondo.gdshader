shader_type canvas_item;

uniform float scroll_speed = 0.01; //investigar

void fragment() {
	vec2 shifteduv = UV;
	shifteduv.y -= TIME * scroll_speed;
	vec4 color = texture(TEXTURE, shifteduv);
	COLOR = color;
}
