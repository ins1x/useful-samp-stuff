//Vehicle Exported with Texture Studio By: [uL]Pottus, Crayder, Svyatoy, encoder, devhub/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#include <a_samp>
#include <streamer>

new carvid;

public OnFilterScriptInit()
{ 
    new tmpobjid;

    carvid = CreateVehicle(451,1113.116,-1564.715,13.250,229.899,0,0,-1,0);

    SetVehicleVirtualWorld(carvid_9, 0);
    LinkVehicleToInterior(carvid_9, 0);
} 

public OnFilterScriptExit()
{ 
    DestroyVehicle(carvid);
} 

public OnVehicleSpawn(vehicleid)
{ 
    if(vehicleid == carvid)
    { 
    } 
} 


{ "[name]", [minx], [miny], [maxx], [maxy], 0x[color-hex]FF },

---
{ "Zone 1", 1042, -1574.5, 1206, -1388.5, 0xFF0000FF },

//CreateDynamicCuboid(Float:minx, Float:miny, Float:minz, Float:maxx, Float:maxy, Float:maxz, worldid = -1, interiorid = -1, playerid = -1)
new areaid = CreateDynamicCuboid(1042, -1574.5, 13.0, 1206, -1388.5, 95.0, 0, 0);