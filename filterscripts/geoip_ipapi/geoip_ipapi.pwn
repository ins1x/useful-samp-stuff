/*
	Filterscript: geoip_ipapi
	Description: geoip based on https://ip-api.com/ service
	Features: 
	- you get all the data online, no need to store the database
	- good VPN/Proxy checker 
	- precise definition player's geoip
	Author: 1NS
	Warning: DON'T USE THIS FILTERSCRIPT WITHOUT MODIFICATION ON A LIVE SERVER!
			 No admin rights check!!!
	License: ip-api.com is free for non-commercial use
	(limited to 45 HTTP requests per minute from an IP address.)
*/

#include <a_samp>
#include <a_http> 
#include sscanf2 
// Download latest sscanf2 version from
// https://github.com/Y-Less/sscanf/releases
#define FILTERSCRIPT

// Change here to your values
#define DIALOG_STALK 	6001
#define DIALOG_IPTABLE  6002
#define COLOR_MSG		0xAFAFAFAA

// Kick wtih delay 
#define KickPlayerEx(%0) SetTimerEx("KickPlayer", 500, 0, "d", %0)

// FORWARDS //
forward ProxyCheck(playerid); // VPN and proxy checker
forward GeoIPLookingFor(playerid, response_code, data[]); // get geo ip data
forward GeoIPLoadData(playerid); // load player geoip data

// when integrating into your gamemode, replace this
forward DropCounters(); // server service (drop counters)

new GeoIPAsklimit; // Geoip asklimit counter Max 45
new PROXY_CHECKER_ACTION = 1; // 0 Disabled, 1 warnning, 2 kick

enum GeoIpInfo
{ 
	pSource, // 1 - ip-api, 2 - localbase
	pContinent[32],
	pCity[32],
	pCountry[32],
	pRegion[32],
	pIsp[64],
	pProxy[6]
}
new PlayerGeoIPInfo[MAX_PLAYERS][GeoIpInfo];
new NULL_PlayerGeoIPInfo[GeoIpInfo];


public OnFilterScriptInit()
{
	GeoIPAsklimit = 0;
	SetTimer("DropCounters", 1000*60, true);
	SendClientMessageToAll(COLOR_MSG, "Geoip system loaded. Type /stalk for the test");
	return 1;
}

public OnFilterScriptExit()
{
	for (new p = 0; p < MAX_PLAYERS; p++) 
	{
		PlayerGeoIPInfo[p] = NULL_PlayerGeoIPInfo;
	}
	return 1;
}

public OnPlayerConnect(playerid)
{
	GeoIPLoadData(playerid);
	
	// Example: Russian language autopreset based on geoip
	/*if(strfind(PlayerGeoIPInfo[playerid][pCountry], "Russia", true) != -1
	|| strfind(PlayerGeoIPInfo[playerid][pCountry], "Belarus", true) != -1)
	pData[playerid][pLang] = 0; // RU
	else pData[playerid][pLang] = 1; // Default EN*/
	
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	PlayerGeoIPInfo[playerid] = NULL_PlayerGeoIPInfo;
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (!strcmp(cmdtext, "/stalk", true))
	{
		if(GetPVarInt(playerid, "LastActionDelay") > gettime())
		{
			SendClientMessage(playerid, COLOR_MSG,
			"You are using this feature too often.");
			return true;
		}
		if(GetPVarInt(playerid, "Admin") < 1) 
		{
			SetPVarInt(playerid, "LastActionDelay", gettime() + 10);
		}
		GeoIpTable(playerid, playerid);
		return true;
	}
	if (!strcmp(cmdtext, "/stalk ", true, 5))
	{
		if(!cmdtext[5]) 
		{
			SendClientMessage(playerid, COLOR_MSG, "Use: /stalk [ID] to show.");
			return true;
		}
		if(GetPVarInt(playerid, "LastActionDelay") > gettime())
		{
			SendClientMessage(playerid, COLOR_MSG,
			"You are using this feature too often.");
		    return true;
		}
		if(GetPVarInt(playerid, "Admin") < 1) 
		{
			SetPVarInt(playerid, "LastActionDelay", gettime() + 10);
		}
		new id = strval(cmdtext[6]);
		GeoIpTable(playerid, id);
		return true;
	}
	if (!strcmp(cmdtext, "/iptable", true))
	{
		IpTable(playerid);
		return true;
	}
	
	return 0;
}



