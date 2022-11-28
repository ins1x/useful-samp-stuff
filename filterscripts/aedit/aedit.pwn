#include <a_samp>
#include <YSF>
#if !defined _YSF_included
	#warning Install YSF plugin https://github.com/IllidanS4/YSF
	#warning or use original filterscript https://github.com/Southclaws/samp-attachedit
#endif
#define OUTPUT_FILE "Attachments.txt"

// Southclaw's Attachment Editor Modified to fit the RSC team own needs
// Russian Sawn-off Community [RSC] find us: https://dsc.gg/sawncommunity
// Original: https://github.com/Southclaws/samp-attachedit

enum
{
	DIALOG_MAIN = 7000,
	DIALOG_INDEX_SELECT,
	DIALOG_MODEL_SELECT,
	DIALOG_BONE_SELECT,
	DIALOG_COORD_INPUT,
	DIALOG_POS,
	DIALOG_ROT,
	DIALOG_SCALE,
	DIALOG_DELETE,
	DIALOG_COLOR,
	DIALOG_COPY
}
enum
{
	Float:COORD_X,
	Float:COORD_Y,
	Float:COORD_Z
}
enum
{
	POS_OFFSET_X,
	POS_OFFSET_Y,
	POS_OFFSET_Z,
	ROT_OFFSET_X,
	ROT_OFFSET_Y,
	ROT_OFFSET_Z,
	SCALE_X,
	SCALE_Y,
	SCALE_Z
}


new AttachmentBones[18][15] =
{
	{"Спина"},
	{"Голова"},
	{"Л. плечо"},
	{"Пр. плечо"},
	{"Л. кисть"},
	{"Пр. кисть"},
	{"Л. бедро"},
	{"Пр. бедро"},
	{"Л. стопа"},
	{"Пр. стопа"},
	{"Пр. голень"},
	{"Л. голень"},
	{"Л. предплечье"},
	{"Пр. предплечье"},
	{"Л. ключица"},
	{"Пр. ключица"},
	{"Шея"},
	{"Челюсть"}
};

new
bool:	gEditingAttachments		[MAX_PLAYERS],
		gCurrentAttachIndex		[MAX_PLAYERS],
		gPrevAttachIndex		[MAX_PLAYERS],
bool:	gIndexUsed				[MAX_PLAYERS][MAX_PLAYER_ATTACHED_OBJECTS],
		gIndexModel				[MAX_PLAYERS][MAX_PLAYER_ATTACHED_OBJECTS],
		gIndexBone				[MAX_PLAYERS][MAX_PLAYER_ATTACHED_OBJECTS],
Float:	gIndexPos				[MAX_PLAYERS][MAX_PLAYER_ATTACHED_OBJECTS][3],
Float:	gIndexRot				[MAX_PLAYERS][MAX_PLAYER_ATTACHED_OBJECTS][3],
Float:	gIndexSca				[MAX_PLAYERS][MAX_PLAYER_ATTACHED_OBJECTS][3],
		gCurrentAxisEdit		[MAX_PLAYERS],
		gMaterialcolor1			[MAX_PLAYERS][MAX_PLAYER_ATTACHED_OBJECTS],
		gMaterialcolor2			[MAX_PLAYERS][MAX_PLAYER_ATTACHED_OBJECTS],
		gCammode				[MAX_PLAYERS];


public OnFilterScriptInit()
{
    print("Southclaw's AttachEditor loaded. (RSC Powered)");
	SendClientMessageToAll(-1, "Southclaw's AttachEditor loaded (RSC Powered). type /aedit or press ALT");
	for(new i; i < MAX_PLAYERS; i++)
	{
		gCurrentAttachIndex[i] = 0;
		gIndexModel[i][0] = 18636;

		for(new j; j < MAX_PLAYER_ATTACHED_OBJECTS; j++)
		{
			gIndexUsed[i][j] = false;
			gIndexBone[i][j] = 1;
			gCammode[i] = -1;
			gIndexSca[i][j][COORD_X] = 1.0;
			gIndexSca[i][j][COORD_Y] = 1.0;
			gIndexSca[i][j][COORD_Z] = 1.0;
			gMaterialcolor1[i][j] = -1;
			gMaterialcolor2[i][j] = -1;
		}
	}
}

