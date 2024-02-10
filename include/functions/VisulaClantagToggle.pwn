// Created for RSC server
// Remove clan tag from player nickname
stock RemoveClanTagFromName(playerid) 
{
    new start, end, string[MAX_PLAYER_NAME];
	GetPlayerName(playerid, string, MAX_PLAYER_NAME);
    start = strfind(string, "[", true);
    end = strfind(string, "]", true);
    if (start >= end) {
		return string;
    } else {
        strdel(string, start, end + 1);
        return string;
    }
}

// Hide clan tag (without change origignal nickname)
// Require YSF plugin https://github.com/IS4Code/YSF
#if defined _YSF_included
stock VisualToggleClanTag(id, toggle)
{ 
    // Ignore team id 2 as default (used for SPECTATORS team)	
	new newname[MAX_PLAYER_NAME], name[MAX_PLAYER_NAME];
	GetPlayerName(id, name, MAX_PLAYER_NAME);
	new team = GetPVarInt(id, "Team");
	if(team != 2) format(newname, sizeof(newname),"[%s]%s", ClanName[team], RemoveClanTagFromName(id));

	foreach(Player, i) 
	{
		if(GetPVarInt(i, "Team") != 2)
		{	
			if(toggle)
			{		
				SetPlayerNameForPlayer(i, id, newname);
				SetPlayerNameInServerQuery(id, newname);
			} else {
				SetPlayerNameForPlayer(i, id, name);
				ResetPlayerNameInServerQuery(id);
			}
		}
	}

	return 0;
}
#endif