/*----------------------------------------------------------------------------------------------------*-

Автор:
	Fro он же Fro1sha
	
Описание:
	Русский текст в SA:MP
 
Права: 
    Copyright © 2009-2011 TBG
	


                            ______              __________             
                            ___  /______  __    ___  ____/____________ 
                            __  __ \_  / / /    __  /_   __  ___/  __ \
                            _  /_/ /  /_/ /     _  __/   _  /   / /_/ /
                            /_.___/_\__, /      /_/      /_/    \____/ 
                                   /____/                              
                                                                              
																				
           _______________       _________                                              
           ___  __/__  __ )      __  ____/_____ _______ ________________ ___________  __
           __  /  __  __  |_______  / __ _  __ `/_  __ `__ \  _ \_  ___/ __  ___/  / / /
           _  /   _  /_/ /_/_____/ /_/ / / /_/ /_  / / / / /  __/(__  )___  /   / /_/ / 
           /_/    /_____/        \____/  \__,_/ /_/ /_/ /_/\___//____/_(_)_/    \__,_/  
                                                                                        

	http://tb-games.ru/
	
-*----------------------------------------------------------------------------------------------------*/

#if defined _crp_included
	#endinput
#endif
#define _crp_included
#pragma library crp

// -------------------------------------------------------------------------------------*-

native ConvertRusToPwn(const text[], dest[], size = sizeof dest);

// -------------------------------------------------------------------------------------*-

#define CRP ConvertRusToPwn

// -------------------------------------------------------------------------------------*-

native _GameTextForAll(const string[],time,style) = GameTextForAll;
native _GameTextForPlayer(playerid,const string[],time,style) = GameTextForPlayer;
native Menu:_CreateMenu(const title[], columns, Float:x, Float:y, Float:col1width, Float:col2width = 0.0) = CreateMenu;
native _AddMenuItem(Menu:menuid, column, const menutext[]) = AddMenuItem;
native _SetMenuColumnHeader(Menu:menuid, column, const columnheader[]) = SetMenuColumnHeader;
native Text:_TextDrawCreate(Float:x, Float:y, text[]) = TextDrawCreate;
native _TextDrawSetString(Text:text, string[]) = TextDrawSetString;

// -------------------------------------------------------------------------------------*-

stock GameTextForAllRus(string[], time, style) 
{
	new
		buffer[ 256 ]
	;
	
	CRP(string, buffer);
	return GameTextForAll(buffer, time, style);
}

// -------------------------------------------------------------------------------------*-

stock GameTextForPlayerRus(playerid, string[], time, style) 
{
	new
		buffer[ 256 ]
	;
	
	CRP(string, buffer);
	return GameTextForPlayer(playerid, buffer, time, style);
}

// -------------------------------------------------------------------------------------*-

stock Menu:CreateMenuRus(title[], columns, Float:x, Float:y, Float:col1width, Float:col2width = 0.0) 
{
	new
		buffer[ 256 ]
	;
	
	CRP(title, buffer);
	return CreateMenu(buffer, columns, x, y, col1width, col2width);
}

// -------------------------------------------------------------------------------------*-

stock AddMenuItemRus(Menu:menuid, column, menutext[]) 
{
	new
		buffer[ 256 ]
	;
	
	CRP(menutext, buffer);
	return AddMenuItem(menuid, column, buffer);
}

// -------------------------------------------------------------------------------------*-

stock SetMenuColumnHeaderRus(Menu:menuid, column, columnheader[]) 
{
	new
		buffer[ 256 ]
	;
	
	CRP(columnheader, buffer);
	return SetMenuColumnHeader(menuid, column, buffer);
}

// -------------------------------------------------------------------------------------*-

stock Text:TextDrawCreateRus(Float:x, Float:y, text[]) 
{
	new
		buffer[ 256 ]
	;
	
	CRP(text, buffer);
	return TextDrawCreate(x, y, buffer);
}

// -------------------------------------------------------------------------------------*-

stock TextDrawSetStringRus(Text:text, string[]) 
{
	new
		buffer[ 256 ]
	;
	
	CRP(string, buffer);
	return TextDrawSetString(text, buffer);
}

// -------------------------------------------------------------------------------------*-

#define GameTextForAll 			GameTextForAllRus
#define GameTextForPlayer 		GameTextForPlayerRus
#define CreateMenu 				CreateMenuRus
#define AddMenuItem 			AddMenuItemRus
#define SetMenuColumnHeader 	SetMenuColumnHeaderRus
#define TextDrawCreate 			TextDrawCreateRus
#define TextDrawSetString 		TextDrawSetStringRus

// -------------------------------------------------------------------------------------*-