#include <a_samp>
#include <streamer>

#define FILTERSCRIPT

/*
	Filterscript: 
	Description: 
	Author: 
*/

// Below is a list of callbacks available in SA-MP and its call sequence. Tickbox represent called first.
// https://open.mp/docs/scripting/resources/callbacks-sequence

// Streamer Wiki
// https://github.com/samp-incognito/samp-streamer-plugin/wiki/Callbacks

//main()
//{}

#if defined _streamer_included
#endif

public OnFilterScriptInit()
{
   return 1;
}

public OnFilterScriptExit()
{
   return 1;
}

public OnDynamicObjectMoved(objectid)
{
	return 1;
}

public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	return 1;
}

public OnPlayerSelectDynamicObject(playerid, objectid, modelid, Float:x, Float:y, Float:z)
{
	return 1;
}

public OnPlayerShootDynamicObject(playerid, weaponid, objectid, Float:x, Float:y, Float:z)
{
	// If a return value of 0 is specified, the weapon shot will not be registered.
	return 1;
}

public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
	return 1;
}

public OnPlayerEnterDynamicCP(playerid, checkpointid)
{
	return 1;
}

public OnPlayerLeaveDynamicCP(playerid, checkpointid)
{
	return 1;
}

public OnPlayerEnterDynamicRaceCP(playerid, checkpointid)
{
	return 1;
}

public OnPlayerLeaveDynamicRaceCP(playerid, checkpointid)
{
	return 1;
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
	return 1;
}

public OnPlayerLeaveDynamicArea(playerid, areaid)
{
	return 1;
}

public OnPlayerGiveDamageDynamicActor(playerid, actorid, Float:amount, weaponid, bodypart)
{
	return 1;
}

public OnDynamicActorStreamIn(actorid, forplayerid)
{
	return 1;
}

public OnDynamicActorStreamOut(actorid, forplayerid)
{
	return 1;
}

public Streamer_OnPluginError(const error[])
{
	return 1;
}

// Default public section
public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
   return 1;
}

public OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ)
{
   return 1;
}

public OnPlayerSelectObject(playerid, type, objectid, modelid, Float:fX, Float:fY, Float:fZ)
{
   return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
   return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
   return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
   return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
   return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
   return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
   return 1;
}

public OnActorStreamIn(actorid, forplayerid)
{
   return 1;
}

public OnActorStreamOut(actorid, forplayerid)
{
   return 1;
}

public OnObjectMoved(objectid)
{
   return 1;
}