public OnFilterScriptExit()
{
	for(new i; i < MAX_PLAYERS; i++)
	{
		if(gEditingAttachments[i])
		{
			for(new j; j < MAX_PLAYER_ATTACHED_OBJECTS; j++)
			{
				if(gIndexUsed[i][j])
					RemovePlayerAttachedObject(i, j);
			}
		}
	}
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    if(!strcmp(cmdtext, "/aedit", true))
	{
		if(GetPVarInt(playerid, "Admin") >= 3)
		{
			ShowMainEditMenu(playerid);
		}
		return 1;
	}
	return false;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys == 1024) //ALT
	{
		if(GetPVarInt(playerid, "Admin") >= 3)
		{
			ShowMainEditMenu(playerid);
		}
	}
	return true;
}

ShowMainEditMenu(playerid)
{
	new string[650];
	//new color[24];
	//format(color, 24, "0xFF%x", gMaterialcolor1[playerid][gCurrentAttachIndex[playerid]]);
	//strdel(color, 10, 12);
	
	format(string, sizeof(string),
		"Индекс\t{00FF00}%d\n\
		Объект\t{00FF00}%d\n\
		Кость\t{00FF00}%d (%s)\n\
		Позиция\t%.4f, %.4f, %.4f \n\
		Вращение\t%.4f, %.4f, %.4f \n\
		Масштаб\t%.4f, %.4f, %.4f \n\
		Цвет\t%x\n\
		Редактировать\t\n\
		Предпросмотр\t\n\
		Очистить\t\n\
		Копировать текущий индекс\t\n\
		Сохранить текущий индекс\t\n\
		Сохранить все индексы\t\n",
		gCurrentAttachIndex[playerid],
		gIndexModel[playerid][gCurrentAttachIndex[playerid]],
		gIndexBone[playerid][gCurrentAttachIndex[playerid]],
		AttachmentBones[gIndexBone[playerid][gCurrentAttachIndex[playerid]]-1],
		gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_X],
		gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Y],
		gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Z],
		gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_X],
		gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Y],
		gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Z],
		gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_X],
		gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Y],
		gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Z],
		gMaterialcolor1[playerid][gCurrentAttachIndex[playerid]]);

	ShowPlayerDialog(playerid, DIALOG_MAIN, DIALOG_STYLE_TABLIST,
	"Редактор прикрепления / Главное меню", string, "OK", "Отмена");

	gEditingAttachments[playerid] = true;
}

ShowIndexList(playerid)
{
	new string[512];

	for(new i; i < MAX_PLAYER_ATTACHED_OBJECTS; i++)
	{
		if(IsPlayerAttachedObjectSlotUsed(playerid, i))
		{
			if(gIndexUsed[playerid][i]) format(string, sizeof(string), "%sСлот %d (%s - %d)\n", string, i, AttachmentBones[gIndexBone[playerid][i]-1], gIndexModel[playerid][i]);
			else format(string, sizeof(string), "%sСлот %d (Внешний)\n", string, i);
		}
		else format(string, sizeof(string), "%sСлот %d\n", string, i);
	}

	ShowPlayerDialog(playerid, DIALOG_INDEX_SELECT, DIALOG_STYLE_LIST,
	"Редактор прикрепления / Индекс", string, "OK", "Отмена");
}

ShowCopyIndexList(playerid)
{
	new string[512];

	for(new i; i < MAX_PLAYER_ATTACHED_OBJECTS; i++)
	{
		if(IsPlayerAttachedObjectSlotUsed(playerid, i))
		{
			if(gIndexUsed[playerid][i]) format(string, sizeof(string), "%sСлот %d (%s - %d)\n", string, i, AttachmentBones[gIndexBone[playerid][i]-1], gIndexModel[playerid][i]);
			else format(string, sizeof(string), "%sСлот %d (Внешний)\n", string, i);
		}
		else format(string, sizeof(string), "%sСлот %d\n", string, i);
	}

	ShowPlayerDialog(playerid, DIALOG_COPY, DIALOG_STYLE_LIST,
	"Редактор прикрепления / Копировать в", string, "OK", "Отмена");
}

ShowModelInput(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_MODEL_SELECT, DIALOG_STYLE_INPUT,
	"Редактор прикрепления / Объект", "Введите объект для прикрепления",
	"OK", "Отмена");
}