public GeoIPLoadData(playerid)
{
	// Load Player GeoIP data OnPlayerConnect
	// request examples:
	// https://ip-api.com/docs/api:newline_separated#test

	new ip[16], request[128];
	GetPlayerIp(playerid, ip, sizeof ip);
	if(strcmp(ip, "127.0.0.1", false))// ignore localhost connections
	{
		if(GeoIPAsklimit < 40) // Max 45 requests per minute
		{
			format(request, sizeof(request),
			"ip-api.com/line/%s?fields=continent,country,regionName,city,isp,proxy",ip);
			HTTP(playerid, HTTP_GET, request, "", "GeoIPLookingFor");
		} else {
			print("Error: Geo IP request limit exceeded");
		}
	} else {
		if(GeoIPAsklimit < 40) // Max 45 requests per minute
		{// localhost test request
			format(request, sizeof(request),
			"ip-api.com/line/%s?fields=continent,country,regionName,city,isp,proxy","8.8.8.8");
			HTTP(playerid, HTTP_GET, request, "", "GeoIPLookingFor");
		}
	}
	return 1;
}

public GeoIPLookingFor(playerid, response_code, data[])
{
	// Get GeoIP data from https://ip-api.com/
	// The free endpoint is limited to 45 requests / minute
	
	if(response_code == 200)
	{
		#if defined _INC_SSCANF
			PlayerGeoIPInfo[playerid][pSource] = 1;
			sscanf(data, "p<\n>s[32]s[32]s[32]s[32]s[64]s[7]",
			PlayerGeoIPInfo[playerid][pContinent],
			PlayerGeoIPInfo[playerid][pCountry],
			PlayerGeoIPInfo[playerid][pRegion],
			PlayerGeoIPInfo[playerid][pCity],
			PlayerGeoIPInfo[playerid][pIsp],
			PlayerGeoIPInfo[playerid][pProxy]);
			//printf("%s", data);
			data[0] = EOS;
		#endif
		DeletePVar(playerid, "FailedGeoIPAsks");
	} else {
		if(GetPVarInt(playerid, "FailedGeoIPAsks") < 1)
		{
			SetTimerEx("GeoIPLoadData", 15*1000, false, "i", playerid); // repeat request
			SetPVarInt(playerid, "FailedGeoIPAsks", 1);
		}
	}
	return 1;
}

public ProxyCheck(playerid)
{
	// Proxy checker. Get data from https://ip-api.com/
	// Look public GeoIPLookingFor for more info
	new string[128], ip[16];
	GetPlayerIp(playerid, ip, sizeof ip);
	if(strcmp(ip, "127.0.0.1", false))// ignore localhost connections
	{	
		/*if(strfind(country, "Unknown", true) != -1)
		{
			new string[128];
			format(string, sizeof(string),
			"%s(%d) is trying to connect from an unknown location. Possible usage of VPN or Proxy",
			PlayerName(playerid), playerid);
			SendClientMessageToAll(COLOR_MSG, string);
			if(PROXY_CHECKER_ACTION == 2)
			{
				format(string, sizeof(string),
				"%s(%d) is using VPN or Proxy [2].",
				PlayerName(playerid), playerid);
				KickPlayerEx(playerid);
			}
		}*/
	
		if(strfind(PlayerGeoIPInfo[playerid][pProxy], "true", true) != -1)
		{
			//new string[128];
			format(string, sizeof(string),
			"%s(%d) is using VPN or Proxy.",
			PlayerName(playerid), playerid);
			if(PROXY_CHECKER_ACTION == 1) 
			{
				SendClientMessageToAll(COLOR_MSG, string);
			}
			if(PROXY_CHECKER_ACTION == 2) 
			{
				SendClientMessageToAll(COLOR_MSG, string);
				KickPlayerEx(playerid);
			}
		}
	}
}

