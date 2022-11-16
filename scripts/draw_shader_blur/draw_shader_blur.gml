// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_shader_blur(){

	//ANIMATION
	/*
	    ideally this should be moved out the draw event
	    for better control...
	*/
	var timeMult = 0.0025; //make the animation slower or faster...
	var time = current_time * timeMult;
	var oscillatorValue = sin(time);
	var oscillatorValueAbs = abs(sin(time));

	if os_type == os_android
	{     
	    vRatio = display_get_gui_width() / display_get_gui_height(); //distort the sampler uvs according to the screen ratio in the mobile devices...
	}else{
	    vRatio = 1.0;
	}
    
	// Samplers / Textures ---------------------------------------------------------------------

	// Shader setup ----------------------------------------------------------------------------
	var shader    = shBlur;
	var u_vRatio = shader_get_uniform(shader, "u_vRatio");
	var u_amplitude = shader_get_uniform(shader, "u_amplitude");
    
	var amplitude = 0.1;
    
	shader_set(shader);
	    shader_set_uniform_f(u_vRatio, vRatio);
	    shader_set_uniform_f(u_amplitude, amplitude);
	    draw_surface(application_surface,0,0);
	shader_reset();
	



}