ShowBoneList(playerid)
{
	new string[512];

	for(new i; i < sizeof(AttachmentBones); i++) {
		format(string, sizeof(string), "%s%s\n", string, AttachmentBones[i]);
	}
	ShowPlayerDialog(playerid, DIALOG_BONE_SELECT, DIALOG_STYLE_LIST,
	"Редактор прикрепления / Кость", string, "OK", "Отмена");
}

EditCoord(playerid, coord)
{
	gCurrentAxisEdit[playerid] = coord;
	ShowPlayerDialog(playerid, DIALOG_COORD_INPUT, DIALOG_STYLE_INPUT,
	"Редактор прикрепления / Смещение", "Введите float-точку для смещения:", "OK", "Отмена");
}

EditAttachment(playerid)
{
	SetPlayerAttachedObject(playerid,
	gCurrentAttachIndex[playerid],
	gIndexModel[playerid][gCurrentAttachIndex[playerid]],
	gIndexBone[playerid][gCurrentAttachIndex[playerid]],
	gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_X],
	gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Y],
	gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Z],
	gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_X],
	gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Y],
	gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Z],
	gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_X],
	gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Y],
	gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Z]);

	EditAttachedObject(playerid, gCurrentAttachIndex[playerid]);

	gIndexUsed[playerid][gCurrentAttachIndex[playerid]] = true;
}

RemoveCurrentIndex(playerid, all = false)
{
	if(all)
	{
		for(new i; i < MAX_PLAYER_ATTACHED_OBJECTS; i++)
		{
			gIndexModel[playerid][i] = 0;
			gIndexBone[playerid][i] = 1;
			gIndexPos[playerid][i][COORD_X] = 0.0;
			gIndexPos[playerid][i][COORD_Y] = 0.0;
			gIndexPos[playerid][i][COORD_Z] = 0.0;
			gIndexRot[playerid][i][COORD_X] = 0.0;
			gIndexRot[playerid][i][COORD_Y] = 0.0;
			gIndexRot[playerid][i][COORD_Z] = 0.0;
			gIndexSca[playerid][i][COORD_X] = 1.0;
			gIndexSca[playerid][i][COORD_Y] = 1.0;
			gIndexSca[playerid][i][COORD_Z] = 1.0;
			gIndexUsed[playerid][i] = false;
			RemovePlayerAttachedObject(playerid, i);
		}
	} else {
		gIndexModel[playerid][gCurrentAttachIndex[playerid]] = 0;
		gIndexBone[playerid][gCurrentAttachIndex[playerid]] = 1;
		gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_X] = 0.0;
		gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Y] = 0.0;
		gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Z] = 0.0;
		gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_X] = 0.0;
		gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Y] = 0.0;
		gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Z] = 0.0;
		gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_X] = 1.0;
		gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Y] = 1.0;
		gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Z] = 1.0;
		gIndexUsed[playerid][gCurrentAttachIndex[playerid]] = false;

		RemovePlayerAttachedObject(playerid, gCurrentAttachIndex[playerid]);
	}
	ShowMainEditMenu(playerid);
}

