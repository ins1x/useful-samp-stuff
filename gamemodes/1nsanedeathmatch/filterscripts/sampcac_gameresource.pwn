/*
 * SA-MP Clientside Anticheat (SAMPCAC)
 * Version:         v0.10.0
 * Author:          0xCAC
 * Compatible with: SA-MP 0.3.7 Server
 * Site:            https://SAMPCAC.xyz
 * Documentation:   https://SAMPCAC.xyz/docs
 *
 *
 * Usage:           Toggle game resource checking by editing "scriptfiles/sampcac_gameresource.ini"
 */

#define FILTERSCRIPT

#include <a_samp>
#include <sampcac>
enum 
{
    CAC_ACTION__WARNING,
    CAC_ACTION__KICK,
    CAC_ACTION__BAN
};

new const g_szGameResourceKeys[][] = {"type", "action", "skins", "vehicles", "weapons", "others", "ped_ifp"};
new g_iModAction;

public OnFilterScriptInit()
{
    new result[16], type = CAC_GAMERESOURCE_REPORTTYPE__FULL, action = CAC_ACTION__KICK;
    
    CAC_SetGameResourceReportStatus(CAC_GAMERESOURCE_MODELTYPEFLAG__ALL, 1); // by default, activate all model reports
    for(new i = 0; i != sizeof(g_szGameResourceKeys); ++i)
    {
        if(getINIString("sampcac_gameresource.ini", "gamemodels", g_szGameResourceKeys[i], result))
        {
            if(i == 0)
            {
                if(!strcmp(result, "disabled", true, 8))
                    type = CAC_GAMERESOURCE_REPORTTYPE__DISABLED;
                else if(!strcmp(result, "only_if_modded", true, 14))
                    type = CAC_GAMERESOURCE_REPORTTYPE__ONLY_IF_MODDED;     
                else 
                    type = CAC_GAMERESOURCE_REPORTTYPE__FULL;                
            }
            else if(i == 1)
            {
                if(!strcmp(result, "warning", true, 7))
                    action = CAC_ACTION__WARNING;
                else if(!strcmp(result, "ban", true, 3))
                    action = CAC_ACTION__BAN;
                else
                    action = CAC_ACTION__KICK;              
            }    
            else
            {
                if(!strcmp(result, "off", true, 3))
                    CAC_SetGameResourceReportStatus(1 << (i-2), 0);
            }            
        }
        else
        {
            printf("  SAMPCAC: Couldn't read \"%s\" key from \"scriptfiles/sampcac_gameresource.ini\"", g_szGameResourceKeys[i]);
            if(i == 0)
                printf("  SAMPCAC: This option is set as \"full\" by default.");
            else if(i == 1)
                printf("  SAMPCAC: This option is set as \"kick\" by default.");
            else
                printf("  SAMPCAC: This option is set as \"enabled\" by default.");
        }
    }
    
    g_iModAction = action;
    CAC_SetGameResourceReportType(type);
    printf("  SAMPCAC game resource filterscript loaded.");
    return 1;
}

public CAC_OnGameResourceMismatch(player_id, model_id, component_type, checksum)
{
    new string[144+1], playerName[MAX_PLAYER_NAME] = "[not connected yet]";
    if(IsPlayerConnected(player_id))
        GetPlayerName(player_id, playerName, sizeof(playerName));
    if(model_id != CAC_GAMERESOURCE_MODELID__ONLY_IF_MODDED)
    {
		if(0 <= model_id <= 19999) // valid GTA:SA game models are 0-19999
		{
			new compName[8];
			switch(component_type)
			{
				case CAC_GAMERESOURCE_COMPONENTTYPE__DFF:
					strcat(compName, "DFF");
				case CAC_GAMERESOURCE_COMPONENTTYPE__TXD:
					strcat(compName, "TXD");
				case CAC_GAMERESOURCE_COMPONENTTYPE__ANIM:
					strcat(compName, "ANIM");			
				default:
					strcat(compName, "UNKNOWN");
			}
			format(string, sizeof(string), "SAMPCAC: {FFFFFF}Game resource modded: Player: %s [ID: %i] | Model ID: %d [%s] | Checksum: %08x", playerName, player_id, model_id, compName, checksum);
		}
		else
		{
			new modName[8];
			switch(model_id)
			{
				case CAC_GAMERESOURCE_MODELID__PEDIFP:
					strcat(modName, "PED.IFP");
			}
			format(string, sizeof(string), "SAMPCAC: {FFFFFF}Game resource modded: Player: %s [ID: %i] | Mod: %s | Checksum: %08x", playerName, player_id, modName, checksum);
		}
	}
    else
    {
        format(string, sizeof(string), "SAMPCAC: {FFFFFF}Game resource modded: Player: %s [ID: %i]", playerName, player_id);
    }
    SendClientMessageToAll(0xEE5555FF, string);
    
    switch(g_iModAction)
    {
        case CAC_ACTION__KICK:
        {
            format(string, sizeof(string), "SAMPCAC: {FFFFFF}%s has been kicked. Reason: Mods detected.", playerName);
            SendClientMessageToAll(0xEE5555FF, string);            
            SetTimerEx("CAC_KickFix", 1000, false, "i", player_id);
        }
        case CAC_ACTION__BAN:
        {
            format(string, sizeof(string), "SAMPCAC: {FFFFFF}%s has been banned. Reason: Mods detected.", playerName);
            SendClientMessageToAll(0xEE5555FF, string);                       
            SetTimerEx("CAC_BanFix", 1000, false, "i", player_id);
        }
    }
    return 1;
}

forward CAC_KickFix(player_id);
public CAC_KickFix(player_id) { Kick(player_id); }

forward CAC_BanFix(player_id);
public CAC_BanFix(player_id) { Ban(player_id); }

// Slightly modified code from: http://wiki.sa-mp.com/wiki/How_to_read_from_INI_files
getINIString(const filename[], const section[], const item[], result[], max_size = sizeof(result)) {
    new File: inifile;
    new line[512];
    new sectionstr[64], itemstr[64];
    new sectionfound = 0;

    inifile = fopen(filename, io_read);
    if (!inifile) {
        return 0;
    }

    format(sectionstr, sizeof(sectionstr), "[%s]", section);
    format(itemstr, sizeof(itemstr), "%s=", item);

    while (fread(inifile, line)) {
        StripNewLine(line);

        if (line[0] == 0) {
            continue;
        }

        /* If !sectionfound is true, we're looking for the proper section. */
        if (!sectionfound) {
            /* Check if wanted section is being opened. */
            if (!strcmp(line, sectionstr, true, strlen(sectionstr))) {
                sectionfound = 1;
            }
        } else { /* Itemmode from here. */
            /* We're leaving the wanted section and didn't find the value yet.
             * So we'll never reach it. */
            if (line[0] == '[') {
                fclose(inifile);
                return 0;
            }

            /* Have we reached our wanted INI item? */
            if (!strcmp(line, itemstr, true, strlen(itemstr))) {
                format(result, max_size, "%s", line[strlen(itemstr)]);
                fclose(inifile);
                return 1;
            }
        }
    }

    fclose(inifile);
    return 0;
}

// http://forum.sa-mp.com/showpost.php?p=2908420&postcount=2
StripNewLine(string[])
{
    new len = strlen(string);
    if (len >= 1 && ((string[len - 1] == '\n') || (string[len - 1] == '\r'))) {
        string[len - 1] = 0;
        if (len >= 2 && ((string[len - 2] == '\n') || (string[len - 2] == '\r'))) string[len - 2] = 0;
    }
}