/*
    Filterscript: specbar
    Description: 
        Adds a spectate TD on the left side under the chat
        Displays important player parameters for debug
    Activation: /specbar
        Use the <Num4> and <Num6> keys to move between players
    Author: 1NS 
*/

#include <a_samp>

#define FILTERSCRIPT

new PlayerText:TDspecbar[MAX_PLAYERS]; 
new PlayerText:TDspecbarDynBox[MAX_PLAYERS];

static const WeaponNamesEN[47][17] =
{
    "Fists", "Brass knuckles", "Golf club", "Night stick", "Knife", "Baseball bat", "Shovel",
    "Pool cue", "Katana", "Chainsaw", "Purple dildo","Short vibrator",  "Long vibrator", 
    "White dildo", "Flowers", "Cane", "Grenade", "Tear gas", "Molotov", "", "", "", 
    "Colt 45","Silenced 9mm", "Desert Eagle", "Shotgun", "Sawn-Off", "Spas12", "Mirco Uzi",
    "MP5", "AK47", "M4", "Tec9", "Rifle", "Sniper", "RPG", "Heat seeking RPG", "Flamethrower",
    "Minigun", "C4", "Detonator", "Spray can", "Extinguisher", "Camera", "Nightvision",
    "Infrared", "Parachute"
};

// ----------------------------------------------------------------------------

public OnFilterScriptInit()
{
    print("specbar loaded. Use cmd /specbar");
    return 1;
}

public OnPlayerConnect(playerid)
{
    SetPVarInt(playerid, "specbar",-1);
    SetPVarInt(playerid, "specbarmode",1);
    
    TDspecbar[playerid] = CreatePlayerTextDraw(playerid, 15.0, 150.0, " "); 
    PlayerTextDrawFont(playerid, TDspecbar[playerid], 1); 
    PlayerTextDrawLetterSize(playerid, TDspecbar[playerid], 0.175, 0.9); 
    PlayerTextDrawSetOutline(playerid, TDspecbar[playerid], 1);
    
    TDspecbarDynBox[playerid] = CreatePlayerTextDraw(playerid, 15.0, 190.0, " "); 
    PlayerTextDrawFont(playerid, TDspecbarDynBox[playerid], 1); 
    PlayerTextDrawLetterSize(playerid, TDspecbarDynBox[playerid], 0.195, 0.9); 
    PlayerTextDrawSetOutline(playerid, TDspecbarDynBox[playerid], 1); 
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    PlayerTextDrawDestroy(playerid, TDspecbarDynBox[playerid]);
    PlayerTextDrawDestroy(playerid, TDspecbar[playerid]);
    return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    // Switches the player in the specbar (Num 4 - Num 6)
    if(newkeys & KEY_ANALOG_LEFT) 
    {
        if (GetPVarInt(playerid, "specbar") > 0) {
            if(IsPlayerConnected(GetPVarInt(playerid, "specbar") - 1))
            {
                SetPVarInt(playerid, "specbar", GetPVarInt(playerid, "specbar") - 1);
            } else {
                for(new i = GetPVarInt(playerid, "specbar")-1; i > 0; i--)
                {
                    if(IsPlayerConnected(i)){
                        SetPVarInt(playerid, "specbar", i);
                        break;
                    }
                }
            }
        }
    }
    if(newkeys & KEY_ANALOG_RIGHT) 
    {
        if (GetPVarInt(playerid, "specbar") >= 0) {
            if(GetPVarInt(playerid, "specbar") < MAX_PLAYERS) {
                if(IsPlayerConnected(GetPVarInt(playerid, "specbar") + 1))
                {
                    SetPVarInt(playerid, "specbar", GetPVarInt(playerid, "specbar") + 1);
                } else {
                    for(new i = GetPVarInt(playerid, "specbar")+1; i < MAX_PLAYERS; i++)
                    {
                        if(IsPlayerConnected(i)){
                            SetPVarInt(playerid, "specbar", i);
                            break;
                        }
                    }
                }
            }
        }
    }
    return 1;
}

