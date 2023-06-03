/* 
Filterscript: vae
Description: Vehicle attachements editor
  It allows you to edit the offsets of any object to attach in any vehicle
  Based on Insanity Vehicle Attachment Editor
Credits:
  Orgignal FS Author Allan Jader (CyNiC) 
  https://github.com/Southclaws/samp-Hellfire/blob/master/filterscripts/tool_VehicleAttach.pwn
  Improved and translated specifically for RSC server https://dsc.gg/sawncommunity
Language set: SetPVarInt(playerid, "lang", 1) where 1 = English, 0 = Russian
  To change the language, set 
*/

#include <a_samp>
#tryinclude <streamer>

#define OUTPUT_FILE "Vaeditions.txt"
#define FILTERSCRIPT

#define DIALOG_VAE                  6000
#define DIALOG_VAENEW               6001
#define DIALOG_VAERESET             6002
    
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
    SendClientMessageToAll(-1, "Vehicle Attach Editor loaded. (VAE). type /vae or press <H> in vehicle");
    return 1;
}

public OnFilterScriptExit()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if (IsPlayerConnected(i))
        {
            if(VaeData[i][timer] != -1) KillTimer(VaeData[i][timer]);
            if(IsValidObject(VaeData[i][obj])) DestroyObject(VaeData[i][obj]);
        }
    }
    return 1;
}

