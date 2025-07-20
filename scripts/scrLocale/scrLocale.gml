global.locale = LOCALE.EN;
InitTranslations();

function InitTranslations()
{
	global.locData = load_csv("ORS_locale.csv");
	
	var hh = ds_grid_height(global.locData);
	var translations = ds_map_create();
	
	for (var i = 1; i < hh; i++)
	{
		ds_map_add(translations, global.locData[# 0, i], i);
	}
	
	global.translations = translations;
}

function Text(key)
{
	var text = "";
	
	if global.translations[? key] != undefined
	{
		text = global.locData[# 1 + global.locale,global.translations[? key]];
		var a = argument_count > 1 ? argument[1] : "";
		text = string_replace_all(text,"{a}", a);
	} else {
		text = key;
	}
	return text;
}