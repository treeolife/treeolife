/// @desc Draw Menu

var offset = menu_txt_offset;

draw_set_color(c_black);
draw_set_font(menu_help_font);
draw_set_valign(fa_bottom);
draw_set_halign(fa_left);
draw_text_transformed(gui_margin,gui_height-gui_margin,help_text,1,1,0);
draw_text_transformed(gui_margin,gui_height-menu_itemheight,control_text,1,1,0);

draw_set_font(menu_font);
draw_set_valign(fa_top);
draw_set_halign(fa_middle);
draw_set_alpha(menu_fade);
scr_text_outline(gui_width/2,30,offset,title,1,1,0);
draw_set_color(c_white);
draw_text_transformed(gui_width/2,30,title,1,1,0);
draw_set_valign(fa_bottom);

// People
draw_set_halign(fa_right);
for (var i = 0; i < credits_menu_items; i++)
{
	var col;
	var txt = credits_menu[i];
	//if (menu_cursor == i)
	//{	
		//txt = string_insert("> ", txt, 0);
	col = c_white;
	//}
	//else
	//{
		//col = c_gray;
	//}
	var xx = gui_width/2 - gui_margin/2;
	var yy = gui_height - (menu_itemheight * (i * 1.1)) - gui_margin;
	
	scr_text_outline(xx,yy,offset,txt);
	draw_set_color(col);
	draw_text(xx,yy,txt);
}

// Roles
draw_set_halign(fa_left);
for (var i = 0; i < roles_menu_items; i++)
{
	var col;
	var txt = roles_menu[i];
	//if (menu_cursor == i)
	//{	
		//txt = string_insert("> ", txt, 0);
	col = c_white;
	//}
	//else
	//{
		//col = c_gray;
	//}
	var xx = gui_width/2 + gui_margin/2;
	var yy = gui_height - (menu_itemheight * (i * 1.1)) - gui_margin;
	
	scr_text_outline(xx,yy,offset,txt);
	draw_set_color(col);
	draw_text(xx,yy,txt);
}

// Back
draw_set_alpha(1);
draw_set_halign(fa_middle);
draw_set_valign(fa_top);

for (var i = 0; i < menu_items; i++)
{
	var col;
	var txt = menu[i];
	if (menu_cursor == i)
	{	
		txt = string_insert("> ", txt, 0);
		col = c_white;
	}
	else
	{
		col = c_gray;
	}
	var xx = menu_x;
	var yy = menu_y - (menu_itemheight * (i * 1.1));
	
	scr_text_outline(xx,yy,offset,txt);
	draw_set_color(col);
	draw_text(xx,yy,txt);
}