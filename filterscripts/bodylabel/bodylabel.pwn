/*
	Filterscript: BodyLabel
	Description: Attach 3d text with ploss, fps, ping to player 
	Author: 1NS
*/

#include <a_samp>

#define FILTERSCRIPT

// 3D text contain player ploss, fps, ping
new Text3D:BodyLabel[MAX_PLAYERS]; 

public OnFilterScriptInit()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		BodyLabel[i] = Create3DTextLabel("_", 0x008080FF, 0, 0, 0, 15, 0, 1);
    	Attach3DTextLabelToPlayer(BodyLabel[i], i, 0.0, 0.0, -0.955);
	}
	return 1;
}

public OnFilterScriptExit()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		Delete3DTextLabel(BodyLabel[i]);
	}
	return 1;
}

public OnPlayerConnect(playerid)
{	
	// 3dtext draw distance set as 15 (Default distance is 70 SA units)
	BodyLabel[playerid] = Create3DTextLabel("_", 0x008080FF, 0, 0, 0, 15, 0, 1);
	Attach3DTextLabelToPlayer(BodyLabel[playerid], playerid, 0.0, 0.0, -0.955);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	Delete3DTextLabel(BodyLabel[playerid]);
	return 1;
}

public OnPlayerUpdate(playerid)
{
	// NOTICE: Move this move this to your update timer or function
	new tmp[128];
	format(tmp, sizeof(tmp),
	"{33AA33}PL: {FFFFFF}%.1f%%\n{33AA33}Ping: {FFFFFF}%i\n{33AA33}FPS: {FFFFFF}%.0f",
	NetStats_PacketLossPercent(playerid),
	GetPlayerPing(playerid),
	GetPlayerFPS(playerid));

	Update3DTextLabelText(BodyLabel[playerid], 0xFFFFFFFF, tmp);
	return 1;
}

GetPlayerFPS(playerid)
{
	new drunk2 = GetPlayerDrunkLevel(playerid);
	if(drunk2 < 100) {
	    SetPlayerDrunkLevel(playerid,2000);
	} else {
	    if(GetPVarInt(playerid, "drunk") != drunk2) {
	        new fps = GetPVarInt(playerid, "drunk") - drunk2;
	        if((fps > 0) )
   			SetPVarInt(playerid, "fps", fps);
			SetPVarInt(playerid, "drunk", drunk2);
		}
	}
	return GetPVarInt(playerid, "fps");
}