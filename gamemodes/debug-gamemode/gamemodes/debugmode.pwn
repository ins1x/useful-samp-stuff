/*
    Gamemode: Debugmode
    Description: Simple gamemode created for debugging
    Git: https://github.com/ins1x/debug-gamemode/
*/

// ----------------------------------------------------------------------------

// NOTE: compile your script with debug info enabled.
// https://github.com/Zeex/samp-plugin-crashdetect/wiki/Compiling-scripts-with-debug-info   
// Below is a list of callbacks available in SA-MP and its call sequence:
// https://open.mp/docs/scripting/resources/callbacks-sequence
// Controlling a SAMP Server
// https://www.open.mp/docs/server/ControllingServer
// ----------------------------------------------------------------------------

#include <a_samp>

// Binary archives come with an include file (profiler.inc or crashdetect.inc)
// that contains some helper functions that you may find useful. 
// But you don't need to include it to be able to use the plugin, it's not required.

// CrashDetect does not work in conjunction with Profiler and JIT plugins, only one of them can be used!

// #include <profiler>
// https://github.com/Zeex/samp-plugin-profiler#configuration

// #include <crashdetect>
// https://github.com/Zeex/samp-plugin-crashdetect

// #include <sscanf2> 
// https://github.com/Y-Less/sscanf

// ----------------------------------------------------------------------------

// Allow connect 0.3.7 clients to DL server
// https://github.com/AGraber/samp-compat
#include <compat>

#if defined JIT_INC
    #warning Don't include JIT with CrashDetect or Profiler plugin
#endif

// ignore literal array/string passed to a non-const parameter
// #pragma warning disable 239

// Toggle debug messages on console
#if !defined DEBUGMSG
    #define DEBUGMSG
#endif

public OnPlayerDisconnect(playerid, reason)
{
    #if defined DEBUGMSG
        new nickname[MAX_PLAYER_NAME];
        GetPlayerName(playerid, nickname, sizeof(nickname));
        
        new szDisconnectReason[5][] =
        {
            "Timeout/Crash",
            "Quit",
            "Kick/Ban",
            "Custom",
            "Mode End"
        };
        
        printf("[debug] %s left the server. (Reason: %s)", nickname, szDisconnectReason[reason]);
    #endif
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    new idx;
    new cmd[256], tmp[128];
    
    cmd = strtok(cmdtext, idx);
    
    #if defined DEBUGMSG
        new nickname[MAX_PLAYER_NAME];
        GetPlayerName(playerid, nickname, sizeof(nickname));
        printf("[cmd] [%s]: %s", nickname, cmdtext);
    #endif
    
    if(!strcmp(cmdtext, "/respawn", true) || !strcmp(cmdtext, "/spawn", true))
    {
        if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING) return 1;
    
        new
            vehicleid = GetPlayerVehicleID(playerid);
        if (vehicleid)
        {
            new Float:x, Float:y, Float:z;
            GetVehiclePos(vehicleid, x, y, z),
            SetPlayerPos(playerid, x, y, z);
        }
        SpawnPlayer(playerid);
        return 1;
    }
    
    if (!strcmp(cmdtext, "/jetpack", true))
    {
        if(GetPlayerState(playerid) != SPECIAL_ACTION_USEJETPACK 
        && GetPlayerState(playerid) != PLAYER_STATE_SPECTATING)
        {
            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USEJETPACK);
        }
        return true;
    }
    
    if (!strcmp(cmdtext, "/kill", true))
    {
        SetPlayerHealth(playerid, 0.0);
        return true;
    }
    
    if (!strcmp(cmdtext, "/class", true))
    {
        ForceClassSelection(playerid);
        return true;
    }
    
    if (!strcmp(cmdtext, "/slapme", true)) 
    {
        new Float: x, Float: y, Float: z;
        GetPlayerPos(playerid, x, y, z);
        SetPlayerPos(playerid, x + 1, y + 1, z + 1.5);
        PlayerPlaySound(playerid, 1130, x, y, z); // PUNCH_PED
        return true;
    }
    
    if (!strcmp("/tpc", cmd, true) || !strcmp("/tpcoord", cmd, true))
    {
        tmp = strtok(cmdtext, idx);
        
        if (strlen(tmp) == 0) {
            return SendClientMessage(playerid, -1, "Use: /tpc x y z");
        }
        
        new px = strval(tmp);
        tmp = strtok(cmdtext, idx);
        if (strlen(tmp) == 0) return SendClientMessage(playerid, -1, "Use: /tpc x y z");
        new py = strval(tmp);
    
        tmp = strtok(cmdtext, idx);
        if (strlen(tmp) == 0) return SendClientMessage(playerid, -1, "Use: /tpc x y z");
        new pz = strval(tmp);
        
        SetPlayerPos(playerid, px, py, pz);
        return true;
    }
    
    // sscanf cmd example
    // if (sscanf(params, "ui", giveplayerid, amount))
    // {
           // return SendClientMessage(playerid, 0xFF0000AA, "Usage: /givecash <playerid/name> <amount>");
    // }
    
    return 0;
}

