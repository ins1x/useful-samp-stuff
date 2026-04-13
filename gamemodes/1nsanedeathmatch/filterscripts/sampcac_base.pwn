/*
 * SA-MP Clientside Anticheat (SAMPCAC)
 * Version:         v0.10.0
 * Author:          0xCAC
 * Compatible with: SA-MP 0.3.7 Server
 * Site:            https://SAMPCAC.xyz
 * Documentation:   https://SAMPCAC.xyz/docs
 *
 *
 * Usage:           Configure cheat detection by editing "scriptfiles/sampcac_base.ini"
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
new const g_szCheatSections[][] = {"aimbot_1", "aimbot_2", "triggerbot_1", "triggerbot_2", "nametag_wh_1", "esp_wh_1", "macro_1", "fake_ping_1", "weaponinfo_1", "norecoil_1", "norecoil_2", "aimbot_3", "aimbot_4", "cleo", "aimbot_5", "aimbot_6", "norecoil_3", "untrusted_1", "untrusted_2", "untrusted_3", "untrusted_4"};
new const g_szCheatNames   [][] = {"Aimbot (1)", "Aimbot (2)", "Triggerbot (1)", "Triggerbot (2)", "Nametag wallhack (1)", "ESP (1)", "Macro keybind (1)", "Fake ping (1)", "Weapon info (1)", "No recoil (1)", "No recoil (2)", "Aimbot (3)", "Aimbot (4)", "CLEO", "Aimbot (5)", "Aimbot (6)", "No recoil (3)", "Untrusted (1)", "Untrusted (2)", "Untrusted (3)", "Untrusted (4)"};
new g_iCheatStatus[CAC_CHEAT__ALL];
new g_iCheatActions[CAC_CHEAT__ALL];
new const g_szVKNames[256][] = {
    "NULL", "VK_LBUTTON", "VK_RBUTTON", "VK_CANCEL", "VK_MBUTTON", "VK_XBUTTON1", "VK_XBUTTON2", "NULL", "VK_BACK", "VK_TAB", "NULL", "NULL", "VK_CLEAR", "VK_RETURN", "NULL", "NULL", "VK_SHIFT", "VK_CONTROL", "VK_MENU", "VK_PAUSE", "VK_CAPITAL", "VK_KANA", "NULL", "VK_JUNJA", "VK_FINAL", "VK_KANJI", "NULL", "VK_ESCAPE", "VK_CONVERT", "VK_NONCONVERT", "VK_ACCEPT", "VK_MODECHANGE", "VK_SPACE", "VK_PRIOR", "VK_NEXT", "VK_END", "VK_HOME", "VK_LEFT", "VK_UP", "VK_RIGHT", "VK_DOWN", "VK_SELECT", "VK_PRINT",
    "VK_EXECUTE", "VK_SNAPSHOT", "VK_INSERT", "VK_DELETE", "VK_HELP", "VK_0", "VK_1", "VK_2", "VK_3", "VK_4", "VK_5", "VK_6", "VK_7", "VK_8", "VK_9", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "VK_A", "VK_B", "VK_C", "VK_D", "VK_E", "VK_F", "VK_G", "VK_H", "VK_I", "VK_J", "VK_K", "VK_L", "VK_M", "VK_N", "VK_O", "VK_P", "VK_Q", "VK_R", "VK_S", "VK_T", "VK_U", "VK_V", "VK_W", "VK_X", "VK_Y", "VK_Z", "VK_LWIN", "VK_RWIN", "VK_APPS", "NULL", "VK_SLEEP", "VK_NUMPAD0", "VK_NUMPAD1", "VK_NUMPAD2",
    "VK_NUMPAD3", "VK_NUMPAD4", "VK_NUMPAD5", "VK_NUMPAD6", "VK_NUMPAD7", "VK_NUMPAD8", "VK_NUMPAD9", "VK_MULTIPLY", "VK_ADD", "VK_SEPARATOR", "VK_SUBTRACT", "VK_DECIMAL", "VK_DIVIDE", "VK_F1", "VK_F2", "VK_F3", "VK_F4", "VK_F5", "VK_F6", "VK_F7", "VK_F8", "VK_F9", "VK_F10", "VK_F11", "VK_F12", "VK_F13", "VK_F14", "VK_F15", "VK_F16", "VK_F17", "VK_F18", "VK_F19", "VK_F20", "VK_F21", "VK_F22", "VK_F23", "VK_F24", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "VK_NUMLOCK", "VK_SCROLL",
    "VK_OEM_FJ_JISHO", "VK_OEM_FJ_MASSHOU", "VK_OEM_FJ_TOUROKU", "VK_OEM_FJ_LOYA", "VK_OEM_FJ_ROYA", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "VK_LSHIFT", "VK_RSHIFT", "VK_LCONTROL", "VK_RCONTROL", "VK_LMENU", "VK_RMENU", "VK_BROWSER_BACK", "VK_BROWSER_FORWARD", "VK_BROWSER_REFRESH", "VK_BROWSER_STOP", "VK_BROWSER_SEARCH", "VK_BROWSER_FAVORITES", "VK_BROWSER_HOME", "VK_VOLUME_MUTE", "VK_VOLUME_DOWN", "VK_VOLUME_UP", "VK_MEDIA_NEXT_TRACK", "VK_MEDIA_PREV_TRACK",
    "VK_MEDIA_STOP", "VK_MEDIA_PLAY_PAUSE", "VK_LAUNCH_MAIL", "VK_LAUNCH_MEDIA_SELECT", "VK_LAUNCH_APP1", "VK_LAUNCH_APP2", "NULL", "NULL", "VK_OEM_1", "VK_OEM_PLUS", "VK_OEM_COMMA", "VK_OEM_MINUS", "VK_OEM_PERIOD", "VK_OEM_2", "VK_OEM_3", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "VK_OEM_4", "VK_OEM_5", "VK_OEM_6", "VK_OEM_7", "VK_OEM_8",
    "NULL", "VK_OEM_AX", "VK_OEM_102", "VK_ICO_HELP", "VK_ICO_00", "VK_PROCESSKEY", "VK_ICO_CLEAR", "VK_PACKET", "NULL", "VK_OEM_RESET", "VK_OEM_JUMP", "VK_OEM_PA1", "VK_OEM_PA2", "VK_OEM_PA3", "VK_OEM_WSCTRL", "VK_OEM_CUSEL", "VK_OEM_ATTN", "VK_OEM_FINISH", "VK_OEM_COPY", "VK_OEM_AUTO", "VK_OEM_ENLW", "VK_OEM_BACKTAB", "VK_ATTN", "VK_CRSEL", "VK_EXSEL", "VK_EREOF", "VK_PLAY", "VK_ZOOM", "VK_NONAME", "VK_PA1", "VK_OEM_CLEAR", "NULL"
};
new g_iVKStatus[256];

#if sizeof(g_szCheatSections) != CAC_CHEAT__ALL
	#error Your version of sampcac.inc is not compatible with this filterscript. Redownload the server package from www.SAMPCAC.xyz
#endif

#if sizeof(g_szCheatSections) != sizeof(g_szCheatNames)
	#error Fix cheat names
#endif

new g_iScreenshotStatus;
new g_iScreenshotMax;
new g_iScreenshotResetTime;
new g_iScreenshotAction;

enum e_ScreenshotDetect 
{
	FirstTick,
	Count
}
new g_ScreenshotDetect[MAX_PLAYERS][e_ScreenshotDetect];

public OnFilterScriptInit()
{
    new result[16], status, action, max_screenshots, reset_time;
    for(new i = 0; i != CAC_CHEAT__ALL; ++i)
    {
        if(getINIString("sampcac_base.ini", g_szCheatSections[i], "status", result))
        {
            if(!strcmp(result, "on", true, 2))
                status = 1;
            else 
                status = 0;           
        }
        else
        {
            status = 1;
            printf("  SAMPCAC: Couldn't read \"status\" key inside \"%s\" section from \"scriptfiles/sampcac_base.ini\"", g_szCheatSections[i]);
            printf("  SAMPCAC: \"status\" for this cheat is set as enabled by default.");
        }

        if(getINIString("sampcac_base.ini", g_szCheatSections[i], "action", result))
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
            action = CAC_ACTION__KICK;
            printf("  SAMPCAC: Couldn't read \"action\" key inside \"%s\" section from \"scriptfiles/sampcac_base.ini\"", g_szCheatSections[i]);
            printf("  SAMPCAC: \"action\" for this cheat is set as \"kick\" by default.");
        }   
        
        
        g_iCheatStatus[i] = status;
        g_iCheatActions[i] = action;
    }
	
	if(getINIString("sampcac_base.ini", "screenshot", "status", result))
	{
		if(!strcmp(result, "on", true, 2))
			status = 1;
		else 
			status = 0;        
	}
	else
	{
		status = 1;
		printf("  SAMPCAC: Couldn't read \"status\" key inside \"screenshot\" section from \"scriptfiles/sampcac_base.ini\"");
		printf("  SAMPCAC: \"status\" is set as enabled by default.");
	}
	if(getINIString("sampcac_base.ini", "screenshot", "max_screenshots", result))
	{
		max_screenshots = strval(result);
	}
	else
	{
		max_screenshots = 1;
		printf("  SAMPCAC: Couldn't read \"max_screenshots\" key inside \"screenshot\" section from \"scriptfiles/sampcac_base.ini\"");
		printf("  SAMPCAC: \"max_screenshots\" is set to 1.");
	}
	if(getINIString("sampcac_base.ini", "screenshot", "reset_time", result))
	{
		reset_time = strval(result);
	}
	else
	{
		reset_time = 1000;
		printf("  SAMPCAC: Couldn't read \"reset_time\" key inside \"screenshot\" section from \"scriptfiles/sampcac_base.ini\"");
		printf("  SAMPCAC: \"reset_time\" is set to 1000 ms.");
	}	
	if(getINIString("sampcac_base.ini", "screenshot", "action", result))
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
		action = CAC_ACTION__KICK;
		printf("  SAMPCAC: Couldn't read \"action\" key inside \"screenshot\" section from \"scriptfiles/sampcac_base.ini\"");
		printf("  SAMPCAC: \"action\" for screenshots is set as \"kick\" by default.");
	}   	
	g_iScreenshotStatus = status;
	g_iScreenshotMax = max_screenshots;
	g_iScreenshotResetTime = reset_time;
	g_iScreenshotAction = action;
    
    for(new i = 0; i != 256; ++i)
    {
        if(strcmp(g_szVKNames[i], "NULL") != 0)
        {
            if(getINIString("sampcac_base.ini", "macro_key_detection", g_szVKNames[i], result))
            {
                if(!strcmp(result, "on", true, 2))
                    status = 1;
                else 
                    status = 0;           
            }
            else
            {
                status = 1;
                printf("  SAMPCAC: Couldn't read \"%s\" key inside \"macro_key_detection\" section from \"scriptfiles/sampcac_base.ini\"", g_szVKNames[i]);
                printf("  SAMPCAC: \"Detection status\" for this key is set as enabled by default.");
            }
            g_iVKStatus[i] = status;
        }
    }    
    printf("  SAMPCAC anticheat base filterscript loaded.");
    return 1;
}

public OnPlayerConnect(playerid)
{
	g_ScreenshotDetect[playerid][FirstTick] = 0;
	g_ScreenshotDetect[playerid][Count] = 0;
	return 1;
}

public CAC_OnCheatDetect(player_id, cheat_id, opt1, opt2)
{
	if(IsValidCheatID(cheat_id) && !g_iCheatStatus[cheat_id]) // skip if detection is disabled for this cheat type
		return 1;

    if(cheat_id == CAC_CHEAT__MACRO_1 && g_iVKStatus[opt1] == 0) // if macro key is pressed, but we disabled this key detection in "sampcac_base.ini", then ignore this call
        return 1;
    
    new string[144+1], playerName[MAX_PLAYER_NAME] = "[not connected yet]", cheatName[64];
    if(IsPlayerConnected(player_id))
        GetPlayerName(player_id, playerName, sizeof(playerName));
	
	if(IsValidCheatID(cheat_id))
		strcat(cheatName, g_szCheatNames[cheat_id]);
	else
		format(cheatName, sizeof(cheatName), "[invalid] [ID: %i]", cheat_id);
	
    format(string, sizeof(string), "SAMPCAC: {FFFFFF}Cheat detected: Player: %s [ID: %i] | Cheat: %s", playerName, player_id, cheatName);
    if(cheat_id == CAC_CHEAT__MACRO_1)
        format(string, sizeof(string), "%s [Key: %s (0x%02x)]", string, g_szVKNames[opt1], opt1); 
    SendClientMessageToAll(0xEE5555FF, string);
    
	if(IsValidCheatID(cheat_id)) 
	{
		switch(g_iCheatActions[cheat_id])
		{
			case CAC_ACTION__KICK:
			{
				format(string, sizeof(string), "SAMPCAC: {FFFFFF}%s has been kicked. Reason: Cheats detected.", playerName);
				SendClientMessageToAll(0xEE5555FF, string);            
				SetTimerEx("CAC_KickFix", 1000, false, "i", player_id);
			}
			case CAC_ACTION__BAN:
			{
				format(string, sizeof(string), "SAMPCAC: {FFFFFF}%s has been banned. Reason: Cheats detected.", playerName);
				SendClientMessageToAll(0xEE5555FF, string);                       
				SetTimerEx("CAC_BanFix", 1000, false, "i", player_id);
			}
		}
	}
	return 1;
}

public CAC_OnScreenshotTaken(player_id)
{
	if(!g_iScreenshotStatus) // skip if detection is disabled
		return 1;
		
	new curTick = GetTickCount();
	new diffTick = curTick - g_ScreenshotDetect[player_id][FirstTick];
	if (diffTick >= g_iScreenshotResetTime)
	{
		g_ScreenshotDetect[player_id][Count] = 0;
		g_ScreenshotDetect[player_id][FirstTick] = curTick;
	}

	if (++g_ScreenshotDetect[player_id][Count] > g_iScreenshotMax)
	{
		new string[144+1], playerName[MAX_PLAYER_NAME] = "[not connected yet]";
		if(IsPlayerConnected(player_id))
			GetPlayerName(player_id, playerName, sizeof(playerName));
		
		format(string, sizeof(string), "SAMPCAC: {FFFFFF}Screenshot: Player: %s [ID: %i] took %i screenshot(s) in %i ms.", playerName, player_id, g_ScreenshotDetect[player_id][Count], diffTick);
		SendClientMessageToAll(0xEE5555FF, string);
		
		switch(g_iScreenshotAction)
		{
			case CAC_ACTION__KICK:
			{
				format(string, sizeof(string), "SAMPCAC: {FFFFFF}%s has been kicked. Reason: Too many screenshots.", playerName);
				SendClientMessageToAll(0xEE5555FF, string);            
				SetTimerEx("CAC_KickFix", 1000, false, "i", player_id);
			}
			case CAC_ACTION__BAN:
			{
				format(string, sizeof(string), "SAMPCAC: {FFFFFF}%s has been banned. Reason: Too many screenshots.", playerName);
				SendClientMessageToAll(0xEE5555FF, string);                       
				SetTimerEx("CAC_BanFix", 1000, false, "i", player_id);
			}
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

IsValidCheatID(cheat_id)
{
	return (0 <= cheat_id < CAC_CHEAT__ALL);
}