/* 
Filterscript: vae
Description: Vehicle attachements editor
Based on Insanity Vehicle Attachment Editor
Original fs: https://github.com/Southclaws/samp-Hellfire/blob/master/filterscripts/tool_VehicleAttach.pwn
Improved and translated specifically for RSC server https://dsc.gg/sawncommunity
*/

#include <a_samp>
#define OUTPUT_FILE "Vaeditions.txt"
#define FILTERSCRIPT

#define DIALOG_VAE					6000
#define DIALOG_VAENEW				6001
	
enum playerSets
{
	Float:OffSetX,
	Float:OffSetY,
	Float:OffSetZ,
	Float:OffSetRX,
	Float:OffSetRY,
	Float:OffSetRZ,
	obj,
	EditStatus,
	bool: delay,
	lr,
	VehicleID,
	objmodel,
	timer
}

new Float:VaeData[MAX_PLAYERS][playerSets];
new PlayerVehicle[MAX_PLAYERS];
const vaeFloatX =  1;
const vaeFloatY =  2;
const vaeFloatZ =  3;
const vaeFloatRX = 4;
const vaeFloatRY = 5;
const vaeFloatRZ = 6;
const vaeModel   = 7;
forward VaeUnDelay(target); // vae delay timer
forward VaeGetKeys(playerid); // vae keys hook

public OnFilterScriptInit()
{
	print("Vehicle Attach Editor loaded. (VAE)");
	SendClientMessageToAll(-1, "Vehicle Attach Editor loaded. (VAE). type /vae or press ALT");
}

public OnFilterScriptExit()
{
	for(new i = 0; i < MAX_PLAYERS; ++i) DestroyObject(VaeData[i][obj]);
	return 1;
}

public OnPlayerConnect(playerid)
{
    SetPVarInt(playerid, "freezed", 0);
	
	VaeData[playerid][timer] = -1;
	VaeData[playerid][obj] =  -1;
    return 1;
}

strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

