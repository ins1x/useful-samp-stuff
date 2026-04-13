/*
////////////////////////////////////////////////////////////////////////////////

   ____                   _ __
  /  _/__  ___ ___ ____  (_) /___ __
 _/ // _ \(_-</ _ `/ _ \/ / __/ // /
/___/_//_/___/\_,_/_//_/_/\__/\_, /
                             /___/

                _   __    __   _     __
               | | / /__ / /  (_)___/ /__
               | |/ / -_) _ \/ / __/ / -_)
               |___/\__/_//_/_/\__/_/\__/
                    
                              ___  __  __           __                  __
                             / _ |/ /_/ /____ _____/ /  __ _  ___ ___  / /_
                            / __ / __/ __/ _ `/ __/ _ \/  ' \/ -_) _ \/ __/
                           /_/ |_\__/\__/\_,_/\__/_//_/_/_/_/\__/_//_/\__/

                                                        ____   ___ __
                                                       / __/__/ (_) /____  ____
                                                      / _// _  / / __/ _ \/ __/
                                                     /___/\_,_/_/\__/\___/_/





- Description

  It allows you to edit the offsets of any object to attach in any vehicle, 
  the functions will be saved in the file scriptfiles/editions.pwn.

- Author

  Allan Jader (CyNiC)


- Note

  You can change how much you want the filterscript, leaving the credit to creator.
  RUS by ---===DeNi$===---

////////////////////////////////////////////////////////////////////////////////////
*/

#include "a_samp"

#define COLOR_WHITE 0xFFFFFFFF
#define COLOR_RED  0xF40B74FF

forward VaeUnDelay(target);

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
	vehicleid,
	objmodel,
	timer
}

new Float:VaeData[MAX_PLAYERS][playerSets];

const vaeFloatX =  1;
const vaeFloatY =  2;
const vaeFloatZ =  3;
const vaeFloatRX = 4;
const vaeFloatRY = 5;
const vaeFloatRZ = 6;
const vaeModel   = 7;

