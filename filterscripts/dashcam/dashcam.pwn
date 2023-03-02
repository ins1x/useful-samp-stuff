/*
	Filterscript: Dashcam
	Description: Adds a textdrav simulating a police camera
	Author: 1NS 
*/

#include <a_samp>
#define FILTERSCRIPT

// Dash Cam TXD (etc Police cam)
new PlayerText:DashCam[MAX_PLAYERS];
new PlayerText:DashCam2[MAX_PLAYERS];
new bool:DashCamEnabled[MAX_PLAYERS];

public OnFilterScriptInit()
{
	print("Dashcam FS Loaded. Type /dashcam to show Textdraw");
	return 1;
}

public OnFilterScriptExit()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		PlayerTextDrawDestroy(i, DashCam[i]);
		PlayerTextDrawDestroy(i, DashCam2[i]);
	
		DashCamEnabled[i] = false;
	}
	return 1;
}

public OnPlayerConnect(playerid)
{
	//DashCam[playerid] = CreatePlayerTextDraw(playerid,200.0, 15.0, "");
	DashCam[playerid] = CreatePlayerTextDraw(playerid,150.0, 105.0, "");
	PlayerTextDrawLetterSize(playerid, DashCam[playerid], 0.4, 1.0);
	PlayerTextDrawAlignment(playerid, DashCam[playerid], 1);
	PlayerTextDrawColor(playerid, DashCam[playerid], -1);
	PlayerTextDrawSetShadow(playerid, DashCam[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DashCam[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DashCam[playerid], 51);
	PlayerTextDrawFont(playerid, DashCam[playerid], 2);
	PlayerTextDrawSetProportional(playerid, DashCam[playerid], 1);

	//DashCam2[playerid] = CreatePlayerTextDraw(playerid,400.0, 15.0, "");
	DashCam2[playerid] = CreatePlayerTextDraw(playerid,415.0, 105.0, "");
	PlayerTextDrawLetterSize(playerid, DashCam2[playerid], 0.4, 1.0);
	PlayerTextDrawAlignment(playerid, DashCam2[playerid], 1);
	PlayerTextDrawColor(playerid, DashCam2[playerid], -1);
	PlayerTextDrawSetShadow(playerid, DashCam2[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DashCam2[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DashCam2[playerid], 51);
	PlayerTextDrawFont(playerid, DashCam2[playerid], 2);
	PlayerTextDrawSetProportional(playerid, DashCam2[playerid], 1);
	
	PlayerTextDrawHide(playerid, DashCam[playerid]);
	PlayerTextDrawHide(playerid, DashCam2[playerid]);
	
	DashCamEnabled[playerid] = false;
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	PlayerTextDrawDestroy(playerid, DashCam[playerid]);
	PlayerTextDrawDestroy(playerid, DashCam2[playerid]);
	
	DashCamEnabled[playerid] = false;
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(oldstate == PLAYER_STATE_DRIVER && newstate == PLAYER_STATE_ONFOOT)
	{
		if(DashCamEnabled[playerid])
		{
			PlayerTextDrawHide(playerid, DashCam[playerid]);
			PlayerTextDrawHide(playerid, DashCam2[playerid]);
		}
	}
	if(newstate == PLAYER_STATE_DRIVER)
	{
		if(DashCamEnabled[playerid])
		{
			PlayerTextDrawShow(playerid, DashCam[playerid]);
			PlayerTextDrawShow(playerid, DashCam2[playerid]);
		}
	}
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (!strcmp(cmdtext, "/dashcam", true))
	{
		if(DashCamEnabled[playerid])
		{
			DashCamEnabled[playerid] = false;
			SendClientMessage(playerid, -1, "Dash cam - {FF0000}[disabled]");
			PlayerTextDrawHide(playerid, DashCam[playerid]);
			PlayerTextDrawHide(playerid, DashCam2[playerid]);
		} else {
			DashCamEnabled[playerid] = true;
			SendClientMessage(playerid, -1, "Dash cam - {00FF00}[enabled]");
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
			{	
				SendClientMessage(playerid, -1, 
				"Infotmation from the camera is displayed only in the car");
			}
			PlayerTextDrawShow(playerid, DashCam[playerid]);
			PlayerTextDrawShow(playerid, DashCam2[playerid]);
		}
		return 1;
	}
	return 0;
}

public OnPlayerUpdate(playerid)
{
	if(DashCamEnabled[playerid] && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		new dashcam_data[64], dashcam_data2[64];
		new year,month,day,hour,minute,second;
		getdate(year, month, day);
		gettime(hour, minute, second);
		new copunit[12];
		switch(GetVehicleModel(GetPlayerVehicleID(playerid)))
		{
			case 497, 523, 430: format(copunit, sizeof(copunit), "PD");
			case 596: format(copunit, sizeof(copunit), "LSPD");
			case 597: format(copunit, sizeof(copunit), "SFPD");
			case 598: format(copunit, sizeof(copunit), "LVPD");
			case 599: format(copunit, sizeof(copunit), "RANGER");
			case 601, 427: format(copunit, sizeof(copunit), "S.W.A.T");
			case 490, 528: format(copunit, sizeof(copunit), "F.B.I");
			default: format(copunit, sizeof(copunit), "CAM");
		}
		if(hour < 12)
		{
			format(dashcam_data, sizeof(dashcam_data),
			"AM %d:%d:%d ~n~%s %d~n~%d kph", hour, minute, second, copunit,
			GetVehicleModel(GetPlayerVehicleID(playerid)), GetPlayerSpeed(playerid));
		} else {
			format(dashcam_data, sizeof(dashcam_data),
			"PM %d:%d:%d ~n~%s %d~n~%d kph", hour, minute, second, copunit,
			GetVehicleModel(GetPlayerVehicleID(playerid)), GetPlayerSpeed(playerid));
		}
		new rectimestr[48];
		new rectime = NetStats_GetConnectedTime(playerid)/60000; 
		if(rectime > 60)
		{
			format(rectimestr, sizeof(rectimestr), "%d:%d",
			floatround(rectime / 60), rectime % 60);
		} else {
			format(rectimestr, sizeof(rectimestr), "0:%d", rectime);
		}
		PlayerTextDrawSetString(playerid, DashCam[playerid], dashcam_data);
		format(dashcam_data2,sizeof(dashcam_data2),
		"%d %d   %d~n~~r~.~w~REC %s", day, month, year, rectimestr);
		PlayerTextDrawSetString(playerid, DashCam2[playerid], dashcam_data2);
	}
	return 1;
}

stock GetPlayerSpeed(playerid, bool:kmh = true)
{
	// Return player move speed. This function using for anticheat system
	new Float:Vx,Float:Vy,Float:Vz,Float:rtn;
	if(IsPlayerInAnyVehicle(playerid)) GetVehicleVelocity(GetPlayerVehicleID(playerid),Vx,Vy,Vz);
	else GetPlayerVelocity(playerid,Vx,Vy,Vz);
	rtn = floatsqroot(floatabs(floatpower(Vx + Vy + Vz,2)));
	return kmh?floatround(rtn * 100 * 1.61):floatround(rtn * 100);
}