public OnPlayerCommandText(playerid, cmdtext[])
{  
	new cmd[128], tmp[128], idx;
	cmd = strtok(cmdtext, idx);
	if(!strcmp("/vae", cmd, true))
	{
		// if no object selected
		if(VaeData[playerid][obj] == -1)
		{
			ShowPlayerDialog(playerid, DIALOG_VAENEW, DIALOG_STYLE_INPUT,
			"VAE New attach", 
			"specify the object model to attach to the vehicle.\
			(For example minigun: 362)\nEnter model id:", ">>>","Cancel");
		} else {
			ShowVaeMenu(playerid);
		}
		return true;
	}
	if(!strcmp("/vaestop", cmd, true))
	{
		KillTimer(VaeData[playerid][timer]);
		return SendClientMessageEx(playerid, -1,
		"Редактирование закончено.", "Editing is complete");
	}
	if(!strcmp("/vaesave", cmd, true))
	{		
		tmp = strtok(cmdtext, idx);
		new str[256], File: file;
		if(!fexist(OUTPUT_FILE)) file = fopen(OUTPUT_FILE, io_write);
		else file = fopen(OUTPUT_FILE, io_append);
		format(str, 256, "\r\nAttachObjectToVehicle(objectid, vehicleid, %f, %f, %f, %f, %f, %f); //Object Model: %d | %s",
		VaeData[playerid][OffSetX], VaeData[playerid][OffSetY], VaeData[playerid][OffSetZ],
		VaeData[playerid][OffSetRX], VaeData[playerid][OffSetRY], VaeData[playerid][OffSetRZ],
		VaeData[playerid][objmodel], tmp);
		fwrite(file, str);
		fclose(file);
		return SendClientMessageEx(playerid, -1,
		"Всё сохранено в \""OUTPUT_FILE"\".", "Saved to \""OUTPUT_FILE"\".");
	}
	if(!strcmp("/vaemodel", cmd, true))
	{
		//VaeData[playerid][EditStatus] = vaeModel;
		SendClientMessage(playerid, -1, "Editing Object Model.");
		ShowPlayerDialog(playerid, DIALOG_VAENEW, DIALOG_STYLE_INPUT,
		"VAE New attach", "specify the object model to attach to the vehicle.\
		(For example minigun: 362)\nEnter model id:", ">>>","Cancel");
	}
	return 0;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(GetPVarInt(playerid, "VaeEdit") > 0)
	{
		if(newkeys == KEY_SECONDARY_ATTACK) // ENTER
		{
			TogglePlayerControllable(playerid, false);
			SetPVarInt(playerid, "freezed", 1);
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) {
				PutPlayerInVehicle(playerid, PlayerVehicle[playerid], 0);
			}
			ShowVaeMenu(playerid);
		}
	}
	if(newkeys == 1024) //ALT
	{
		ShowVaeMenu(playerid);
	}
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_VAE)
	{	
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					//VaeData[playerid][EditStatus] = vaeModel;
					if (GetPVarInt(playerid, "lang") == 0)
					{
						ShowPlayerDialog(playerid, DIALOG_VAENEW, DIALOG_STYLE_INPUT,
						"VAE New attach",
						"Введите ID модели объекта для прикрепления на транспорт.\
						(Например minigun: 362)\nВведите ID:",
						">>>","Cancel");
					} else {
						ShowPlayerDialog(playerid, DIALOG_VAENEW, DIALOG_STYLE_INPUT,
						"VAE New attach",
						"specify the object model to attach to the vehicle.\
						(For example minigun: 362)\nEnter model id:",
						">>>","Cancel");
					}
					//SendClientMessage(playerid, -1, "Editing Object Model.");
				}
				case 1:
				{
					VaeData[playerid][EditStatus] = vaeFloatX;
					SendClientMessageEx(playerid, -1,
					"Редактирование оси X.","X axis editing.");
				}
				case 2:
				{
					VaeData[playerid][EditStatus] = vaeFloatY;
					SendClientMessageEx(playerid, -1,
					"Редактирование оси Y.","Y axis editing.");
				}
				case 3:
				{
					VaeData[playerid][EditStatus] = vaeFloatZ;
					SendClientMessageEx(playerid, -1,
					"Редактирование оси Z.", "Z axis editing.");
				}
				case 4:
				{
					VaeData[playerid][EditStatus] = vaeFloatRX;
					SendClientMessageEx(playerid, -1,
					"Редактирование оси RX.", "RX axis editing.");
				}
				case 5:
				{
					VaeData[playerid][EditStatus] = vaeFloatRY;
					SendClientMessageEx(playerid, -1,
					 "Редактирование оси RY.", "RY axis editing.");
				}
				case 6:
				{
					VaeData[playerid][EditStatus] = vaeFloatRZ;
					SendClientMessageEx(playerid, -1,
					"Редактирование оси RZ.", "RZ axis editing.");
				}
				case 7:
				{
					VaeData[playerid][OffSetX]  = 0.0;
					VaeData[playerid][OffSetY]  = 0.0;
					VaeData[playerid][OffSetZ]  = 0.0;
					VaeData[playerid][OffSetRX] = 0.0;
					VaeData[playerid][OffSetRY] = 0.0;
					VaeData[playerid][OffSetRZ] = 0.0;
					SendClientMessageEx(playerid, -1,
					"Значения XYZ и осей сброшены", "Reset XYZ and adjustment");
					ShowVaeMenu(playerid);
				}
				case 8:
				{
					if(GetPVarInt(playerid, "freezed") > 0)
					{
						TogglePlayerControllable(playerid, true);
						SetPVarInt(playerid,"freezed",0);
						SendClientMessageEx(playerid, -1,
						"Вы размороженны","You are unfreezed");
					} else {
						TogglePlayerControllable(playerid, false);
						SetPVarInt(playerid,"freezed",1);
						SendClientMessageEx(playerid, -1,
						"Вы замороженны","You are freezed");
					}
				}
				case 9:
				{
					KillTimer(VaeData[playerid][timer]);
					TogglePlayerControllable(playerid, true);
					SetPVarInt(playerid,"freezed",0);
					DeletePVar(playerid, "VaeEdit");
					SendClientMessageEx(playerid, -1,
					"Редактирование закончено.", "Finish vae edit");
				}
				case 10:
				{
					new str[256], File:file;
					if(!fexist(OUTPUT_FILE)) file = fopen(OUTPUT_FILE, io_write);
					else file = fopen(OUTPUT_FILE, io_append);
					format(str, 200, "\r\nAttachObjectToVehicle(objectid, vehicleid, %f, %f, %f, %f, %f, %f); //Object Model: %d | %s",
					VaeData[playerid][OffSetX], VaeData[playerid][OffSetY],
					VaeData[playerid][OffSetZ],	VaeData[playerid][OffSetRX],
					VaeData[playerid][OffSetRY], VaeData[playerid][OffSetRZ],
					VaeData[playerid][objmodel]);
					fwrite(file, str);
					fclose(file);
					return SendClientMessageEx(playerid, -1,
					"Всё сохранено в \""OUTPUT_FILE"\".", "Saved to \""OUTPUT_FILE"\".");
				}
			}
		}
	}
	if(dialogid == DIALOG_VAENEW)
	{
		if(response)
		{
			if(strlen(inputtext) > 1 && strval(inputtext) != INVALID_OBJECT_ID)
			{
				if(!IsPlayerInAnyVehicle(playerid)) {
					 return SendClientMessageEx(playerid, -1,
					"Вы не в машине.","You are not in the car.");
				}
				if(VaeData[playerid][timer] != -1) KillTimer(VaeData[playerid][timer]);
				if(IsValidObject(VaeData[playerid][obj])) DestroyObject(VaeData[playerid][obj]);
				
				if(VaeData[playerid][obj] == -1)
				{
					SendClientMessageEx(playerid, -1, 
					"Используйте клавиши {FF0000}ВЛЕВО-ВПРАВО{FFFFFF} для перемещения аттача",
					"Use keys {FF0000}LEFT - RIGHT{FFFFFF} to move attach");
					SendClientMessageEx(playerid, -1, 
					"Удерживайте {FF0000}F / ENTER{FFFFFF} для того чтобы показать меню редактирования",
					"Hold {FF0000}F / ENTER{FFFFFF} to show the edit menu");
				}
			
				if(VaeData[playerid][timer] != -1) KillTimer(VaeData[playerid][timer]);
				if(IsValidObject(VaeData[playerid][obj])) DestroyObject(VaeData[playerid][obj]);	
				new Obj = CreateObject(strval(inputtext), 0.0, 0.0, -10.0, -50.0, 0, 0, 0);
				new vId = GetPlayerVehicleID(playerid);
				AttachObjectToVehicle(Obj, vId, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
				VaeData[playerid][timer] = SetTimerEx("VaeGetKeys", 30, true, "i", playerid);
				VaeData[playerid][EditStatus] = vaeFloatX;
				VaeData[playerid][VehicleID] = vId;		
				VaeData[playerid][objmodel] = strval(inputtext);
				if(Obj != VaeData[playerid][obj])
				{
					VaeData[playerid][OffSetX]  = 0.0;
					VaeData[playerid][OffSetY]  = 0.0;
					VaeData[playerid][OffSetZ]  = 0.0;
					VaeData[playerid][OffSetRX] = 0.0;
					VaeData[playerid][OffSetRY] = 0.0;
					VaeData[playerid][OffSetRZ] = 0.0;
				}	
				VaeData[playerid][obj] = Obj;
				TogglePlayerControllable(playerid, false);
				SetPVarInt(playerid,"freezed",1);
				SetPVarInt(playerid, "VaeEdit",1);
				ShowVaeMenu(playerid);
				GameTextForPlayer(playerid,"~w~HOLD ENTER~n~to open edit menu",5000,1);
			}
		} 
	}
	return 1;
}