public OnPlayerConnect(playerid)
{
	VaeData[playerid][timer] = -1;
	VaeData[playerid][obj] =  -1;
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[128], tmp[128], idx;
	cmd = strtok(cmdtext, idx);
	if(IsPlayerAdmin(playerid)){
		if(!strcmp("/vae", cmd, true))
		{
			tmp = strtok(cmdtext, idx);
			if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_WHITE, "Вы не в машине.");
			if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, "Иcпользовать: /vae [id объкта]");
			if(VaeData[playerid][timer] != -1) KillTimer(VaeData[playerid][timer]);
			if(IsValidObject(VaeData[playerid][obj])) DestroyObject(VaeData[playerid][obj]);
			
			new Obj = CreateObject(strval(tmp), 0.0, 0.0, -10.0, -50.0, 0, 0, 0);
			new vId = GetPlayerVehicleID(playerid);
			AttachObjectToVehicle(Obj, vId, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
			VaeData[playerid][timer] = SetTimerEx("VaeGetKeys", 30, true, "i", playerid);
			VaeData[playerid][EditStatus] = vaeFloatX;
			VaeData[playerid][vehicleid] = vId;		
			VaeData[playerid][objmodel] = strval(tmp);
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
			new str[100];
			format(str, 100, "| Редактируеться объект %d. Используйте KEY_LEFT, KEY_RIGHT and KEY_FIRE to adjust the offset's |", strval(tmp));
			SendClientMessage(playerid, COLOR_WHITE, str);
			SendClientMessage(playerid, COLOR_WHITE, "| Используйте {F40B74}/X{4E76B1} для регулировки оси X |");
			SendClientMessage(playerid, COLOR_WHITE, "| Используйте {F40B74}/Y{4E76B1} для регулировки оси Y |");
			SendClientMessage(playerid, COLOR_WHITE, "| Используйте {F40B74}/Z{4E76B1} для регулировки оси Z |");
			SendClientMessage(playerid, COLOR_WHITE, "| Используйте {F40B74}/RX{4E76B1} для регулировки оси RX |");
			SendClientMessage(playerid, COLOR_WHITE, "| Используйте {F40B74}/RY{4E76B1} для регулировки оси RY |");
			SendClientMessage(playerid, COLOR_WHITE, "| Используйте {F40B74}/RZ{4E76B1} для регулировки оси RZ |");
			SendClientMessage(playerid, COLOR_WHITE, "| Используйте {F40B74}/MODEL{4E76B1} изменить модель. |");
			SendClientMessage(playerid, COLOR_WHITE, "| Используйте {F40B74}/FREEZE{4E76B1} и {F40B74}/UNFREEZE{4E76B1} заморозить и разморозить себя |");
			SendClientMessage(playerid, COLOR_WHITE, "| Используйте {F40B74}/STOP{4E76B1} Закончить редактирование |");
			SendClientMessage(playerid, COLOR_WHITE, "| Используйте {F40B74}/SAVEOBJ{4E76B1} Сохранить \"editions.pwn\". |");
			SendClientMessage(playerid, COLOR_WHITE, "| Используйте {F40B74}/PAGESIZE 15{4E76B1} Посмотреть все сообщения. |");
			return true;
		}
		if(!strcmp("/stop", cmd, true))
		{
			KillTimer(VaeData[playerid][timer]);
			return SendClientMessage(playerid, COLOR_WHITE, "Редактирование закончено.");
		}
		if(!strcmp("/saveobj", cmd, true))
		{		
			tmp = strtok(cmdtext, idx);
			new File: file = fopen("maps/Vaeditions.txt", io_append);
			new str[200];
			format(str, 200, "\r\nAttachObjectToVehicle(objectid, vehicleid, %f, %f, %f, %f, %f, %f); //Object Model: %d | %s", VaeData[playerid][OffSetX], VaeData[playerid][OffSetY], VaeData[playerid][OffSetZ], VaeData[playerid][OffSetRX], VaeData[playerid][OffSetRY], VaeData[playerid][OffSetRZ], VaeData[playerid][objmodel], tmp);
			fwrite(file, str);
			fclose(file);
			return SendClientMessage(playerid, COLOR_WHITE, "Всё сохранено в \"vaeditions.txt\".");
		}	
		if(!strcmp("/x", cmd, true))
		{
			VaeData[playerid][EditStatus] = vaeFloatX;
			return SendClientMessage(playerid, COLOR_WHITE, "Редактирование оси X.");
		}
		if(!strcmp("/y", cmd, true))
		{
			VaeData[playerid][EditStatus] = vaeFloatY;
			return SendClientMessage(playerid, COLOR_WHITE, "Редактирование оси Y.");
		}
		if(!strcmp("/z", cmd, true))
		{
			VaeData[playerid][EditStatus] = vaeFloatZ;
			return SendClientMessage(playerid, COLOR_WHITE, "Редактирование оси Z.");
		}
		if(!strcmp("/rx", cmd, true))
		{
			VaeData[playerid][EditStatus] = vaeFloatRX;
			return SendClientMessage(playerid, COLOR_WHITE, "Редактирование оси RX.");
		}
		if(!strcmp("/ry", cmd, true))
		{
			VaeData[playerid][EditStatus] = vaeFloatRY;
			return SendClientMessage(playerid, COLOR_WHITE, "Редактирование оси RY.");
		}
		if(!strcmp("/rz", cmd, true))
		{
			VaeData[playerid][EditStatus] = vaeFloatRZ;
			return SendClientMessage(playerid, COLOR_WHITE, "Редактирование оси RZ.");
		}

		if(!strcmp("/model", cmd, true))
		{
			VaeData[playerid][EditStatus] = vaeModel;
			return SendClientMessage(playerid, COLOR_WHITE, "Editing Object Model.");
		}
		
		if(!strcmp("/freeze", cmd, true))
		{
			TogglePlayerControllable(playerid, false);
			SendClientMessage(playerid, COLOR_WHITE, "Вы замороженны, используйте /unfreeze чтобы разморозить себя.");
			return 1;
		}
		if(!strcmp("/unfreeze", cmd, true))
		{
			TogglePlayerControllable(playerid, true);
			SendClientMessage(playerid, COLOR_WHITE, "Вы размороженны.");
			return 1;
		}
	}
	return 0;
}



public OnFilterScriptInit()
{
	for(new i = 0; i < MAX_PLAYERS; ++i)
	{
		if(IsPlayerConnected(i))
		{
			VaeData[i][timer] = -1;
			VaeData[i][obj] =  -1;
		}
	}
    return true;
}

public OnFilterScriptExit()
{
	for(new i = 0; i < MAX_PLAYERS; ++i) DestroyObject(VaeData[i][obj]);
	return 1;
}