SaveAttachedObjects(playerid, all = false)
{
	new str[256], File:file;
	if(!fexist(OUTPUT_FILE)) file = fopen(OUTPUT_FILE, io_write);
	else file = fopen(OUTPUT_FILE, io_append);
	
	new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name)); 
    
	if(!file)
	{
		print("Ошибка открытия файла "OUTPUT_FILE"");
		return 0;
	}
	
	if(all)
	{
		format(str, 64, "// group export. %s. skinid: %d\r\n", name, GetPlayerSkin(playerid));
		fwrite(file, str);
		for(new i=0; i<MAX_PLAYER_ATTACHED_OBJECTS; i++)
		{
			if(IsPlayerAttachedObjectSlotUsed(playerid, i)) {
				format(str, 256,
				"SetPlayerAttachedObject(playerid, %d, %d, %d, %f, %f, %f, \
				%f, %f, %f,  %f, %f, %f); // %d\r\n",
				i,
				gIndexModel[playerid][i],
				gIndexBone[playerid][i],
				gIndexPos[playerid][i][COORD_X],
				gIndexPos[playerid][i][COORD_Y],
				gIndexPos[playerid][i][COORD_Z],
				gIndexRot[playerid][i][COORD_X],
				gIndexRot[playerid][i][COORD_Y],
				gIndexRot[playerid][i][COORD_Z],
				gIndexSca[playerid][i][COORD_X],
				gIndexSca[playerid][i][COORD_Y],
				gIndexSca[playerid][i][COORD_Z],
				gIndexModel[playerid][i]);
				fwrite(file, str);
			}
		}
		fwrite(file, "// group export end \r\n");
		fclose(file);
	} else {
		format(str, 64, "// %s. skinid: %d\r\n", name, GetPlayerSkin(playerid));
		fwrite(file, str);
		format(str, 256,
		"SetPlayerAttachedObject(playerid, %d, %d, %d, %f, %f, %f, \
		%f, %f, %f,  %f, %f, %f); // %d\r\n",
		gCurrentAttachIndex[playerid],
		gIndexModel[playerid][gCurrentAttachIndex[playerid]],
		gIndexBone[playerid][gCurrentAttachIndex[playerid]],
		gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_X],
		gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Y],
		gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Z],
		gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_X],
		gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Y],
		gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Z],
		gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_X],
		gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Y],
		gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Z],
		gIndexModel[playerid][gCurrentAttachIndex[playerid]]);
		fwrite(file, str);
		fclose(file);
	}

	ShowMainEditMenu(playerid);

	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_MAIN)
	{
		if(response)
		{
			new string[256];
			
			switch(listitem)
			{
				case 00:ShowIndexList(playerid);
				case 01:ShowModelInput(playerid);
				case 02:ShowBoneList(playerid);
				case 03:
				{
					format(string, sizeof(string),
					"X-позиция\t(%.4f)\n\
					Y-позиция\t(%.4f)\n\
					Z-позиция\t(%.4f)\n",
					gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_X],
					gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Y],
					gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Z]);
					
					ShowPlayerDialog(playerid, DIALOG_POS, DIALOG_STYLE_TABLIST,
					"Редактор прикрепления", string, "OK", "Отмена");
				}
				case 04:
				{
					format(string, sizeof(string),
					"X-вращение\t(%.4f)\n\
					Y-вращение\t(%.4f)\n\
					Z-вращение\t(%.4f)\n",
					gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_X],
					gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Y],
					gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Z]);
					
					ShowPlayerDialog(playerid, DIALOG_ROT, DIALOG_STYLE_TABLIST,
					"Редактор прикрепления", string, "OK", "Отмена");
				}
				case 05:
				{
					format(string, sizeof(string),
					"X-масштаб\t(%.4f)\n\
					Y-масштаб\t(%.4f)\n\
					Z-масштаб\t(%.4f)\n",
					gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_X],
					gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Y],
					gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Z]);
					
					ShowPlayerDialog(playerid, DIALOG_SCALE, DIALOG_STYLE_TABLIST,
					"Редактор прикрепления", string, "OK", "Отмена");
				}
				case 06:
				{
					ShowMainEditMenu(playerid);
					//ShowPlayerDialog(playerid, DIALOG_COLOR, DIALOG_STYLE_INPUT,
					//"Редактор прикрепления / Цвет", 
					//"Введите цвет в формате RGB. Например (FF00FF)\n", 
					//"OK", "Отмена");
				}
				case 07:EditAttachment(playerid);
				case 08:
				{
					if(gCammode[playerid] != -1)
					{
						SetCameraBehindPlayer(playerid);
						gCammode[playerid] = -1;
					} else {
						new Float:X, Float:Y, Float:Z;
						GetPlayerPos(playerid, X , Y , Z);
						SetPlayerCameraPos(playerid, X-5, Y-5, Z+0.6); 
						SetPlayerCameraLookAt(playerid, X, Y, Z+0.6);
						gCammode[playerid] = 1;
					}
				}
				case 09:
				{
					ShowPlayerDialog(playerid, DIALOG_DELETE, DIALOG_STYLE_LIST,
					"Редактор прикрепления","Удалить этот индекс\nОчистить все индексы", "OK", "Отмена");
				}
				case 10:ShowCopyIndexList(playerid);
				case 11:SaveAttachedObjects(playerid);
				case 12:SaveAttachedObjects(playerid, true);
			}
		}
	}
	if(dialogid == DIALOG_INDEX_SELECT)
	{
		if(response)
		{
			gCurrentAttachIndex[playerid] = listitem;
			#if defined _YSF_included
			// Load external object
	 		if(IsPlayerAttachedObjectSlotUsed(playerid, listitem) && !gIndexUsed[playerid][listitem])
			{
				new Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ;
				new Float:fRotX, Float:fRotY, Float:fRotZ;
				new Float:fScaleX, Float:fScaleY, Float:fScaleZ;
				new modelid, bone, materialcolor1, materialcolor2;
				GetPlayerAttachedObject(playerid, listitem, modelid, bone, fOffsetX, fOffsetY, fOffsetZ,
				fRotX, fRotY, fRotZ, fScaleX, fScaleY, fScaleZ, materialcolor1, materialcolor2);
				
				//GetPlayerObjectPos(objectid, fOffsetX, fOffsetX, fOffsetX);
				//GetPlayerObjectRot(objectid, fRotX, fRotY, fRotZ);
				
				gIndexModel[playerid][gCurrentAttachIndex[playerid]] = modelid;
				gIndexBone[playerid][gCurrentAttachIndex[playerid]] = bone;
				gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_X] = fOffsetX;
				gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Y] = fOffsetY;
				gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Z] = fOffsetZ;
				gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_X] = fRotX;
				gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Y] = fRotY;
				gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Z] = fRotZ;
				gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_X] = fScaleX;
				gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Y] = fScaleY;
				gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Z] = fScaleZ;
				if(materialcolor1) {
					gMaterialcolor1[playerid][gCurrentAttachIndex[playerid]] = materialcolor1;
					//printf("0xFF%.6x", materialcolor1);
				}
				if(materialcolor2) {
					gMaterialcolor2[playerid][gCurrentAttachIndex[playerid]] = materialcolor2;
				}
			}
			#endif
			ShowMainEditMenu(playerid);
		}
		else ShowMainEditMenu(playerid);

		return 1;
	}
	if(dialogid == DIALOG_MODEL_SELECT)
	{
		if(response)
		{
			gIndexModel[playerid][gCurrentAttachIndex[playerid]] = strval(inputtext);
			ShowMainEditMenu(playerid);
		}
		else ShowMainEditMenu(playerid);
	}

	if(dialogid == DIALOG_BONE_SELECT)
	{
		if(response)
		{
			gIndexBone[playerid][gCurrentAttachIndex[playerid]] = listitem + 1;
			ShowMainEditMenu(playerid);
		}
		else ShowMainEditMenu(playerid);
	}
	if(dialogid == DIALOG_COORD_INPUT)
	{
		if(response)
		{
			new Float:value = floatstr(inputtext);

			switch(gCurrentAxisEdit[playerid])
			{
				case POS_OFFSET_X:  gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_X] = value;
				case POS_OFFSET_Y:  gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Y] = value;
				case POS_OFFSET_Z:  gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Z] = value;
				case ROT_OFFSET_X:  gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_X] = value;
				case ROT_OFFSET_Y:  gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Y] = value;
				case ROT_OFFSET_Z:  gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Z] = value;
				case SCALE_X:       gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_X] = value;
				case SCALE_Y:       gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Y] = value;
				case SCALE_Z:       gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Z] = value;
			}

			SetPlayerAttachedObject(playerid,
			gCurrentAttachIndex[playerid],
			gIndexModel[playerid][gCurrentAttachIndex[playerid]],
			gIndexBone[playerid][gCurrentAttachIndex[playerid]],
			gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_X],
			gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Y],
			gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Z],
			gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_X],
			gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Y],
			gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Z],
			gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_X],
			gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Y],
			gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Z]);
		}
		ShowMainEditMenu(playerid);
	}
	if(dialogid == DIALOG_POS)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:EditCoord(playerid, POS_OFFSET_X);
				case 1:EditCoord(playerid, POS_OFFSET_Y);
				case 2:EditCoord(playerid, POS_OFFSET_Z);
			}
		}
		else ShowMainEditMenu(playerid);
	}
	if(dialogid == DIALOG_ROT)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:EditCoord(playerid, ROT_OFFSET_X);
				case 1:EditCoord(playerid, ROT_OFFSET_Y);
				case 2:EditCoord(playerid, ROT_OFFSET_Z);
			}
		}
		else ShowMainEditMenu(playerid);
	}
	if(dialogid == DIALOG_SCALE)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:EditCoord(playerid, SCALE_X);
				case 1:EditCoord(playerid, SCALE_Y);
				case 2:EditCoord(playerid, SCALE_Z);
			}
		}
		else ShowMainEditMenu(playerid);
	}
	if(dialogid == DIALOG_DELETE)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:RemoveCurrentIndex(playerid);
				case 1:RemoveCurrentIndex(playerid, true);
			}
		}
		ShowMainEditMenu(playerid);
	}
	if(dialogid == DIALOG_COLOR)
	{
		if(response)
		{
			//new color;
			//color = strval(inputtext);
			//color = RGBtoRGBA(HexToInt2(inputtext), 0xFF);
			//if(IsPlayerAttachedObjectSlotUsed(playerid, listitem) && !gIndexUsed[playerid][listitem])
			//{
				//return SendClientMessage(playerid, -1, "Внешний аттач должен быть сперва отредактирован!");
			//}
			//if(strlen(inputtext) == 6)
			//{
				//format(gMaterialcolor1[playerid][gCurrentAttachIndex[playerid]], 9, "%xFF", strval(inputtext));
				//gMaterialcolor1[playerid][gCurrentAttachIndex[playerid]] = color;
				//print(gMaterialcolor1[playerid][gCurrentAttachIndex[playerid]]);
				//EditAttachment(playerid);
			//}
		}
	}
	if(dialogid == DIALOG_COPY)
	{
		if(response)
		{
			if(gIndexUsed[playerid][listitem]) 
			{
				ShowCopyIndexList(playerid);
				return SendClientMessage(playerid, -1, "Этот индекс уже использован");
			}
			gPrevAttachIndex[playerid] = gCurrentAttachIndex[playerid];
			gCurrentAttachIndex[playerid] = listitem;
			gIndexModel[playerid][gCurrentAttachIndex[playerid]] = 
			gIndexModel[playerid][gPrevAttachIndex[playerid]];
			gIndexBone[playerid][gCurrentAttachIndex[playerid]] = 
			gIndexBone[playerid][gPrevAttachIndex[playerid]];
			gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_X] = 
			gIndexPos[playerid][gPrevAttachIndex[playerid]][COORD_X];
			gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Y] = 
			gIndexPos[playerid][gPrevAttachIndex[playerid]][COORD_Y];
			gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Z] = 
			gIndexPos[playerid][gPrevAttachIndex[playerid]][COORD_Z];
			gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_X] = 
			gIndexRot[playerid][gPrevAttachIndex[playerid]][COORD_X];
			gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Y] = 
			gIndexRot[playerid][gPrevAttachIndex[playerid]][COORD_Y];
			gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Z] =
			gIndexRot[playerid][gPrevAttachIndex[playerid]][COORD_Z];
			gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_X] =
			gIndexSca[playerid][gPrevAttachIndex[playerid]][COORD_X];
			gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Y] =
			gIndexSca[playerid][gPrevAttachIndex[playerid]][COORD_Y];
			gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Z] =
			gIndexSca[playerid][gPrevAttachIndex[playerid]][COORD_Z];
			
			EditAttachment(playerid);
		}
	}
	return 1;
}

