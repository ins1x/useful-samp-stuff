stock GetPlayerSpeed(playerid)
{
	// Return player move speed. This function using for anticheat system
	// IMPORTANT: Better use nex-ac AntiCheatGetSpeed function
	#if defined _nex_ac_included
		return AntiCheatGetSpeed(playerid);
	#else
		new bool:kmh = true;
		new Float:Vx,Float:Vy,Float:Vz,Float:rtn;
		if(IsPlayerInAnyVehicle(playerid)) GetVehicleVelocity(GetPlayerVehicleID(playerid),Vx,Vy,Vz); else GetPlayerVelocity(playerid,Vx,Vy,Vz);
		rtn = floatsqroot(floatabs(floatpower(Vx + Vy + Vz,2)));
		return kmh?floatround(rtn * 100 * 1.61):floatround(rtn * 100);
	#endif
}