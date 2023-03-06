/*
	Filterscript: 
	Description: 
	Author: 
*/

// Below is a list of callbacks available in SA-MP and its call sequence.
// https://open.mp/docs/scripting/resources/callbacks-sequence

#include <a_samp>

#define FILTERSCRIPT
// ----------------------------------------------------------------------------
#define KickPlayerEx(%0) SetTimerEx("KickPlayer", 500, 0, "d", %0)

// Y_Less foreach macro
#tryinclude <foreach>
#if !defined foreach
	#define foreach(%1,%2) for (new %2 = 0; %2 < MAX_PLAYERS; %2++) if (IsPlayerConnected(%2))
	#define __SSCANF_FOREACH__
#endif

#if !defined _samp_included
	#error "Please include a_samp or a_npc before foreach"
#endif

#if !defined isnull
	#define isnull(%0) ((!(%0[0])) || (((%0[0]) == '\1') && (!(%0[1]))))
#endif
// ----------------------------------------------------------------------------

//main() {}

public OnFilterScriptInit()
{
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
	return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[128], tmp[128], idx;
	cmd = strtok(cmdtext, idx);
	
	if (!strcmp(cmdtext, "/testiterate", true))
	{
		foreach(new p : Player)
		{
			SendClientMessage(p, -1, "testiterate");
		}
		return 1;
	}
	
	if (!strcmp("/testcmd", cmd, true))
	{
		tmp = strtok(cmdtext, idx);
		new id = strval(tmp);
		
		if (!strlen(tmp)) return 1;
		
		SendClientMessage(id, -1, "testcmd");
		return 1;
	}
	return 0;
}

// This (strtok) is used to search a string and find a variable typed after
// a " " (space), then return it as a string.
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