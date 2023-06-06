/* 
    Filterscript: jizzy
    Description: Fills the Pleasure Domes loaction
    Note: Actors may not load if you use /rcon loadfs, connect filterscript via server.cfg
    Author: 1NS
*/

#include <a_samp>
#include <streamer>
#define FILTERSCRIPT

new JizzyActors[12]; 

public OnFilterScriptInit()
{
    // Mapping 
    new tmpobjid, object_world = -1, object_int = 3;
    tmpobjid = CreateDynamicObject(14540, -2650.572753, 1414.952636, 905.793640,
    0.000000, 0.000000, 89.800003, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 3531, "triadprops_lvs", "GB_restaursmll58", 0x00000000);
    
    CreateDynamicObject(2371, -2631.513183, 1403.567504, 905.400878, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    CreateDynamicObject(19176, -2636.675781, 1401.891601, 906.640869, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    CreateDynamicObject(2394, -2631.482177, 1404.264038, 906.060974, 0.000000, 0.000000, -90.000000, object_world, object_int, -1, 300.00, 300.00); 
    CreateDynamicObject(14891, -2641.201416, 1418.500976, 907.720520, 0.000000, 0.000000, 37.900001, object_world, object_int, -1, 300.00, 300.00); 
    CreateDynamicObject(14891, -2645.181152, 1423.614624, 907.720520, 0.000000, 0.000000, 37.900001, object_world, object_int, -1, 300.00, 300.00); 
    CreateDynamicObject(3058, -2648.982910, 1421.515136, 907.818298, 0.000000, 0.000000, -24.699993, object_world, object_int, -1, 300.00, 300.00); 
    CreateDynamicObject(3058, -2644.934570, 1416.706665, 907.818298, 0.000000, 0.000000, -24.699993, object_world, object_int, -1, 300.00, 300.00); 
    CreateDynamicObject(19859, -2651.297607, 1429.119384, 912.576782, 0.000000, 0.000000, -90.000000, object_world, object_int, -1, 300.00, 300.00);
    
    // Actors 
    JizzyActors[0] = CreateDynamicActor(178,-2673.12475, 1410.285034, 907.570312, 270, 1, 100.0, 0, 3, -1);
    JizzyActors[1] = CreateDynamicActor(237,-2678.16235, 1404.147583, 907.570312, 270, 1, 100.0, 0, 3, -1);
    JizzyActors[2] = CreateDynamicActor(237, -2677.8103, 1416.486328, 907.562805, 270, 1, 100.0, 0, 3, -1);
    JizzyActors[3] = CreateDynamicActor(152, -2671.3181, 1427.956665, 907.360412, 270, 1, 100.0, 0, 3, -1);
    JizzyActors[4] = CreateDynamicActor(246, -2660.82958, 1427.834472, 907.360412, 0, 1, 100.0, 0, 3, -1);
    JizzyActors[5] = CreateDynamicActor(178, -2654.51342, 1426.862060, 907.360351, 0, 1, 100.0, 0, 3, -1);
    JizzyActors[6] = CreateDynamicActor(145, -2678.41503, 1410.618774, 907.570312, 0, 1, 100.0, 0, 3, -1);
    JizzyActors[7] = CreateDynamicActor(216, -2654.55224, 1410.275024, 907.388610, 0, 1, 100.0, 0, 3, -1);
    JizzyActors[8] = CreateDynamicActor(224, -2660.86962, 1423.237304, 912.41143, 180, 1, 100.0, 0, 3, -1);
    JizzyActors[9] = CreateDynamicActor(257, -2673.4949, 1423.3076, 912.4114, 180, 1, 100.0, 0, 3, -1);
    JizzyActors[10] = CreateDynamicActor(263, -2667.08325, 1399.985229, 912.40625, 0, 1, 100.0, 0, 3, -1);
    JizzyActors[11] = CreateDynamicActor(178, -2646.4023, 1423.5264, 906.4609, 120.0, 1, 100.0, 0, 3, -1);
    
    ApplyDynamicActorAnimation(JizzyActors[0], "STRIP","STR_A2B", 4.1, 1, 1, 1, 1 ,9);
    ApplyDynamicActorAnimation(JizzyActors[1], "STRIP","STR_C1", 4.1, 1, 1, 1, 1 ,9);
    ApplyDynamicActorAnimation(JizzyActors[2], "STRIP", "STR_C2", 4.1, 1, 1, 1, 1 ,9);
    ApplyDynamicActorAnimation(JizzyActors[3], "STRIP", "strip_A", 4.1, 1, 1, 1, 1 ,9);
    ApplyDynamicActorAnimation(JizzyActors[4], "STRIP", "strip_B", 4.1, 1, 1, 1, 1 ,9);
    ApplyDynamicActorAnimation(JizzyActors[5], "STRIP", "strip_C", 4.1, 1, 1, 1, 1 ,9);
    ApplyDynamicActorAnimation(JizzyActors[6], "STRIP", "STR_B2C", 4.1, 1, 1, 1, 1 ,9);
    ApplyDynamicActorAnimation(JizzyActors[7], "STRIP", "strip_G", 4.1, 1, 1, 1, 1 ,9);
    ApplyDynamicActorAnimation(JizzyActors[8], "STRIP", "strip_F", 4.1, 1, 1, 1, 1 ,9);
    ApplyDynamicActorAnimation(JizzyActors[9], "STRIP", "strip_D", 4.1, 1, 1, 1, 1 ,9);
    ApplyDynamicActorAnimation(JizzyActors[10], "STRIP", "strip_D", 4.1, 1, 1, 1, 1 ,9);
    ApplyDynamicActorAnimation(JizzyActors[11], "STRIP", "strip_D", 4.1, 1, 1, 1, 1 ,9);
    
    return 1;
}

public OnFilterScriptExit()
{
    for(new actor = 0; actor < sizeof(JizzyActors); actor ++)
    {
        DestroyDynamicActor(actor);
    }
    return 1;
}

public OnPlayerConnect(playerid)
{
    RemoveBuildingForPlayer(playerid, 14540, -2650.610, 1414.989, 905.882, 0.250);
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{  
    if (!strcmp(cmdtext, "/jizzy", true) || !strcmp(cmdtext, "/jz", true))
    {
        SetPlayerPos(playerid,-2638.8232,1407.3395,906.4609);
        SetPlayerInterior(playerid, 3);
        GameTextForPlayer(playerid, "~w~Pleasure Domes", 3000, 4);
        return true;
    }
    return 0;
}