stock ShowVaeMenu(playerid)
{
	new tbtext[500];
	new header[64];
	
	if(VaeData[playerid][objmodel] != -1)
	{
		format(header, sizeof(header),"[VAE] - Vehicle Attachments Editor - modelid: %i",
		VaeData[playerid][objmodel]);
	}
	else format(header, sizeof(header),"[VAE] - Vehicle Attachments Editor");
	
	if(GetPVarInt(playerid, "lang") == 1)
	{		
		format(tbtext, sizeof(tbtext),
		"Change model\t{00FF00}/vaemodel\n"\
		"adjustment X\t%.2f\n"\
		"adjustment Y\t%.2f\n"\
		"adjustment Z\t%.2f\n"\
		"adjustment RX\t%.2f\n"\
		"adjustment RY\t%.2f\n"\
		"adjustment RZ\t%.2f\n"\
		"Reset XYZ and adjustment\t\n"\
		"Freeze-Unfreeze\t{00FF00}/freeze\n"\
		"Stop edit\t{00FF00}/vaestop\n"\
		"Save\t{00FF00}/vaesave\n",
		VaeData[playerid][OffSetX], VaeData[playerid][OffSetY], VaeData[playerid][OffSetZ],
		VaeData[playerid][OffSetRX], VaeData[playerid][OffSetRY], VaeData[playerid][OffSetRZ]);
	} else {
		format(tbtext, sizeof(tbtext),
		"Изменить модель\t{00FF00}/vaemodel\n"\
		"Регулировка оси X\t%.2f\n"\
		"Регулировка оси Y\t%.2f\n"\
		"Регулировка оси Z\t%.2f\n"\
		"Регулировка оси RX\t%.2f\n"\
		"Регулировка оси RY\t%.2f\n"\
		"Регулировка оси RZ\t%.2f\n"\
		"Сбросить XYZ и Оси\t\n"\
		"Заморозить-Разморозить\t{00FF00}/freeze\n"\
		"Закончить редактирование\t{00FF00}/vaestop\n"\
		"Сохранить\t{00FF00}/vaesave\n",
		VaeData[playerid][OffSetX], VaeData[playerid][OffSetY], VaeData[playerid][OffSetZ],
		VaeData[playerid][OffSetRX], VaeData[playerid][OffSetRY], VaeData[playerid][OffSetRZ]);
	}
	
	ShowPlayerDialog(playerid, DIALOG_VAE, DIALOG_STYLE_TABLIST, 
	header,tbtext, "Select","Cancel");
}