public OnPlayerSpawn(playerid)
{
    SetPlayerInterior(playerid, 0);
    
    #if defined DEBUGMSG
        new skinid = GetPlayerSkin(playerid);
        new Float: x, Float: y, Float: z;
        GetPlayerPos(playerid, x, y, z);
        printf("[debug] playerid: %d, skinid: %d, x: %.2f, y: %.2f, z: %.2f",
        playerid, skinid, x, y, z);
    #endif
    return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    #if defined DEBUGMSG
        printf("[debug] playerid %d, newstate: %d, oldstate: %d",
        playerid, newstate, oldstate);
    #endif
    return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
    #if defined DEBUGMSG
        new worldid = GetPlayerVirtualWorld(playerid);
        printf("[debug] playerid %d, newinteriorid: %d, oldinteriorid: %d, worldid: %d",
        playerid, newinteriorid, oldinteriorid, worldid);
    #endif
    return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    // Shows the kill in the killfeed
    SendDeathMessage(killerid, playerid, reason);

    if(killerid != INVALID_PLAYER_ID)
    {
        #if defined DEBUGMSG
            printf("[debug] Is dead playerid: %d, killerid: %d, reason: %d",
            playerid, killerid, reason);
        #endif
    }
    return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart)
{
    if(issuerid != INVALID_PLAYER_ID)
    {
        #if defined DEBUGMSG
            printf("[debug] Issuerid: %d, amount: %f, weaponid: %d, bodypart: %d",
            issuerid, amount, weaponid, bodypart);
        #endif
    }
    return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    if (playerid != INVALID_PLAYER_ID)
    {
        #if defined DEBUGMSG
            printf("[debug] Hittype: %d, hitid: %d, weaponid: %d",
            hittype, hitid, weaponid);
        #endif
    }
    return 1;
}


public OnPlayerRequestClass(playerid, classid)
{
    // Spawn place from bare gamemode
    SetPlayerInterior(playerid,14);
    SetPlayerPos(playerid,258.4893,-41.4008,1002.0234);
    SetPlayerFacingAngle(playerid, 270.0);
    SetPlayerCameraPos(playerid,256.0815,-43.0475,1004.0234);
    SetPlayerCameraLookAt(playerid,258.4893,-41.4008,1002.0234);
    
    #if defined DEBUGMSG
        printf("[debug] playerid: %d select classid: %d", playerid, classid);
    #endif
    
    return 1;
}

public OnGameModeInit()
{
    SetGameModeText("Debug Gamemode");
    
    #if defined DEBUGMSG
        new heap_free = heapspace(); 
        printf("Stack/heap free %d bytes", heap_free);
        if (heap_free > 16384) printf("Used \"#pragma dynamic\" bytes");
    #endif
    
    UsePlayerPedAnims();
    AllowInteriorWeapons(true);
    ShowPlayerMarkers(true);
    // ShowNameTags(true); Enabled by default
    EnableStuntBonusForAll(false);
    DisableInteriorEnterExits();
    
    // Exclude invalid 74 skin
    for (new i = 0; i < 299; i++)
    {
        if(i != 74) AddPlayerClass(i, 1407.6, 2208.9, 19.8, 135.0, 0, 0, 0, 0, 0, 0); 
    }
    
    // Profiler plugin dump call
    // Profiler_Dump();
    
    #if defined DEBUGMSG
        print("Gamemode init complete \t[OK]\n");
    #endif
    return 1;
}

// ----------------------------------------------------------------------------
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
