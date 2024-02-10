stock ReSpawnPlayer(playerid)
{
    // Valid "playerid" check inside "GetPlayerVehicleID".
    
    if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING) return 1;
    
    new
        vid = GetPlayerVehicleID(playerid);
    if (vid)
    {
        new
            Float:x,
            Float:y,
            Float:z;
        // Remove them without the animation.
        GetVehiclePos(vid, x, y, z),
        SetPlayerPos(playerid, x, y, z);
    }
    
    return SpawnPlayer(playerid);
}