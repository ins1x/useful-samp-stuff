// Required https://github.com/karimcambridge/samp-foreach

stock GetClosestPlayer(playerid)
{
    new nearest_player = INVALID_PLAYER_ID,
        Float:nearest_distance = 99999.99,
        Float:player_distance,
        Float:x, Float:y, Float:z;

    GetPlayerPos(playerid, x, y, z);
    foreach(new i: Player) {

        if(i == playerid) continue;
        player_distance = GetPlayerDistanceFromPoint(i, x, y, z);

        if(player_distance < nearest_distance) {
            nearest_distance = player_distance;
            nearest_player = i;
        }
    }
    return nearest_player;
}

stock Float: GetDistanceBetweenPlayers(Player1, Player2)
{
    static
    	Float: fX, Float: fY, Float: fZ, Float: fDistance;

    if( GetPlayerVirtualWorld( Player1 ) == GetPlayerVirtualWorld( Player2 ) 
	&& GetPlayerPos( Player2, fX, fY, fZ ) )
		fDistance = GetPlayerDistanceFromPoint( Player1, fX, fY, fZ );

    return fDistance;
}