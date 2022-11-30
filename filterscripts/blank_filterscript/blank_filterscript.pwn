#include <a_samp>

#define FILTERSCRIPT

/*
	Filterscript: 
	Description: 
	Author: 
*/

// Below is a list of callbacks available in SA-MP and its call sequence. Tickbox represent called first.
// https://open.mp/docs/scripting/resources/callbacks-sequence


//main()
//{}

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

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid);
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
   /*if (!strcmp(cmdtext, "/testf", true)
   { 
      return 1;
   }*/
   return 0;
}
