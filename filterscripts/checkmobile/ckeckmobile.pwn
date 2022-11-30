/*
	Filterscript: checkmobile
	Description: Finds players from mobile devices
	Created specifically for RSC server 
	CW/TG gamemode powered by Russian Sawn-off Community 2022
	find us: https://dsc.gg/sawncommunity
	Author: 1NS 
*/

// IMPORTANT: The system works through joypad detection, 
// and is not detected immediately when a player is connected.
 
#include <a_samp>
#define FILTERSCRIPT

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	new nickname[MAX_PLAYER_NAME];
	new string[128];
	
	if(oldstate == PLAYER_STATE_SPAWNED && newstate == PLAYER_STATE_ONFOOT)
	{
		if(GetPVarInt(playerid, "Mobile"))
		{
			GetPlayerName(playerid, nickname, sizeof(nickname));
			format(string, sizeof(string), 
			"%s(%d) was kicked. Reason: Mobile client", nickname, playerid);
			SendClientMessageToAll(-1, string);
			Kick(playerid);
			return 0;
		}
	}
	return 1;
}

public OnPlayerConnect(playerid)
{
	// Using a mobile clients dirty bug
	// Mobile player completely freezes after recieve empty dialog
	ShowPlayerDialog(playerid, 0, DIALOG_STYLE_LIST, "", "", "Test", "");		
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if (dialogid == 0) // Stub
	{
		// A stub for dialogs of type DIALOG_STYLE_MSGBOX 
		// use it if you do not need to use response actions. 
		// Example: (For displaying information only)
	}
	return 1;
}

public OnPlayerUpdate(playerid)
{
	new keys, ud, lr;
	GetPlayerKeys(playerid, keys, ud, lr);
	if ((ud != 128 && ud != 0 && ud != -128) || (lr != 128 && lr != 0 && lr != -128))
	{
		SetPVarInt(playerid, "Mobile", 1);
	}
	return 1;
}