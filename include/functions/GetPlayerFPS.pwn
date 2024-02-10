// Get player framerate (PVAR version)
GetPlayerFPS(playerid)
{
	new drunk2 = GetPlayerDrunkLevel(playerid);
	if(drunk2 < 100){
	    SetPlayerDrunkLevel(playerid,2000);
	}else{
	    if(GetPVarInt(playerid, "drunk") != drunk2){
	        new fps = GetPVarInt(playerid, "drunk") - drunk2;
	        if((fps > 0) )// && (fps < 200))
   			SetPVarInt(playerid, "fps", fps);
			SetPVarInt(playerid, "drunk", drunk2);
		}
	}
	return GetPVarInt(playerid, "fps");
}