public OnPlayerUpdate(playerid)
{
    static string[128];
    new specbartext[256];
    new dynboxtext[512];
    
    if (GetPVarInt(playerid, "specbar") != -1 && IsPlayerConnected(GetPVarInt(playerid,"specbar")))
    {
        new specid = GetPVarInt(playerid, "specbar");
        new nickname[MAX_PLAYER_NAME];
        GetPlayerName(specid, nickname, sizeof(nickname));
        
        format(string, sizeof(string), "~w~%s(%d) team: %d~n~",
        nickname, specid, GetPlayerTeam(specid));
        strcat(specbartext, string);    
        
        new Float: health, Float: armour;
        GetPlayerHealth(specid, health);
        GetPlayerArmour(specid, armour);
        format(string, sizeof(string), "~r~HP %.1f ~b~~h~~h~~h~Armour %.1f~n~", health, armour);
        strcat(specbartext, string);            
        
        format(string, sizeof(string), "~w~FPS:~r~%.0f ~w~Ping:~r~%d ~w~P.Loss:~r~%.1f ~n~",
        floatabs(GetPlayerFPS(specid)), GetPlayerPing(specid),
        NetStats_PacketLossPercent(specid));
        strcat(specbartext, string);            

        // new client_version[10];
        // GetPlayerVersion(specid, client_version, sizeof(client_version));
        // format(string, sizeof(string), "~w~client: %s~n~",client_version);
        // strcat(specbartext, string);
        
        if(GetPVarInt(playerid, "specbarmode") == 1) 
        {
            new newstate[36];
            switch(GetPlayerState(specid))
            {
                case 0: format(newstate, sizeof(newstate), "NONE");
                case 1: format(newstate, sizeof(newstate), "ONFOOT");
                case 2: format(newstate, sizeof(newstate), "DRIVER");
                case 3: format(newstate, sizeof(newstate), "PASSENGER");
                case 4: format(newstate, sizeof(newstate), "EXIT_VEHICLE");
                case 5: format(newstate, sizeof(newstate), "ENTER_VEHICLE_DRIVER");
                case 6: format(newstate, sizeof(newstate), "ENTER_VEHICLE_PASSENGER");  
                case 7: format(newstate, sizeof(newstate), "WASTED");
                case 8: format(newstate, sizeof(newstate), "SPAWNED");
                case 9: format(newstate, sizeof(newstate), "SPECTATING");
                default: format(newstate, sizeof(newstate), "NONE");
            }
            
            format(string, sizeof(string),
            "~w~W:%d I:%d %s %s %s~n~",
            GetPlayerVirtualWorld(specid), GetPlayerInterior(specid),
            newstate,
            (GetPVarInt(specid, "FlyMode")) ? "~w~Flymode" : "",
            (GetPlayerState(specid) == PLAYER_STATE_SPECTATING) ? "~w~Specing" : "");
            strcat(dynboxtext, string);
            
            new weaponid = GetPlayerWeapon(specid);
            new weapstate[20];
            switch(GetPlayerWeaponState(specid))
            {
                case -1: weapstate = "not in hands";
                case 0: weapstate = "no bullets";
                case 1: weapstate = "last bullet";
                case 2: weapstate = "have bullets";
                case 3: weapstate = "reload";
            }

            format(string, sizeof(string), "~r~%s (%d)~w~ slot: ~r~%d ~w~ammo: ~r~%d ~w~%s~n~",
            WeaponNamesEN[weaponid], weaponid, GetWeaponSlot(weaponid),
            GetPlayerAmmo(specid), weapstate);
            strcat(dynboxtext, string);
            
            format(string, sizeof(string),
            "~w~Anim ~r~%d~w~ ~w~Speed ~r~%d~w~ Mps ~r~%d~n~", 
            GetPlayerAnimationIndex(specid), GetPlayerSpeed(specid),
            NetStats_MessagesRecvPerSecond(specid));
            strcat(dynboxtext, string);
            
            new cammode[48];
            switch(GetPlayerCameraMode(specid))
            {
                case 3: cammode = "Train/tram camera";
                case 4: cammode = "Cam follow ped";
                case 7: cammode = "Sniper aiming";
                case 8: cammode = "Rocket Launcher aiming";
                case 15: cammode = "Fixed camera";
                case 16: cammode = "Vehicle front or side cam";
                case 18: cammode = "Normal vehicle cam";
                case 22: cammode = "Normal boat camera";
                case 46: cammode = "Camera weapon aiming";
                case 51: cammode = "Heat-seeking R.Launcher aiming";
                case 53: cammode = "Aiming any other weapon";
                case 55: cammode = "Vehicle passenger drive-by";
                case 56: cammode = "Helicopter/bird view";
                case 57: cammode = "Ground cam, zooms in very quickly";
                case 58: cammode = "Horizontal flyby past vehicle";
                case 59: cammode = "Airveh looking up ground camera";
                case 62: cammode = "Airveh vertical flyby past airveh";
                case 63: cammode = "Airveh horizontal flyby past airveh";
                case 64: cammode = "Airveh camera focused on pilot";
            }

            format(string, sizeof(string),"~w~%s~n~",cammode);
            strcat(dynboxtext, string);
            
            #if defined _streamer_included_included
            format(string, sizeof(string),
            "~w~Streamed objects ~r~%i/1000~n~",
            Streamer_CountVisibleItems(specid, STREAMER_OBJECT_TYPE_GLOBAL, 1));
            strcat(dynboxtext, string);
            #endif              
        }

        PlayerTextDrawSetString(playerid, TDspecbar[playerid], specbartext);
        specbartext[0] = EOS;
        PlayerTextDrawSetString(playerid, TDspecbarDynBox[playerid], dynboxtext);
        dynboxtext[0] = EOS;
    }
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    if(!strcmp(cmdtext, "/specbar", true, 8)) 
    {
        new specid;
        if(!cmdtext[8]) 
        {
            if(GetPVarInt(playerid, "specbar") == -1)
            {
                PlayerTextDrawHide(playerid, TDspecbar[playerid]);
                PlayerTextDrawHide(playerid, TDspecbarDynBox[playerid]);
                specid = playerid;
                PlayerTextDrawShow(playerid, TDspecbar[playerid]);
                PlayerTextDrawShow(playerid, TDspecbarDynBox[playerid]);
                SetPVarInt(playerid, "specbar", specid);
                SendClientMessage(playerid, -1,
                "Use the <Num4> and <Num6> keys to move between players");
                return true;
            } else {
                PlayerTextDrawHide(playerid, TDspecbar[playerid]);
                PlayerTextDrawHide(playerid, TDspecbarDynBox[playerid]);
                SetPVarInt(playerid, "specbar",-1);
                SendClientMessage(playerid, -1,
                "Specbar was disabled. Use /specbar <ID> to enable");
                return true;
            }
        }
        PlayerTextDrawHide(playerid, TDspecbar[playerid]);
        PlayerTextDrawHide(playerid, TDspecbarDynBox[playerid]);
        specid = strval(cmdtext[9]);
        PlayerTextDrawShow(playerid, TDspecbar[playerid]);
        PlayerTextDrawShow(playerid, TDspecbarDynBox[playerid]);
        SetPVarInt(playerid, "specbar", specid);
        SendClientMessage(playerid, -1, 
        "Use the <Num4> and <Num6> keys to move between players");
        return true;
    }
    return 0;
}