forward VaeGetKeys(playerid);
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
				if(Keys == 0) VaeData[playerid][OffSetRX] = floatadd(VaeData[playerid][OffSetRX], floatadd(toAdd, 1.000000));	
				else VaeData[playerid][OffSetRX] = floatadd(VaeData[playerid][OffSetRX], floatadd(toAdd,0.100000));					                			
                format(gametext, 36, "offsetrx: ~w~%f", VaeData[playerid][OffSetRX]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRY:
            {
            	if(Keys == 0) VaeData[playerid][OffSetRY] = floatadd(VaeData[playerid][OffSetRY], floatadd(toAdd, 1.000000));	
				else VaeData[playerid][OffSetRY] = floatadd(VaeData[playerid][OffSetRY], floatadd(toAdd,0.100000));	
            	format(gametext, 36, "offsetry: ~w~%f", VaeData[playerid][OffSetRY]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRZ:
            {
                if(Keys == 0) VaeData[playerid][OffSetRZ] = floatadd(VaeData[playerid][OffSetRZ], floatadd(toAdd, 1.000000));	
				else VaeData[playerid][OffSetRZ] = floatadd(VaeData[playerid][OffSetRZ], floatadd(toAdd,0.100000));	
                format(gametext, 36, "offsetrz: ~w~%f", VaeData[playerid][OffSetRZ]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeModel:
            {
                SetTimerEx("VaeUnDelay", 1000, false, "d", playerid);
                if(VaeData[playerid][delay]) return 1;
                DestroyObject(VaeData[playerid][obj]);
                VaeData[playerid][obj] = CreateObject(VaeData[playerid][objmodel]++, 0.0, 0.0, -10.0, -50.0, 0, 0, 0);
                format(gametext, 36, "model: ~w~%d", VaeData[playerid][objmodel]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
				VaeData[playerid][delay] = true;
            }
		}
		AttachObjectToVehicle(VaeData[playerid][obj], VaeData[playerid][vehicleid], VaeData[playerid][OffSetX], VaeData[playerid][OffSetY], VaeData[playerid][OffSetZ], VaeData[playerid][OffSetRX], VaeData[playerid][OffSetRY], VaeData[playerid][OffSetRZ]);
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
				if(Keys == 0) VaeData[playerid][OffSetRX] = floatsub(VaeData[playerid][OffSetRX], floatadd(toAdd, 1.000000));	
				else VaeData[playerid][OffSetRX] = floatsub(VaeData[playerid][OffSetRX], floatadd(toAdd,0.100000));			
                format(gametext, 36, "offsetrx: ~w~%f", VaeData[playerid][OffSetRX]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRY:
            {
            	if(Keys == 0) VaeData[playerid][OffSetRY] = floatsub(VaeData[playerid][OffSetRY], floatadd(toAdd, 1.000000));	
				else VaeData[playerid][OffSetRY] = floatsub(VaeData[playerid][OffSetRY], floatadd(toAdd,0.100000));	
            	format(gametext, 36, "offsetry: ~w~%f", VaeData[playerid][OffSetRY]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRZ:
            {
                if(Keys == 0) VaeData[playerid][OffSetRZ] = floatsub(VaeData[playerid][OffSetRZ], floatadd(toAdd, 1.000000));	
				else VaeData[playerid][OffSetRZ] = floatsub(VaeData[playerid][OffSetRZ], floatadd(toAdd,0.100000));	
                format(gametext, 36, "offsetrz: ~w~%f", VaeData[playerid][OffSetRZ]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeModel:
            {
                SetTimerEx("VaeUnDelay", 1000, false, "d", playerid);
                if(VaeData[playerid][delay]) return 1;
                DestroyObject(VaeData[playerid][obj]);
                VaeData[playerid][obj] = CreateObject(VaeData[playerid][objmodel]--, 0.0, 0.0, -10.0, -50.0, 0, 0, 0);
                format(gametext, 36, "model: ~w~%d", VaeData[playerid][objmodel]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
				VaeData[playerid][delay] = true;
            }
		}
		AttachObjectToVehicle(VaeData[playerid][obj], VaeData[playerid][vehicleid], VaeData[playerid][OffSetX], VaeData[playerid][OffSetY], VaeData[playerid][OffSetZ], VaeData[playerid][OffSetRX], VaeData[playerid][OffSetRY], VaeData[playerid][OffSetRZ]);
	}
    return 1;
}

public VaeUnDelay(target)
{
    VaeData[target][delay] = false;
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
