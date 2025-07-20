var _arr = messages[|messageID];

var _name = _arr[MSG.NAME];
var _image = _arr[MSG.IMAGE];
var _subimg = _arr[MSG.SUBIMAGE];

//Args
var _sprite = sTextbox;

//Data
var cellSize = sprite_get_width(_sprite)/3;

var mainW = width - cellSize*2;
var mainH = height - cellSize*2;

var mainScaleW = mainW/cellSize;
var mainScaleH = mainH/cellSize;

///Corners
//Top left
draw_sprite_part(_sprite, 0, 0, 0, cellSize, cellSize, x, y);
    
//Top Right
draw_sprite_part(_sprite, 0, cellSize*2, 0, cellSize, cellSize, (x + width) - cellSize, y);
    
//Bottom left
draw_sprite_part(_sprite, 0, 0, cellSize*2, cellSize, cellSize, x, (y + height) - cellSize);
    
//Bottom Right
draw_sprite_part(_sprite, 0, cellSize*2, cellSize*2, cellSize, cellSize, (x + width) - cellSize, (y + height) - cellSize);

///Other
//Center
draw_sprite_part_ext(_sprite, 0, cellSize, cellSize, cellSize, cellSize, x + cellSize, y + cellSize, mainScaleW, mainScaleH, -1, 1);

//Top
draw_sprite_part_ext(_sprite, 0, cellSize, 0, cellSize, cellSize, x + cellSize, y, mainScaleW, 1, -1, 1);
        
//Bottom
draw_sprite_part_ext(_sprite, 0, cellSize, cellSize*2, cellSize, cellSize, x + cellSize, (y + height) - cellSize, mainScaleW, 1, -1, 1);
        
//Left
draw_sprite_part_ext(_sprite, 0, 0, cellSize, cellSize, cellSize, x, y + cellSize, 1, mainScaleH, -1, 1);
        
//Right
draw_sprite_part_ext(_sprite, 0, cellSize*2, cellSize, cellSize, cellSize, (x + width) - cellSize, y + cellSize, 1, mainScaleH, -1, 1);

var _drawX = x + firstPadding;
var _drawY = y + padding;

if sprite_exists(_image) {
	var _imageW = sprite_get_width(_image);
	var _imageH = sprite_get_height(_image);
	
	draw_sprite(_image, _subimg, _drawX + _imageW / 2, _drawY + _imageH / 2);
	
	_drawX += _imageW + firstPadding;
}

draw_set_color(c_white);
draw_set_font(fntText);
draw_text(_drawX,_drawY,_name);

_drawY += string_height(_name) + padding;

var _maxW = width - (_drawX + padding);

draw_set_font(fntText);
draw_text_ext(_drawX, _drawY, messageText, -1, _maxW);

draw_set_color(c_black);