// ----------------------------------------------------------------------------
stock GetWeaponSlot(weaponid)
{
    switch(weaponid)
    {
        case 0, 1: return 0;
        case 2..9: return 1;
        case 10..15: return 10;
        case 16..18, 39: return 8;
        case 22..24: return 2;
        case 25..27: return 3;
        case 28, 29, 32: return 4;
        case 30, 31: return 5;
        case 33, 34: return 6;
        case 35..38: return 7;
        case 41..43: return 9;
        case 44..46: return 11;
        default: return 12; 
    }
    return 0;
}

stock GetPlayerFPS(playerid)
{
    new drunk2 = GetPlayerDrunkLevel(playerid);
    if(drunk2 < 100){
        SetPlayerDrunkLevel(playerid,2000);
    }else{
        if(GetPVarInt(playerid, "drunk") != drunk2){
            new fps = GetPVarInt(playerid, "drunk") - drunk2;
            if((fps > 0) )
            SetPVarInt(playerid, "fps", fps);
            SetPVarInt(playerid, "drunk", drunk2);
        }
    }
    return GetPVarInt(playerid, "fps");
}

stock GetPlayerSpeed(playerid, bool:kmh = true)
{
    new Float:Vx,Float:Vy,Float:Vz,Float:rtn;
    if(IsPlayerInAnyVehicle(playerid)) GetVehicleVelocity(GetPlayerVehicleID(playerid),Vx,Vy,Vz); else GetPlayerVelocity(playerid,Vx,Vy,Vz);
    rtn = floatsqroot(floatabs(floatpower(Vx + Vy + Vz,2)));
    return kmh?floatround(rtn * 100 * 1.61):floatround(rtn * 100);
}