varying vec2 v_uv0;
varying vec2 v_uv0Ratio;

uniform float u_vRatio;
uniform float u_amplitude;

void main()
{
    float pi = 1.0;
    float circle = 2.0 * pi;
    
    vec4 blur = vec4(0.0,0.0,0.0,0.0);
    
    int SAMPLES = 12;
    
    float stp = (1.0 / float(SAMPLES));
    
    for (int i = 0; i < SAMPLES; i++)
    {
        highp float amp = (u_amplitude / float(SAMPLES)) * float(i);
        
        highp float shift_x = amp;
        highp float shift_y = amp;
        
        highp vec2 shiftUV =  v_uv0 + (vec2(shift_x, shift_y) * ((1.0 - v_uv0) * 2.0 -1.0) );
        
        blur += texture2D(gm_BaseTexture, shiftUV) / float(SAMPLES);
    }
    
    vec4 Complete = blur;
    
    gl_FragColor = vec4(Complete.rgb, 1.0);
}