public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
	if(response)
    {
		gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_X] = fOffsetX;
		gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Y] = fOffsetY;
		gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Z] = fOffsetZ;
		gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_X] = fRotX;
		gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Y] = fRotY;
		gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Z] = fRotZ;
		gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_X] = fScaleX;
		gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Y] = fScaleY;
		gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Z] = fScaleZ;
		
		ShowMainEditMenu(playerid);
		
		//if(gMaterialcolor1[playerid][index])
		//{
			//SetPlayerAttachedObject(playerid, index, modelid, boneid, fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, fScaleX, fScaleY, fScaleZ,	gMaterialcolor1[playerid][index]);
		//} else {
		SetPlayerAttachedObject(playerid, index, modelid, boneid, fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, fScaleX, fScaleY, fScaleZ);
		//}
	} else {
		SetPlayerAttachedObject(playerid, index, modelid, boneid,
		gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_X],
		gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Y],
		gIndexPos[playerid][gCurrentAttachIndex[playerid]][COORD_Z],
		gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_X],
		gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Y],
		gIndexRot[playerid][gCurrentAttachIndex[playerid]][COORD_Z],
		gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_X], 
		gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Y],
		gIndexSca[playerid][gCurrentAttachIndex[playerid]][COORD_Z]);
	}
	return 1;
}