public VaeGetKeys(playerid)
{
	new Keys, ud, gametext[36], Float: toAdd;
	
    GetPlayerKeys(playerid,Keys,ud,VaeData[playerid][lr]);    
	switch(Keys)
	{
		case KEY_FIRE:   toAdd = 0.000500;		
		default:         toAdd = 0.005000;
	}	
    if(VaeData[playerid][lr] == 128)
    {
        switch(VaeData[playerid][EditStatus])
        {
            case vaeFloatX:
            {
                VaeData[playerid][OffSetX] = floatadd(VaeData[playerid][OffSetX], toAdd);
                format(gametext, 36, "offsetx: ~w~%f", VaeData[playerid][OffSetX]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatY:
            {
                VaeData[playerid][OffSetY] = floatadd(VaeData[playerid][OffSetY], toAdd);
                format(gametext, 36, "offsety: ~w~%f", VaeData[playerid][OffSetY]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatZ:
            {
                VaeData[playerid][OffSetZ] = floatadd(VaeData[playerid][OffSetZ], toAdd);
                format(gametext, 36, "offsetz: ~w~%f", VaeData[playerid][OffSetZ]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRX:
            {
				if(Keys == 0) VaeData[playerid][OffSetRX] = floatadd(VaeData[playerid][OffSetRX],
				floatadd(toAdd, 1.000000));	
				else VaeData[playerid][OffSetRX] = floatadd(VaeData[playerid][OffSetRX],
				floatadd(toAdd,0.100000));					                			
                format(gametext, 36, "offsetrx: ~w~%f", VaeData[playerid][OffSetRX]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRY:
            {
            	if(Keys == 0) VaeData[playerid][OffSetRY] = floatadd(VaeData[playerid][OffSetRY],
				floatadd(toAdd, 1.000000));	
				else VaeData[playerid][OffSetRY] = floatadd(VaeData[playerid][OffSetRY],
				floatadd(toAdd,0.100000));	
            	format(gametext, 36, "offsetry: ~w~%f", VaeData[playerid][OffSetRY]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRZ:
            {
                if(Keys == 0) VaeData[playerid][OffSetRZ] = floatadd(VaeData[playerid][OffSetRZ],
				floatadd(toAdd, 1.000000));	
				else VaeData[playerid][OffSetRZ] = floatadd(VaeData[playerid][OffSetRZ],
				floatadd(toAdd,0.100000));	
                format(gametext, 36, "offsetrz: ~w~%f", VaeData[playerid][OffSetRZ]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeModel:
            {
                SetTimerEx("VaeUnDelay", 1000, false, "d", playerid);
                if(VaeData[playerid][delay]) return 1;
                DestroyObject(VaeData[playerid][obj]);
                VaeData[playerid][obj] = CreateObject(VaeData[playerid][objmodel]++,
				0.0, 0.0, -10.0, -50.0, 0, 0, 0);
                format(gametext, 36, "model: ~w~%d", VaeData[playerid][objmodel]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
				VaeData[playerid][delay] = true;
            }
		}
		AttachObjectToVehicle(VaeData[playerid][obj], VaeData[playerid][VehicleID],
		VaeData[playerid][OffSetX], VaeData[playerid][OffSetY], VaeData[playerid][OffSetZ],
		VaeData[playerid][OffSetRX], VaeData[playerid][OffSetRY], VaeData[playerid][OffSetRZ]);
	}
	else if(VaeData[playerid][lr] == -128)
	{
	    switch(VaeData[playerid][EditStatus])
        {
            case vaeFloatX:
            {
                VaeData[playerid][OffSetX] = floatsub(VaeData[playerid][OffSetX], toAdd);
                format(gametext, 36, "offsetx: ~w~%f", VaeData[playerid][OffSetX]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatY:
            {
                VaeData[playerid][OffSetY] = floatsub(VaeData[playerid][OffSetY], toAdd);
                format(gametext, 36, "offsety: ~w~%f", VaeData[playerid][OffSetY]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatZ:
            {
                VaeData[playerid][OffSetZ] = floatsub(VaeData[playerid][OffSetZ], toAdd);
                format(gametext, 36, "offsetz: ~w~%f", VaeData[playerid][OffSetZ]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRX:
            {
				if(Keys == 0) VaeData[playerid][OffSetRX] = floatsub(VaeData[playerid][OffSetRX],
				floatadd(toAdd, 1.000000));	
				else VaeData[playerid][OffSetRX] = floatsub(VaeData[playerid][OffSetRX],
				floatadd(toAdd,0.100000));			
                format(gametext, 36, "offsetrx: ~w~%f", VaeData[playerid][OffSetRX]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRY:
            {
            	if(Keys == 0) VaeData[playerid][OffSetRY] = floatsub(VaeData[playerid][OffSetRY],
				floatadd(toAdd, 1.000000));	
				else VaeData[playerid][OffSetRY] = floatsub(VaeData[playerid][OffSetRY],
				floatadd(toAdd,0.100000));	
            	format(gametext, 36, "offsetry: ~w~%f", VaeData[playerid][OffSetRY]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRZ:
            {
                if(Keys == 0) VaeData[playerid][OffSetRZ] = floatsub(VaeData[playerid][OffSetRZ],
				floatadd(toAdd, 1.000000));	
				else VaeData[playerid][OffSetRZ] = floatsub(VaeData[playerid][OffSetRZ],
				floatadd(toAdd,0.100000));	
                format(gametext, 36, "offsetrz: ~w~%f", VaeData[playerid][OffSetRZ]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeModel:
            {
                SetTimerEx("VaeUnDelay", 1000, false, "d", playerid);
                if(VaeData[playerid][delay]) return 1;
                DestroyObject(VaeData[playerid][obj]);
                VaeData[playerid][obj] = CreateObject(VaeData[playerid][objmodel]--,
				0.0, 0.0, -10.0, -50.0, 0, 0, 0);
                format(gametext, 36, "model: ~w~%d", VaeData[playerid][objmodel]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
				VaeData[playerid][delay] = true;
            }
		}
		AttachObjectToVehicle(VaeData[playerid][obj], VaeData[playerid][VehicleID],
		VaeData[playerid][OffSetX], VaeData[playerid][OffSetY], VaeData[playerid][OffSetZ],
		VaeData[playerid][OffSetRX], VaeData[playerid][OffSetRY], VaeData[playerid][OffSetRZ]);
	}
    return 1;
}

public VaeUnDelay(target)
{
    VaeData[target][delay] = false;
    return 1;
}

stock SendClientMessageEx(playerid, color, const ru[], const en[])
{
	if(GetPVarInt(playerid, "lang") == 0)
	{
	    SendClientMessage(playerid, color, ru);
	} else {
	    SendClientMessage(playerid, color, en);
	}
	return true;
}