stock IpTable(playerid)
{
	// Show all players IP table 
	new ip[16], string[128], iptable[700];
	
	if (GetPVarInt(playerid, "Admin") == 2)
	{
		strcat(iptable, "Player\tIP\tCountry\n"); 
		for (new i = 0; i < MAX_PLAYERS; i++) 
		{	
			if(GetPVarInt(i, "Admin") < 3)
			{
				GetPlayerIp(i, ip, sizeof(ip));
				format(string, sizeof(string), "(%d)%s\t{ff9900}%s\t%s\n",
				i, PlayerName(i), ip, PlayerGeoIPInfo[i][pCountry]);
				strcat(iptable, string);
			}
		}
	}
	else if (GetPVarInt(playerid, "Admin") >= 3)
	{
		strcat(iptable, "Player\tIP\tCountry\n"); 
		for (new i = 0; i < MAX_PLAYERS; i++) 
		{	
			GetPlayerIp(i, ip, sizeof(ip));
			format(string, sizeof(string), "(%d)%s\t{ff9900}%s\t%s\n",
			i, PlayerName(i), ip, PlayerGeoIPInfo[i][pCountry]);
			strcat(iptable, string);
		}
	} else {
		strcat(iptable, "Player\tCountry\n"); 
		for (new i = 0; i < MAX_PLAYERS; i++) 
		{	
			if(GetPVarInt(i, "Admin") < 3)
			{
				GetPlayerIp(i, ip, sizeof(ip));
				format(string, sizeof(string), "(%d)%s\t%s\n",
				i, PlayerName(i), PlayerGeoIPInfo[i][pCountry]);
				strcat(iptable, string);
			}
		}
	}
	
	ShowPlayerDialog(playerid, DIALOG_IPTABLE, DIALOG_STYLE_TABLIST_HEADERS,
	"IP table", iptable, "Select", "Cancel");
}

stock GeoIpTable(playerid, targerplayerid)
{
	/*
	Get geolocation and internet provider (ISP) info 
	used in /stalk <ID> command
	returns a table with data
	*/
	
	new ip[16], header[64], tbtext[512];
	new string[128];

	if(IsPlayerConnected(targerplayerid))
	{
		GetPlayerIp(targerplayerid, ip, sizeof(ip));
		if(strcmp(ip, "127.0.0.1", true) == 0)
		{
			//SendClientMessageEx(playerid, COLOR_MSG,
			//"На локалхосте данные не отображаются полностью",
			//"On localhost, the data is not displayed completely");
			
			SendClientMessage(playerid, COLOR_MSG,
			"On localhost you see result for Google DNS request");
		}
		
		if(PlayerGeoIPInfo[targerplayerid][pSource] == 1)
		{
			format(header, sizeof(header), "Stalk");
		}
		else if (PlayerGeoIPInfo[targerplayerid][pSource] == 2)
		{
			format(header, sizeof(header), "Stalk [Localbase]");
		} else {
			format(header, sizeof(header), "Stalk");
		}
		if(strcmp(ip, "127.0.0.1", true) == 0)
		{
			format(header, sizeof(header), "Stalk [DNS test]");
		}
		
		format(tbtext, sizeof(tbtext), 
		"{FFFFFF}Player: {FFD700}%s(%d)\n"\
		"{FFFFFF}Continent: {FFD700}%s\n"\
		"{FFFFFF}Country: {FFD700}%s\n"\
		"{FFFFFF}Region: {FFD700}%s\n"\
		"{FFFFFF}City: {FFD700}%s\n"\
		"{FFFFFF}Provider: {FFD700}%s\n"\
		"{FFFFFF}Proxy: {FFD700}%s",
		PlayerName(targerplayerid), targerplayerid,
		PlayerGeoIPInfo[targerplayerid][pContinent],
		PlayerGeoIPInfo[targerplayerid][pCountry],
		PlayerGeoIPInfo[targerplayerid][pRegion],
		PlayerGeoIPInfo[targerplayerid][pCity],
		PlayerGeoIPInfo[targerplayerid][pIsp],
		PlayerGeoIPInfo[targerplayerid][pProxy]);
		
		format(string, sizeof(string), "%s(%d) is stalking player %s(%d).",
		PlayerName(playerid), playerid, PlayerName(targerplayerid), targerplayerid);
		SendClientMessageToAll(COLOR_MSG, string);
	} else { 
		SendClientMessage(playerid, COLOR_MSG, "This player isn't connected.");
	}
	
	ShowPlayerDialog(playerid, DIALOG_STALK, DIALOG_STYLE_MSGBOX, header, tbtext, "Ok", "");
}

public DropCounters() 
{
	/* Server service timer. Work every 60 sec */
	// Drop geoip limit protect counter
	GeoIPAsklimit = 0;
	
	return true;
}

stock PlayerName(playerid)
{
	// Return player login name
	new NickName[MAX_PLAYER_NAME]; 
	GetPlayerName(playerid, NickName, sizeof(NickName));
	return NickName;
}