public OnPlayerConnect(playerid)
{
    //SetPVarInt(playerid, "lang", 1) // 1 EN, 0 RUS 
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
            "{FFFFFF}Specify the object model to attach to the vehicle.\
            (For example minigun: 362)", ">>>","Cancel");
        } else {
            ShowVaeMenu(playerid);
        }
        return true;
    }
    if(!strcmp("/vaehelp", cmd, true))
    {
        VaeHelp(playerid);
        return true;
    }
    if(!strcmp("/vaestop", cmd, true))
    {
        KillTimer(VaeData[playerid][timer]);
        SendClientMessageEx(playerid, -1,
        "Редактирование закончено.", "Editing is complete");
        return true;
    }
    if(!strcmp("/vaesave", cmd, true))
    {       
        tmp = strtok(cmdtext, idx);
        new str[256], File: file;
        if(!fexist(OUTPUT_FILE)) file = fopen(OUTPUT_FILE, io_write);
        else file = fopen(OUTPUT_FILE, io_append);
        #if defined _streamer_included
        format(str, 256,
        "\r\n//Vehicle model ID: %d, Object Model: %d %s",
        GetVehicleModel(GetPlayerVehicleID(playerid)), VaeData[playerid][objmodel], tmp);
        fwrite(file, str);
        
        format(str, 256,
        "\r\ntmpobjid = CreateDynamicObject(%d, 0.0, 0.0, -1000.0, 0.0, 0.0, 0.0, %d, %d);",
        VaeData[playerid][objmodel],GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
        fwrite(file, str);
        
        format(str, 256,
        "\r\nAttachDynamicObjectToVehicle(tmpobjid, vehicleid, %f, %f, %f, %f, %f, %f);",
        VaeData[playerid][OffSetX], VaeData[playerid][OffSetY], VaeData[playerid][OffSetZ],
        VaeData[playerid][OffSetRX], VaeData[playerid][OffSetRY], VaeData[playerid][OffSetRZ]);
        fwrite(file, str);
        #else
        format(str, 256,
        "\r\n//Vehicle model ID: %d, Object Model: %d %s",
        GetVehicleModel(GetPlayerVehicleID(playerid)), VaeData[playerid][objmodel], tmp);
        fwrite(file, str);
        
        format(str, 256,
        "\r\ntmpobjid = CreateObject(%d, 0.0, 0.0, -1000.0, 0.0, 0.0, 0.0);",
        VaeData[playerid][objmodel]);
        fwrite(file, str);
        
        format(str, 256,
        "\r\nAttachObjectToVehicle(tmpobjid, vehicleid, %f, %f, %f, %f, %f, %f);",
        VaeData[playerid][OffSetX], VaeData[playerid][OffSetY], VaeData[playerid][OffSetZ],
        VaeData[playerid][OffSetRX], VaeData[playerid][OffSetRY], VaeData[playerid][OffSetRZ]);
        fwrite(file, str);
        #endif
        fclose(file);
        SendClientMessageEx(playerid, -1,
        "Всё сохранено в \""OUTPUT_FILE"\".", "Saved to \""OUTPUT_FILE"\".");
        return true;
    }
    if(!strcmp("/vaemodel", cmd, true))
    {
        //VaeData[playerid][EditStatus] = vaeModel;
        SendClientMessage(playerid, -1, "Editing Object Model.");
        ShowPlayerDialog(playerid, DIALOG_VAENEW, DIALOG_STYLE_INPUT,
        "VAE New attach", "{FFFFFF}Specify the object model to attach to the vehicle.\
        (For example minigun: 362)", ">>>","Cancel");
        return true;
    }
    return 0;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys == KEY_CROUCH) // <H/CAPSLOCK> in Vehicle or <C> on foot
    {
        if(GetPVarType(playerid, "VaeEdit"))
        {
            if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) ShowVaeMenu(playerid);
        }
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
                        "{FFFFFF}Введите ID модели объекта для прикрепления на транспорт.\
                        (Например minigun: 362):",
                        ">>>","Cancel");
                    } else {
                        ShowPlayerDialog(playerid, DIALOG_VAENEW, DIALOG_STYLE_INPUT,
                        "VAE New attach",
                        "{FFFFFF}Specify the object model to attach to the vehicle.\
                        (For example minigun: 362)",
                        ">>>","Cancel");
                    }
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
                    if(GetPVarInt(playerid, "lang") == 1)
                    {
                        ShowPlayerDialog(playerid, DIALOG_VAERESET, DIALOG_STYLE_LIST,
                        "VAE Reset", 
                        "Reset XYZ\nReset RX,RY,RZ\nDelete object", "Select","Cancel");
                    } else {
                        ShowPlayerDialog(playerid, DIALOG_VAERESET, DIALOG_STYLE_LIST,
                        "VAE Reset", 
                        "Сбросить XYZ\nСбросить RX,RY,RZ\nУдалить объект", "Выбрать","Отмена");
                    }
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
                    ShowVaeMenu(playerid);
                }
                case 9:
                {
                    if(!IsPlayerInAnyVehicle(playerid)) {
                        return SendClientMessageEx(playerid, -1,
                        "Вы не в машине.","You are not in the car.");
                    }
                    
                    if(IsValidObject(VaeData[playerid][obj])) {
                        return SendClientMessageEx(playerid, -1,
                        "Объект не был создан", "Object not found");
                    }
                    
                    new vehicleid  = GetPlayerVehicleID(playerid);
                    new tmpobjid = CreateObject(VaeData[playerid][objmodel], 0.0, 0.0, -10.0, -50.0, 0, 0);
                    AttachObjectToVehicle(tmpobjid, vehicleid,
                    VaeData[playerid][OffSetX],
                    VaeData[playerid][OffSetY],
                    VaeData[playerid][OffSetZ],
                    VaeData[playerid][OffSetRX],
                    VaeData[playerid][OffSetRY],
                    VaeData[playerid][OffSetRZ]);
                    
                    DestroyObject(VaeData[playerid][obj]);
                    VaeData[playerid][obj] = -1;
                    SendClientMessageEx(playerid, -1,
                    "Аттач сохранен на транспорте. Теперь вы можете создать новый",
                    "The attachment is saved on vehicle. Now you can create a new one");
                }
                case 10:
                {
                    KillTimer(VaeData[playerid][timer]);
                    TogglePlayerControllable(playerid, true);
                    SetPVarInt(playerid,"freezed",0);
                    DeletePVar(playerid, "VaeEdit");
                    
                    VaeData[playerid][OffSetX]  = 0.0;
                    VaeData[playerid][OffSetY]  = 0.0;
                    VaeData[playerid][OffSetZ]  = 0.0;
                    VaeData[playerid][OffSetRX] = 0.0;
                    VaeData[playerid][OffSetRY] = 0.0;
                    VaeData[playerid][OffSetRZ] = 0.0;
                    
                    SendClientMessageEx(playerid, -1,
                    "Редактирование закончено.", "Finish vae edit");
                }
                case 11: 
                {
                    new param[24];
                    format(param, sizeof(param), "/vaesave");
                    OnPlayerCommandText(playerid, param);
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
                    VaeHelp(playerid);
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
                SetPVarInt(playerid, "VaeEdit",1);
                ShowVaeMenu(playerid);
            }
        } 
    }
    if(dialogid == DIALOG_VAERESET)
    {
        if(response)
        {
            switch(listitem)
            {
                case 0:
                {
                    VaeData[playerid][OffSetX]  = 0.0;
                    VaeData[playerid][OffSetY]  = 0.0;
                    VaeData[playerid][OffSetZ]  = 0.0;
                    SendClientMessageEx(playerid, -1,
                    "Значения XYZ сброшены", "Reset XYZ values");
                    ShowVaeMenu(playerid);
                }
                case 1:
                {
                    VaeData[playerid][OffSetRX] = 0.0;
                    VaeData[playerid][OffSetRY] = 0.0;
                    VaeData[playerid][OffSetRZ] = 0.0;
                    SendClientMessageEx(playerid, -1,
                    "Значения RX,RY,RZ сброшены", "Reset RX,RY,RZ values");
                    ShowVaeMenu(playerid);
                }
                case 2:
                {
                    if(IsValidObject(VaeData[playerid][obj])) {
                        VaeData[playerid][OffSetX]  = 0.0;
                        VaeData[playerid][OffSetY]  = 0.0;
                        VaeData[playerid][OffSetZ]  = 0.0;
                        VaeData[playerid][OffSetRX] = 0.0;
                        VaeData[playerid][OffSetRY] = 0.0;
                        VaeData[playerid][OffSetRZ] = 0.0;
                        DestroyObject(VaeData[playerid][obj]);
                        KillTimer(VaeData[playerid][timer]);
                        SendClientMessageEx(playerid, -1,
                        "Объект удален", "Object removed");
                    } else {
                        SendClientMessageEx(playerid, -1,
                        "Объект не был создан", "Object not found");
                    }
                    ShowVaeMenu(playerid);
                }
            }
        }
        else ShowVaeMenu(playerid);
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
        "Reset\t\n"\
        "%s\t\n"\
        "Add more\t{00FF00}\n"\
        "Stop edit\t{00FF00}/vaestop\n"\
        "Save\t{00FF00}/vaesave\n",
        VaeData[playerid][OffSetX], VaeData[playerid][OffSetY], VaeData[playerid][OffSetZ],
        VaeData[playerid][OffSetRX], VaeData[playerid][OffSetRY], VaeData[playerid][OffSetRZ],
        (!GetPVarInt(playerid,"freezed")) ? ("Freeze") : ("Unfreeze"));
    } else {
        format(tbtext, sizeof(tbtext),
        "Изменить модель\t{00FF00}/vaemodel\n"\
        "Регулировка оси X\t%.2f\n"\
        "Регулировка оси Y\t%.2f\n"\
        "Регулировка оси Z\t%.2f\n"\
        "Регулировка оси RX\t%.2f\n"\
        "Регулировка оси RY\t%.2f\n"\
        "Регулировка оси RZ\t%.2f\n"\
        "Сбросить\t\n"\
        "%s\t\n"\
        "Добавить еще\t{00FF00}\n"\
        "Закончить редактирование\t{00FF00}/vaestop\n"\
        "Сохранить\t{00FF00}/vaesave\n",
        VaeData[playerid][OffSetX], VaeData[playerid][OffSetY], VaeData[playerid][OffSetZ],
        VaeData[playerid][OffSetRX], VaeData[playerid][OffSetRY], VaeData[playerid][OffSetRZ],
        (!GetPVarInt(playerid,"freezed")) ? ("Заморозить") : ("Разморозить"));
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
        case KEY_FIRE:   toAdd = 0.001000;      
        default:         toAdd = 0.010000;
    }   
    if(VaeData[playerid][lr] == 128)
    {
        switch(VaeData[playerid][EditStatus])
        {
            case vaeFloatX:
            {
                VaeData[playerid][OffSetX] = floatadd(VaeData[playerid][OffSetX], toAdd);
                format(gametext, 36, "offsetx: ~w~%.3f", VaeData[playerid][OffSetX]);
                GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatY:
            {
                VaeData[playerid][OffSetY] = floatadd(VaeData[playerid][OffSetY], toAdd);
                format(gametext, 36, "offsety: ~w~%.3f", VaeData[playerid][OffSetY]);
                GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatZ:
            {
                VaeData[playerid][OffSetZ] = floatadd(VaeData[playerid][OffSetZ], toAdd);
                format(gametext, 36, "offsetz: ~w~%.3f", VaeData[playerid][OffSetZ]);
                GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRX:
            {
                if(Keys == 0) VaeData[playerid][OffSetRX] = floatadd(VaeData[playerid][OffSetRX],
                floatadd(toAdd, 1.000000)); 
                else VaeData[playerid][OffSetRX] = floatadd(VaeData[playerid][OffSetRX],
                floatadd(toAdd,0.100000));                                              
                format(gametext, 36, "offsetrx: ~w~%.3f", VaeData[playerid][OffSetRX]);
                GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRY:
            {
                if(Keys == 0) VaeData[playerid][OffSetRY] = floatadd(VaeData[playerid][OffSetRY],
                floatadd(toAdd, 1.000000)); 
                else VaeData[playerid][OffSetRY] = floatadd(VaeData[playerid][OffSetRY],
                floatadd(toAdd,0.100000));  
                format(gametext, 36, "offsetry: ~w~%.3f", VaeData[playerid][OffSetRY]);
                GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRZ:
            {
                if(Keys == 0) VaeData[playerid][OffSetRZ] = floatadd(VaeData[playerid][OffSetRZ],
                floatadd(toAdd, 1.000000)); 
                else VaeData[playerid][OffSetRZ] = floatadd(VaeData[playerid][OffSetRZ],
                floatadd(toAdd,0.100000));  
                format(gametext, 36, "offsetrz: ~w~%.3f", VaeData[playerid][OffSetRZ]);
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
                format(gametext, 36, "offsetx: ~w~%.3f", VaeData[playerid][OffSetX]);
                GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatY:
            {
                VaeData[playerid][OffSetY] = floatsub(VaeData[playerid][OffSetY], toAdd);
                format(gametext, 36, "offsety: ~w~%.3f", VaeData[playerid][OffSetY]);
                GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatZ:
            {
                VaeData[playerid][OffSetZ] = floatsub(VaeData[playerid][OffSetZ], toAdd);
                format(gametext, 36, "offsetz: ~w~%.3f", VaeData[playerid][OffSetZ]);
                GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRX:
            {
                if(Keys == 0) VaeData[playerid][OffSetRX] = floatsub(VaeData[playerid][OffSetRX],
                floatadd(toAdd, 1.000000)); 
                else VaeData[playerid][OffSetRX] = floatsub(VaeData[playerid][OffSetRX],
                floatadd(toAdd,0.100000));          
                format(gametext, 36, "offsetrx: ~w~%.3f", VaeData[playerid][OffSetRX]);
                GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRY:
            {
                if(Keys == 0) VaeData[playerid][OffSetRY] = floatsub(VaeData[playerid][OffSetRY],
                floatadd(toAdd, 1.000000)); 
                else VaeData[playerid][OffSetRY] = floatsub(VaeData[playerid][OffSetRY],
                floatadd(toAdd,0.100000));  
                format(gametext, 36, "offsetry: ~w~%.3f", VaeData[playerid][OffSetRY]);
                GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRZ:
            {
                if(Keys == 0) VaeData[playerid][OffSetRZ] = floatsub(VaeData[playerid][OffSetRZ],
                floatadd(toAdd, 1.000000)); 
                else VaeData[playerid][OffSetRZ] = floatsub(VaeData[playerid][OffSetRZ],
                floatadd(toAdd,0.100000));  
                format(gametext, 36, "offsetrz: ~w~%.3f", VaeData[playerid][OffSetRZ]);
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

stock VaeHelp(playerid)
{
    SendClientMessageEx(playerid, -1, 
    "Используйте клавиши {00FF00}ВЛЕВО-ВПРАВО{FFFFFF} для перемещения аттача",
    "Use keys {00FF00}LEFT - RIGHT{FFFFFF} to move attach");
    SendClientMessageEx(playerid, -1, 
    "Нажмите {00FF00}H{FFFFFF} для того чтобы показать меню редактирования (в транспорте)",
    "Press {00FF00}H{FFFFFF} to show the edit menu (in vehicle)");
    SendClientMessageEx(playerid, -1, 
    "Удерживайте {00FF00}KEY_FIRE(ЛКМ){FFFFFF} чтобы увеличить чувствительность",
    "Hold {00FF00}KEY_FIRE(LMB){FFFFFF} to increase sensitivity");
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