flashAlpha = 0;
flashColor = c_red;

upixelH = shader_get_uniform(shFlash, "pixelH");
upixelW = shader_get_uniform(shFlash, "pixelW");
texelH = texture_get_texel_height(sprite_get_texture(sprite_index,0));
texelW = texture_get_texel_width(sprite_get_texture(sprite_index,0));