// Filterscript: afly
// Description: Simple admin fly system

#include <a_samp>

new bool:OnFly[MAX_PLAYERS];
forward SurflyMode(playerid);

public OnPlayerConnect(playerid)
{
    OnFly[playerid] = false;
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    OnFly[playerid] = false;
    return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	OnFly[playerid] = false;
}

public OnPlayerCommandText(playerid, cmdtext[])
{  
	if (!strcmp(cmdtext, "/surfly", true) || !strcmp(cmdtext, "/afly", true))
	{
		SurflyMode(playerid);
		return true;
	}
	return 0;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys == KEY_SECONDARY_ATTACK) // ENTER
	{
		if(OnFly[playerid]) SurflyMode(playerid);// disable surfly
	}
	return 1;
}

public OnPlayerUpdate(playerid)
{
	if(OnFly[playerid])
	{
		new k, ud,lrk;
		GetPlayerKeys(playerid,k,ud,lrk);
		new Float:v_x,Float:v_y,Float:v_z,
			Float:x,Float:y,Float:z;
		if(ud < 0)	// forward
		{
			GetPlayerCameraFrontVector(playerid,x,y,z);
			v_x = x+0.1;
			v_y = y+0.1;
		}
		if(k & 128)	// down
			v_z = -0.4;
		else if(k & KEY_FIRE)	// up
			v_z = 0.2;
		if(k & KEY_JUMP)	// fast
		{
			v_x *=4.0;
			v_y *=4.0;
			v_z *=4.0;
		}
		if(k & KEY_SPRINT)	// up
		{
			v_z = 0.2;
		}
		if(k & KEY_WALK)	// down
		{
			v_z = -0.4;
		}
		if(v_z == 0.0) 
			v_z = 0.025;
		SetPlayerVelocity(playerid,v_x,v_y,v_z);
		if(v_x == 0 && v_y == 0)
		{	
			if(GetPlayerAnimationIndex(playerid) == 959)	
				ApplyAnimation(playerid,"PARACHUTE","PARA_steerR",6.1,1,1,1,1,0,1);
		}
		else 
		{
			GetPlayerCameraFrontVector(playerid,v_x,v_y,v_z);
			GetPlayerCameraPos(playerid,x,y,z);
			SetPlayerLookAt(playerid,v_x*500.0+x,v_y*500.0+y);
			if(GetPlayerAnimationIndex(playerid) != 959)
				ApplyAnimation(playerid,"PARACHUTE","FALL_SkyDive_Accel",6.1,1,1,1,1,0,1);
		}
	}
	return 1;
}

public SurflyMode(playerid)
{
	new Float:x,Float:y,Float:z;
	if(OnFly[playerid])
	{
		OnFly[playerid] = false;
		GetPlayerPos(playerid,x,y,z);
		SetPlayerPos(playerid,x,y,z);
		SetPlayerHealth(playerid, 100.0);
		GameTextForPlayer(playerid, "~r~ADMIN~w~ FLY", 3000, 5);
	} else {
		OnFly[playerid] = true;
		GetPlayerPos(playerid,x,y,z);
		SetPlayerPos(playerid,x,y,z+5.0);
		ApplyAnimation(playerid,"PARACHUTE","PARA_steerR",6.1,1,1,1,1,0,1);
		SetPlayerHealth(playerid, 99999);
		GameTextForPlayer(playerid, "~g~ADMIN~w~ FLY", 3000, 5);
		SendClientMessage(playerid, -1,
		"You have entered surfly mode. {FF0000}F / ENTER{FFFFFF} - exit flight mode");
		GameTextForPlayer(playerid, 
		"~r~<LMB/KEY_SPRINT>~w~ - increase height~n~\
		~r~<RMB/KEY_WALK>~w~ - reduce height~n~\
		~r~<KEY_JUMP>~w~ - accelerate", 5000, 5);
	}
	return true;
}

stock SetPlayerLookAt(playerid,Float:x,Float:y)
{
	new Float:Px, Float:Py, Float: Pa;
	GetPlayerPos(playerid, Px, Py, Pa);
	Pa = floatabs(atan((y-Py)/(x-Px)));
	if (x <= Px && y >= Py) 		Pa = floatsub(180.0, Pa);
	else if (x < Px && y < Py) 		Pa = floatadd(Pa, 180.0);
	else if (x >= Px && y <= Py)	Pa = floatsub(360.0, Pa);
	Pa = floatsub(Pa, 90.0);
	if (Pa >= 360.0) 
		Pa = floatsub(Pa, 360.0);
	SetPlayerFacingAngle(playerid, Pa);
	return;
}