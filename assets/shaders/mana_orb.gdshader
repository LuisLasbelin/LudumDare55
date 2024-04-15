shader_type canvas_item;

uniform float mana;
uniform float amp;
uniform float vel;
uniform float intens;

void fragment() {
    vec4 tex = texture(TEXTURE, UV);
    float wave = sin(UV.x * amp + TIME * vel);
    wave = ceil( abs(-UV.y) - 1.0 + mana + wave * intens);
    wave *= tex.a;
    float col = mix(wave, 1.0, tex.r);
    COLOR = vec4(vec3(col), tex.a);
}