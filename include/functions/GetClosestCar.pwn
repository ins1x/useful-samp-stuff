stock GetDistanceToCar(playerid,carid) 
{
    //By Darkrealm (Edited by Sacky)
    new Float:dis;
    new Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2;
    if (!IsPlayerConnected(playerid)) {
        return -1;
    }
    GetPlayerPos(playerid,x1,y1,z1);
    GetVehiclePos(carid,x2,y2,z2);
    dis = floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)
    + floatpower(floatabs(floatsub(y2,y1)),2) + floatpower(floatabs(floatsub(z2,z1)),2));
    return floatround(dis);
}

stock GetClosestCar(playerid) 
{
    if (!IsPlayerConnected(playerid)) {
        return -1;
    }
    new Float:prevdist = 100000.000;
    new prevcar;
    for (new carid = 0; carid < MAX_VEHICLES; carid++) {
        if(carid != GetPlayerVehicleID(playerid))
        {
            new Float:dist = GetDistanceToCar(playerid,carid);
            if ((dist < prevdist)) {
                prevdist = dist;
                prevcar = carid;
            }
        }
    }
    return prevcar;
}