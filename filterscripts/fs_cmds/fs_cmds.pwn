/*
	Filterscript: fs_cmds (Filterscript commands)
	Description: A set of commands for quick work with filterscripts without rcon rights 
	Author: 1NS 
*/

#include <a_samp>
// IMPORTANT !!! YSF work with server 0.3.7 R2 or highter 
// Download it: https://github.com/IllidanS4/YSF/wiki
#tryinclude <YSF>

#define FILTERSCRIPT

#if !defined isnull
	#define isnull(%0) ((!(%0[0])) || (((%0[0]) == '\1') && (!(%0[1]))))
#endif

// NOTICE: Replace IsPlayerModerator(playerid) stock with your admin check
// ----------------------------------------------------------------------------

public OnFilterScriptInit()
{
	print("fs_cmds loaded. Use cmds /listfs, /loadfs, /unloadfs, /reloadfs");
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[128], tmp[128], idx;
	cmd = strtok(cmdtext, idx);
	
	if (!strcmp(cmdtext, "/listfs", true))
	{
		if(!IsPlayerModerator(playerid)) return 0;
		
		#if defined _YSF_included
		new scriptname[64];
		for(new i; i != 16; i++)
		{
			GetFilterScriptName(i, scriptname);
			if(isnull(scriptname)) continue; // If no FS
			SendClientMessagef(playerid, -1, "%d. - %s", i, scriptname);
		}
		#else 
			SendClientMessage(playerid, -1,
			"Need YSF plugin for use it");
		#endif
		return true;
	}
	if (!strcmp("/loadfs", cmd, true))
	{
		tmp = strtok(cmdtext, idx);
		
		if(!IsPlayerModerator(playerid)) return 0;
		
		if (strlen(tmp) == 0 || strlen(tmp) > 24) {
			SendClientMessage(playerid, -1,	"Use /listfs to show loaded filterscripts");
			return true;
		}
		
		SetPVarString(playerid, "lastfs", tmp);
		new tmpstr[64];
		format(tmpstr, sizeof tmpstr, "loadfs %s", tmp);
		SendRconCommand(tmpstr);
		return true;
	}
	if (!strcmp("/unloadfs", cmd, true))
	{
		tmp = strtok(cmdtext, idx);
		
		if(!IsPlayerModerator(playerid)) return 0;
		
		if (strlen(tmp) == 0 || strlen(tmp) > 24) {
			SendClientMessage(playerid, -1,	"Use /listfs to show loaded filterscripts");
			return true;
		}
		
		new tmpstr[64];
		format(tmpstr, sizeof tmpstr, "unloadfs %s", tmp);
		SendRconCommand(tmpstr);
		return true;
	}
	if (!strcmp("/reloadfs", cmd, true))
	{
		if(!IsPlayerModerator(playerid)) return 0;
		
		tmp = strtok(cmdtext, idx);
		new tmpstr[64];
		if (strlen(tmp) == 0 || strlen(tmp) > 24)
		{
			new lastfs[24];
			GetPVarString(playerid, "lastfs", lastfs, sizeof lastfs);
			if(strlen(lastfs) > 0)
			{
				format(tmpstr, sizeof tmpstr, "unloadfs %s", tmp);
				SendRconCommand(tmpstr);
				format(tmpstr, sizeof tmpstr, "loadfs %s", tmp);
				SendRconCommand(tmpstr);
				SendClientMessage(playerid, -1, "Filtescript reloaded");
			} 
			else SendClientMessage(playerid, -1, "Last filtescript not found");
		} else {
			format(tmpstr, sizeof tmpstr, "unloadfs %s", tmp);
			SendRconCommand(tmpstr);
			format(tmpstr, sizeof tmpstr, "loadfs %s", tmp);
			SendRconCommand(tmpstr);
			SendClientMessage(playerid, -1, "Filtescript reloaded");
		}
		return true;
	}
	return 0;
}

// Replace stock with your admin check
stock IsPlayerModerator(playerid)
{
	if(GetPVarInt(playerid, "Moderator")) return 1;
	else return 0;
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