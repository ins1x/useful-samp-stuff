/*
	Filterscript: Undeground Bar
	Description: Modified Ten Green Bottles bar. Changed mapping, added actors and ammo minigame
	Created specifically for RSC server
	CW/TG gamemode powered by Russian Sawn-off Community 2022
	find us: https://dsc.gg/sawncommunity
	Author: 1NS
*/

#include <a_samp>
#include <streamer>
#define FILTERSCRIPT

#define DIALOG_BARMENU 3001
#define DIALOG_MUSICBOX 3002

/* Editor options: TABSIZE 4, encoding windows-1251, Lang EN-RU */
// ----------------------------------------------------------------------------
#define KickPlayerEx(%0) SetTimerEx("KickPlayer", 500, 0, "d", %0)

// Y_Less foreach macro
#tryinclude <foreach>
#if !defined foreach
	#define foreach(%1,%2) for (new %2 = 0; %2 < MAX_PLAYERS; %2++) if (IsPlayerConnected(%2))
	#define __SSCANF_FOREACH__
#endif

#if !defined _samp_included
	#error "Please include a_samp or a_npc before foreach"
#endif

// PRESSED(keys)
#define PRESSED(%0) \
	(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
// ----------------------------------------------------------------------------

forward AuxTimer();

new InteriorActor[15];
new ammoobjects[8];
new AuxTimerTick;
new IsAnimLoop[MAX_PLAYERS]; // anim loop flag

public OnFilterScriptInit()
{
	SetTimer("AuxTimer", 1000*5, true);
	
	InteriorActor[1] = CreateDynamicActor(192, 496.7010, -77.4073, 999.1890, 353.90, 1, 100.0, -1, 11);
	InteriorActor[2] = CreateDynamicActor(289, 505.6576, -81.1296, 998.9609, 83.13, 1, 100.0, -1, 11);
	InteriorActor[3] = CreateDynamicActor(100, 503.4657, -75.3999, 998.76, 89.55, 1, 100.0, -1, 11);
	//InteriorActor[4] = CreateDynamicActor(271, 496.9156, -71.65, 999.12, 183.01, 1, 100.0, -1, 11);
	InteriorActor[5] = CreateDynamicActor(233, 509.9601, -74.6003, 998.75, 39.51, 1, 100.0, -1, 11);
	InteriorActor[6] = CreateDynamicActor(41, 509.3651, -73.9624, 998.75, 220.33, 1, 100.0, -1, 11);
	//InteriorActor[7] = CreateDynamicActor(298, 492.8198, -76.6567, 999.5964, 22.89, 1, 100.0, -1, 11);
	InteriorActor[7] = CreateDynamicActor(298, 489.8529, -80.1308, 999.6263, 0.7874, 1, 100.0, -1, 11);
	InteriorActor[8] = CreateDynamicActor(299, 490.0098, -77.4557, 998.7578, 171.8861, 1, 100.0, -1, 11);
	InteriorActor[9] = CreateDynamicActor(79, 511.8778,-88.2840,999.2609,45.83, 1, 100.0, -1, 11);
	
	for (new actorid = 1; actorid < 10; actorid++)
	{
		SetDynamicActorVirtualWorld(InteriorActor[actorid], 66666);
	}
	ApplyDynamicActorAnimation(InteriorActor[1], "BAR", "BARman_idle", 4.1, 1, 1, 1, 1 ,9);	
	ApplyDynamicActorAnimation(InteriorActor[2], "CASINO", "Slot_lose_out", 4.1, 1, 1, 1, 1 ,4);
	ApplyDynamicActorAnimation(InteriorActor[3], "MISC", "Plyrlean_loop", 4.1, 1, 1, 1, 1 ,9);
	//ApplyDynamicActorAnimation(InteriorActor[4], "MISC", "SEAT_LR", 4.1, 1, 1, 1, 1 ,3);
	ApplyDynamicActorAnimation(InteriorActor[5], "PED","IDLE_chat", 4.1, 1, 1, 1, 1 ,9);
	ApplyDynamicActorAnimation(InteriorActor[6], "PED","IDLE_chat", 4.1, 1, 1, 1, 1 ,9);
	ApplyDynamicActorAnimation(InteriorActor[7], "CRACK","Bbalbat_Idle_02", 4.1, 1, 1, 1, 1 ,10);
	ApplyDynamicActorAnimation(InteriorActor[8], "MISC", "plyr_shkhead", 4.1, 1, 1, 1, 1 ,30);
	ApplyDynamicActorAnimation(InteriorActor[9], "CRACK", "crckidle2", 4.1, 1, 1, 1, 1 ,9);
	
	// Labels
	CreateDynamic3DTextLabel("Press {33AA33}<N>", 0xFFFFFFAA, 496.6890,-76.0386,998.7578, 7.0);
	CreateDynamic3DTextLabel("{33AA33}EXIT", 0xFFFFFFAA, 501.97, -67.56, 998.75, 20.0);
	CreateDynamic3DTextLabel("{CDCDCD}WC", 0xFFFFFFAA, 488.2820,-83.0641,998.7578, 5.0);
	CreateDynamic3DTextLabel("{CDCDCD}Ammo", 0xFFFFFFAA, 511.9900, -75.6816, 998.7578, 5.0);
	CreateDynamic3DTextLabel("{33AA33}EXIT", 0xFFFFFFAA, 363.1599, -63.4165, 1001.5078, 5.0);//toilet
	CreateDynamic3DTextLabel("{33AA33}EXIT", 0xFFFFFFAA, 301.7083, -75.6951, 1001.5156, 5.0);//ammo
	CreateDynamic3DTextLabel("Press {33AA33}<N>", 0xFFFFFFAA, 295.2059, -72.2218, 1001.5156, 5.0);
	CreateDynamic3DTextLabel("Press {33AA33}<N>", 0xFFFFFFAA, 505.1734, -76.7013, 998.7578, 5.0);
	
	// toilet
	InteriorActor[11] = CreateDynamicActor(239, 363.6629, -57.2080, 1001.5078, 3.19, 1, 100.0, -1, 10);
	ApplyDynamicActorAnimation(InteriorActor[11], "SWEET", "Sweet_injuredloop", 4.1, 1, 1, 1, 1 ,9);
	SetDynamicActorVirtualWorld(InteriorActor[11], 66666);

	InteriorActor[12] = CreateDynamicActor(216, 369.0965,-57.8972,1001.5123,358.4742, 1, 100.0, -1, 10);
	ApplyDynamicActorAnimation(InteriorActor[12], "STRIP", "STR_Loop_C", 4.1, 1, 1, 1, 1 ,9);
	SetDynamicActorVirtualWorld(InteriorActor[12], 66666);	
	
	InteriorActor[13] = CreateDynamicActor(270, 369.6215,-57.4341,1001.5194,133.4826, 1, 100.0, -1, 10);
	ApplyDynamicActorAnimation(InteriorActor[13], "PAULNMAC", "Piss_loop", 4.1, 1, 1, 1, 1 ,9);
	SetDynamicActorVirtualWorld(InteriorActor[13], 66666);	
	
	// ammo
	InteriorActor[14] = CreateDynamicActor(179, 294.5407,-71.9992,1001.5156, 244.42, 1, 100.0, -1, 4);
	ApplyDynamicActorAnimation(InteriorActor[14], "PLAYIDLES", "strleg", 4.1, 1, 1, 1, 1 ,9);
	SetDynamicActorVirtualWorld(InteriorActor[14], 66666);
	
	// ammo targets
	ammoobjects[0] = CreateDynamicObject(1586, 325.9463, -63.0106, 1001.7058, 0.00, 0.00, -90.0, -1, 4); 
	ammoobjects[1] = CreateDynamicObject(3025, 326.0211, -63.0518, 1005.3074, 0.00, 0.00, 90.00, -1, 4);
	ammoobjects[2] = CreateDynamicObject(1586, 327.6061, -68.0806, 1001.7058, 0.00, 0.00, -90.00, -1, 4);
	ammoobjects[3] = CreateDynamicObject(3025, 327.7009, -68.0418, 1005.3074, 0.00, 0.00, 90.00, -1, 4); 
	ammoobjects[4] = CreateDynamicObject(1586, 329.3160, -59.1706, 1001.7058, 0.00, 0.00, -90.00, -1, 4);
	ammoobjects[5] = CreateDynamicObject(3025, 329.3811, -59.0318, 1005.3074, 0.00, 0.00, 90.00, -1, 4);
	// back columns
	ammoobjects[6] = CreateDynamicObject(1586, 322.0060, -57.5107, 999.71502, 0.00, 0.00, -90.00, -1, 4);
	CreateDynamicObject(7922, 321.888793, -57.252700, 1000.215759, 0.00, 0.00, 0.00, -1, 4);
	CreateDynamicObject(7922, 321.888793, -71.422645, 1000.215759, 0.00, 0.00, 90.00, -1, 4);
	ammoobjects[7] = CreateDynamicObject(1586, 322.0060, -71.1006, 999.68499, 0.00, 0.00, -90.0, -1, 4);
	
	new tmpobjid;
	// Bar
	tmpobjid = CreateDynamicObject(18765, 508.209564, -89.442405, 995.971252, 0.00, 0.00, 0.00, -1, 11);
	SetDynamicObjectMaterial(tmpobjid, 0, 12862, "sw_block03", "sw_woodwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(11688, 504.555267, -76.746833, 998.688171, 0.0, 180.0, 90.0, -1, 11); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14652, "ab_trukstpa", "wood01", 0x00000000);
	tmpobjid = CreateDynamicObject(1732, 504.408996, -76.735237, 998.530517, 0.0, 0.0, -90.0, -1, 11);
	SetDynamicObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "wood01", 0x00000000);
	tmpobjid = CreateDynamicObject(1958, 504.647705, -76.736190, 999.030517, -90.0, 90.0, 0.0, -1, 11);
	SetDynamicObjectMaterial(tmpobjid, 0, 11150, "ab_acc_control", "ab_BoltPanel2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 11150, "ab_acc_control", "ab_BoltPanel2", 0x00000000);
	CreateDynamicObject(2949, 512.392883, -74.996849, 997.757812, 0.00, 0.00, 0.00, -1, 11);
	CreateDynamicObject(2047, 512.390258, -75.722343, 1000.757507, 0.00, 0.00, -90.799957, -1, 11);
	CreateDynamicObject(2232, 512.066284, -84.885185, 998.991271, 0.00, 0.00, -180.00, -1, 11);
	CreateDynamicObject(2232, 504.666503, -84.905174, 998.991271, 0.00, 0.00, -180.00, -1, 11);
	CreateDynamicObject(19611, 507.024444, -84.860839, 998.471252, 0.00, 0.00, 0.00, -1, 11);
	CreateDynamicObject(19611, 509.474365, -84.830810, 998.471252, 0.00, 0.00, 0.00, -1, 11);
	CreateDynamicObject(19610, 507.021728, -84.899917, 1000.102416, 0.00, 0.00, 180.00, -1, 11);
	CreateDynamicObject(19610, 509.471527, -84.839904, 1000.102416, 0.00, 0.00, 180.00, -1, 11);
	CreateDynamicObject(19317, 511.452911, -86.865631, 999.191406, -19.800004, 11.099999, -87.89, -1, 11);
	CreateDynamicObject(1805, 510.517425, -86.038902, 998.671386, 0.00, 0.00, 25.300003, -1, 11);
	CreateDynamicObject(2676, 506.539428, -87.380386, 998.571350, 0.00, 0.00, 25.599998, -1, 11);
	CreateDynamicObject(19613, 511.832641, -86.828887, 998.451171, 0.00, 0.00, 180.00, -1, 11);
	CreateDynamicObject(2671, 509.849212, -86.440551, 998.491271, 0.00, 0.00, 13.699998, -1, 11);
	CreateDynamicObject(2670, 511.470458, -82.356895, 998.041015, 0.00, 0.00, -153.100036, -1, 11);
	CreateDynamicObject(1830, 504.418121, -76.512374, 997.917968, 0.0, 0.0, 90.59,-1, 11);
	CreateDynamicObject(19613, 504.365356, -76.731590, 998.268249, 0.0, 0.0, 90.0,-1, 11);
	// Bar toilet
	CreateDynamicObject(3029, 364.205810, -63.767288, 1000.307556, 0.0, 0.0, 90.599, -1, 10);
	CreateDynamicObject(19898, 366.864807, -56.918853, 1000.517761, 0.0, 0.0, 0.00, -1, 10); 
	CreateDynamicObject(1778, 362.237304, -60.236183, 1000.487792, 0.0, 0.0, 178.500, -1, 10);
	CreateDynamicObject(2602, 363.937408, -56.500732, 1000.888244, 0.0, 0.0, 0.00, -1, 10);
	
	// ammunation
	tmpobjid = CreateDynamicObject(19463, 292.510803, -64.563804, 1002.467285, 0.00, 0.00, 0.00, -1, 4);
	SetDynamicObjectMaterial(tmpobjid, 0, 18062, "ab_sfammuitems01", "ammu_gunboard2", 0x00000000);
	tmpobjid = CreateDynamicObject(19757, 303.522338, -60.738239, 1002.890502, -90.0, 0.0, 0.0, -1, 4);
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ventb128", 0x00000000);
	CreateDynamicObject(356, 302.847778, -60.248558, 1000.755676, 0.0, -84.400001, 0.0, -1, 4);
	CreateDynamicObject(346, 303.490905, -61.415279, 1001.356201, 92.800064, 0.0, 56.100002, -1, 4);
	CreateDynamicObject(19995, 303.475494, -60.810718, 1001.376403, 0.0, 90.499977, 0.0, -1, 4);
	CreateDynamicObject(349, 303.641998, -70.152755, 1001.353942, 66.300117, 1.199999, 100.299987, -1, 4);
	CreateDynamicObject(2041, 303.581542, -63.258247, 1001.556640, 0.0, 0.0, -87.699996, -1, 4);
	CreateDynamicObject(2358, 302.935821, -66.107650, 1000.615600, 0.0, 0.0, 0.0, -1, 4);
	CreateDynamicObject(2063, 294.790008, -75.667289, 1001.325683, 0.0, 0.0, -180.0, -1, 4);
	CreateDynamicObject(2063, 298.190002, -75.667289, 1001.325683, 0.0, 0.0, -180.0, -1, 4);
	CreateDynamicObject(2358, 298.789672, -75.688438, 1000.855957, 0.0, 0.0, 180.0, -1, 4);
	CreateDynamicObject(2358, 294.119781, -75.678443, 1001.806823, 0.0, 0.0, 180.0, -1, 4);
	CreateDynamicObject(2041, 297.692047, -75.600883, 1001.456054, 0.0, 0.0, 103.300025, -1, 4);
	CreateDynamicObject(349, 298.298126, -75.721534, 1001.255615, 102.200012, 30.400026, -0.500000, -1, 4);
	CreateDynamicObject(2042, 297.546813, -75.660247, 1000.865966, 0.0, 0.0, 0.0, -1, 4);
	CreateDynamicObject(352, 298.851043, -75.723869, 1001.699096, 84.099983, 0.0, 33.799999, -1, 4);
	CreateDynamicObject(2358, 298.199707, -75.688438, 1001.816650, 0.0, 0.0, 180.0, -1, 4);
	CreateDynamicObject(358, 297.458129, -75.665527, 1002.086791, 67.799964, -1.199995, 1.100001, -1, 4);
	CreateDynamicObject(355, 295.683319, -75.638664, 1001.724792, 116.099975, 13.999990, 164.7000, -1, 4);
	CreateDynamicObject(2040, 295.761810, -75.780593, 1001.796142, 0.0, 0.0, 89.399993, -1, 4);
	CreateDynamicObject(2038, 295.441619, -75.602943, 1001.325988, 0.0, 0.0, -134.700012, -1, 4);
	CreateDynamicObject(351, 294.058807, -75.436180, 1001.278625, 87.199958, -5.000005, 12.899996, -1, 4);
	CreateDynamicObject(2042, 294.133819, -75.639556, 1001.346130, 0.0, 0.0, 107.099952, -1, 4);
	CreateDynamicObject(2359, 295.354156, -75.646850, 1000.976013, 0.0, 0.0, 0.0, -1, 4);
	CreateDynamicObject(350, 295.313598, -75.654647, 1000.868164, 0.0, -5.200002, 178.699981, -1, 4);
	CreateDynamicObject(2041, 294.222686, -75.661056, 1000.976074, 0.0, 0.0, 120.099990, -1, 4);
	CreateDynamicObject(2035, 294.205261, -75.618423, 1002.115722, 0.0, 0.0, 0.0, -1, 4);
	CreateDynamicObject(2036, 298.799072, -75.664093, 1002.126464, 0.0, 0.0, -9.299999, -1, 4);
	CreateDynamicObject(2058, 295.555358, -75.583183, 1002.126098, 0.0, 0.0, 0.0, -1, 4);
	CreateDynamicObject(2060, 302.711639, -71.246383, 1000.555664, 0.0, 0.0, 0.0, -1, 4);
	CreateDynamicObject(2060, 302.711639, -71.246383, 1000.765869, 0.0, 0.0, 0.0, -1, 4);
	CreateDynamicObject(2060, 302.711639, -71.246383, 1000.986083, 0.0, 0.0, 0.0, -1, 4);
	CreateDynamicObject(2038, 302.869812, -71.221359, 1001.186279, 0.0, 0.0, 177.500106, -1, 4);
	CreateDynamicObject(352, 303.564147, -64.314643, 1001.382141, 86.000000, 0.0, 46.399993, -1, 4);
	CreateDynamicObject(19422, 303.651855, -63.864330, 1001.375610, 0.0, 0.0, 44.799991, -1, 4);
	CreateDynamicObject(19422, 303.581420, -70.651565, 1001.375610, 0.0, 0.0, -45.799999, -1, 4);
	CreateDynamicObject(19139, 303.551055, -66.969612, 1001.400695, 0.0, -15.300001, 59.0999, -1, 4);
	CreateDynamicObject(346, 303.475860, -67.344871, 1001.375366, 92.800064, -27.599998, 56.100002, -1, 4);
	
	return 1;
}

public OnFilterScriptExit()
{
	for(new actor = 0; actor < sizeof(InteriorActor); actor++) DestroyDynamicActor(InteriorActor[actor]);
	
	return 1;
}

public OnPlayerConnect(playerid)
{
	IsAnimLoop[playerid] = false;
	
	// Remove default objects on bar interior
	RemoveBuildingForPlayer(playerid, 2695, 487.359, -78.320, 999.859, 0.250);
	RemoveBuildingForPlayer(playerid, 2662, 487.351, -76.742, 1000.280, 0.250);
	RemoveBuildingForPlayer(playerid, 2660, 487.351, -81.210, 999.882, 0.250);
	RemoveBuildingForPlayer(playerid, 2662, 507.507, -89.070, 1000.460, 0.250);
	RemoveBuildingForPlayer(playerid, 2660, 509.851, -89.078, 1000.919, 0.250);
	RemoveBuildingForPlayer(playerid, 2695, 505.359, -89.078, 1000.010, 0.250);
	RemoveBuildingForPlayer(playerid, 2657, 504.343, -88.031, 999.054, 0.250);
	RemoveBuildingForPlayer(playerid, 2659, 512.382, -86.664, 1000.849, 0.250);
	RemoveBuildingForPlayer(playerid, 2696, 512.390, -85.242, 999.734, 0.250);
	RemoveBuildingForPlayer(playerid, 2670, 510.898, -84.890, 998.070, 0.250);
	RemoveBuildingForPlayer(playerid, 2964, 510.101, -84.835, 997.937, 0.250);
	RemoveBuildingForPlayer(playerid, 2964, 506.484, -84.835, 997.937, 0.250);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	// Open settings menu on press N
	if(newkeys == 131072)
	{
		if(GetPlayerInterior(playerid) == 11)
		{
			if(IsPlayerInRangeOfPoint(playerid, 3.0, 496.76, -75.99, 998.75)) return BARMENU(playerid);
			if(IsPlayerInRangeOfPoint(playerid, 5.0, 505.1734, -76.7013, 998.7578)) return MUSICMENU(playerid);
		}
		if(GetPlayerInterior(playerid) == 4)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.0, 295.2059, -72.2218, 1001.5156))
			{
				ShowPlayerDialog(playerid, 139, DIALOG_STYLE_LIST, "Weapons",
				"9mm Pistol\n\
				Silenced pistol\n\
				Desert eagle\n\
				Shotgun\n\
				Sawn-off shotgun\n\
				Combat shotgun\n\
				Micro Uzi\n\
				MP5\n\
				TEC9\n\
				AK47\n\
				M4\n\
				Country rifle\n\
				Sniper rifle",
				"Select", "Back");
			}
		}
	}
	
	// Clear animation
	if(PRESSED( KEY_JUMP) || PRESSED( KEY_SECONDARY_ATTACK) || PRESSED( KEY_FIRE))
    {
		if(GetPlayerState(playerid) != PLAYER_STATE_WASTED && 
		GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_CUFFED)
		{
			if(IsAnimLoop[playerid] == 1)
			{			
				ClearAnimations(playerid);
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
				IsAnimLoop[playerid] = 0; //clear loop piss anim
			}
		}
    }
	return true;
}

public OnPlayerUpdate(playerid)
{
	// Bar exit
	if(GetPlayerInterior(playerid) == 11)
	{
		if(IsPlayerInRangeOfPoint(playerid, 1.2, 501.97, -67.56, 998.75))
		{
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SpawnPlayer(playerid);
			StopAudioStreamForPlayer(playerid);
		}
		if(IsPlayerInRangeOfPoint(playerid, 1.0, 488.2820,-83.0641,998.7578))
		{
			SetPlayerInterior(playerid, 10);
			SetPlayerPos(playerid, 363.4225,-61.6542,1001.5078);
			SetPlayerFacingAngle(playerid, 333.73);
			SetCameraBehindPlayer(playerid);
			PlayerPlaySound(playerid, 12605, 0.0, 0.0, 0.0);
		}
		// ammo enter
		if(IsPlayerInRangeOfPoint(playerid, 1.0, 511.9901, -75.7406, 998.7578))
		{
			SetPlayerInterior(playerid, 4);
			SetPlayerPos(playerid, 298.6024,-73.1133,1001.5156);
			SetPlayerFacingAngle(playerid, 355.0);
			SetCameraBehindPlayer(playerid);
			SetPVarInt(playerid, "WeaponMode", 0);
			for(new w = 0; w < 11; w++) SetPlayerSkillLevel(playerid, w, 0);
		}
	}
	// Toilet exit
	if(GetPlayerInterior(playerid) == 10)
	{
		if(IsPlayerInRangeOfPoint(playerid, 1.0, 363.1599,-63.4165,1001.5078))
		{
			SetPlayerInterior(playerid, 11);
			SetPlayerPos(playerid, 488.4271,-81.5845,998.7578);
			SetPlayerFacingAngle(playerid, 358.78);
			SetCameraBehindPlayer(playerid);
		}
	}
	// ammmo exit
	if(GetPlayerInterior(playerid) == 4)
	{
		if(IsPlayerInRangeOfPoint(playerid, 1.0, 301.7083,-75.6951,1001.5156))
		{
			if(GetPVarInt(playerid, "AmmoGameTime") > 0)
			{
				SetPVarInt(playerid, "AmmoGameTime", 0);
				SetPVarInt(playerid, "AmmoPoints", 0);
			}
			ResetPlayerWeapons(playerid);
			SetPlayerInterior(playerid, 11);
			SetPlayerPos(playerid, 509.5458,-75.2503,998.7578);
			SetPlayerFacingAngle(playerid, 67.0);
			SetCameraBehindPlayer(playerid);
		}
	}
	
	if(GetPVarInt(playerid, "AmmoGameTime") > 0)
	{
		new tmpstr[128];
		if(GetPVarInt(playerid, "AmmoGameTime") != 1)
		{
			SetPVarInt(playerid, "AmmoGameTime", GetPVarInt(playerid, "AmmoGameTime") - 1);
			format(tmpstr, sizeof(tmpstr), "~w~TIME: %d", GetPVarInt(playerid, "AmmoGameTime"));
			GameTextForPlayer(playerid, tmpstr, 1000, 6);
		} else {
			format(tmpstr, sizeof(tmpstr), "~w~Total score: ~g~%d", GetPVarInt(playerid, "AmmoPoints"));
			GameTextForPlayer(playerid, tmpstr, 1000, 5);
			if(GetPVarInt(playerid, "AmmoPoints") > 300)
			{
				PlayerPlaySound(playerid, 31204, 0.0, 0.0, 0.0);
				// Put your prize here
			} else if (GetPVarInt(playerid, "AmmoPoints") > 250) {
				PlayerPlaySound(playerid, 31204, 0.0, 0.0, 0.0);
				// Put your prize here
			} else if (GetPVarInt(playerid, "AmmoPoints") > 200) {
				PlayerPlaySound(playerid, 31204, 0.0, 0.0, 0.0);
				// Put your prize here
			}
			SetPVarInt(playerid, "AmmoGameTime", 0);
			SetPVarInt(playerid, "AmmoPoints", 0);
			ResetPlayerWeapons(playerid);
		}
	}
	return 1;
}

public OnPlayerShootDynamicObject(playerid, weaponid, objectid, Float:x, Float:y, Float:z)
{
	if(objectid == ammoobjects[0] || objectid == ammoobjects[2]
	|| objectid == ammoobjects[4] || objectid == ammoobjects[6]
	|| objectid == ammoobjects[7])
	{
		if(GetPVarInt(playerid, "AmmoGameTime") == 0)
		{
			SetPVarInt(playerid, "AmmoGameTime", 60);
			GameTextForPlayer(playerid, "~w~START", 1000, 5);
			//PlayerPlaySound(playerid, 31205, 0.0, 0.0, 0.0);
			PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
		}
		if(z > 1.30)
		{
			SetPVarInt(playerid, "AmmoPoints", GetPVarInt(playerid, "AmmoPoints") + 3);
			GameTextForPlayer(playerid, "+3 points", 1000, 4);
			PlayerPlaySound(playerid,17802,0,0,0);
		} else if (z < 1.0 && z > 0.8) {
			SetPVarInt(playerid, "AmmoPoints", GetPVarInt(playerid, "AmmoPoints") + 2);
			GameTextForPlayer(playerid, "+2 points", 1000, 4);
			PlayerPlaySound(playerid,17802,0,0,0);
		} else if (z < 0.5 && z > 0.3) {
			SetPVarInt(playerid, "AmmoPoints", GetPVarInt(playerid, "AmmoPoints") + 1);
			GameTextForPlayer(playerid, "+1 points", 1000, 4);
			PlayerPlaySound(playerid,17802,0,0,0);
		}
			
		//SendClientMessagef(playerid, -1, "%.2f %.2f %.2f", x, y, z);
		//SendClientMessagef(playerid, -1, "%.i", GetPVarInt(playerid, "AmmoPoints"));
	}
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (!strcmp(cmdtext, "/bar", true))
	{
		SetPlayerInterior(playerid, 11);
		SetPlayerVirtualWorld(playerid, 66666);
		SetPlayerPos(playerid, 501.95, -70.56, 998.75);
		ResetPlayerWeapons(playerid);
		StopAudioStreamForPlayer(playerid);
		GameTextForPlayer(playerid, "~y~Welcome to Ten Green Bottles", 1000, 4);
		return 1;
	}
	
	return 0;
}
public AuxTimer()
{
	// Auxiliary timer. (work every 5 sec)
	new Float:x, Float:y, Float:z;
	
	if(AuxTimerTick < 2) {
		AuxTimerTick++;
	} else {
		AuxTimerTick = 0;
	}
	
	#if defined _streamer_included
	GetDynamicObjectPos(ammoobjects[0], x, y, z);
	if(AuxTimerTick) SetDynamicObjectPos(ammoobjects[0], 325.9463, -75.0, 1001.7058);
	MoveDynamicObject(ammoobjects[0], 325.9463, -75.0+30, 1001.7058, 3.0, 0.00, 0.00, -90.0);
	
	GetDynamicObjectPos(ammoobjects[1], x, y, z);
	if(AuxTimerTick) SetDynamicObjectPos(ammoobjects[1], 325.9463, -75.0, 1001.7058);
	MoveDynamicObject(ammoobjects[1], 325.9463, -75.0+30, 1001.7058, 3.0, 0.00, 0.00, -90.0);
	
	GetDynamicObjectPos(ammoobjects[2], x, y, z);
	if(AuxTimerTick) SetDynamicObjectPos(ammoobjects[2], 327.6061, -55.0806, 1001.7058);
	MoveDynamicObject(ammoobjects[2], 327.6061, -55.0806-30, 1001.7058, 4.0, 0.00, 0.00, -90.0);
	
	GetDynamicObjectPos(ammoobjects[3], x, y, z);
	if(AuxTimerTick) SetDynamicObjectPos(ammoobjects[3], 327.7009, -55.0418, 1005.3074);
	MoveDynamicObject(ammoobjects[3], 327.7009, -55.0418-30, 1005.3074, 4.0, 0.00, 0.00, -90.0);
	
	GetDynamicObjectPos(ammoobjects[4], x, y, z);
	if(AuxTimerTick == 2) SetDynamicObjectPos(ammoobjects[4], 329.3160, -55.1706, 1001.7058);
	MoveDynamicObject(ammoobjects[4], 329.3160, -55.1706-30, 1001.7058, 3.0, 0.00, 0.00, -90.0);
	
	GetDynamicObjectPos(ammoobjects[5], x, y, z);
	if(AuxTimerTick == 2) SetDynamicObjectPos(ammoobjects[5], 329.3811, -55.0318, 1005.3074);
	MoveDynamicObject(ammoobjects[5], 329.3811, -55.0318-30, 1005.3074, 3.0, 0.00, 0.00, -90.0);
	
	GetDynamicObjectPos(ammoobjects[6], x, y, z);
	if(z > 1000) {
		MoveDynamicObject(ammoobjects[6], 322.0060, -57.5107, 999.71502-1.5, 3.0, 0.00, 0.00, -90.0);
	} else {
		MoveDynamicObject(ammoobjects[6], 322.0060, -57.5107, 999.71502+1.5, 3.0, 0.00, 0.00, -90.0);
	}
	
	if(AuxTimerTick)
	{
		GetDynamicObjectPos(ammoobjects[7], x, y, z);
		if(z > 1000)
		{
			MoveDynamicObject(ammoobjects[7], 322.0060, -71.1006, 999.68499-1.5, 3.0, 0.00, 0.00, -90.0);
		} else {
			MoveDynamicObject(ammoobjects[7], 322.0060, -71.1006, 999.68499+1.5, 3.0, 0.00, 0.00, -90.0);
		}
	}
	#endif
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_MUSICBOX)
	{
		if(response)
		{
			if(GetPVarInt(playerid, "Cookies") == 0)
			{
				SendClientMessage(playerid, -1,
				"Need cookies. No cookies - no music!");
				return 1;
			}
			SetPVarInt(playerid, "Radio", 1);
			switch(listitem)
			{
				case 0:
				{
					foreach(Player, i)
					{
						if(GetPlayerInterior(i) == 11)
						{
							StopAudioStreamForPlayer(i);
							PlayAudioStreamForPlayer(i,
							"https://zaycevfm.cdnvideo.ru/ZaycevFM_rock_128.mp3", 
							505.1734, -76.7013, 998.7578, 50.0, 1);
						}
					}
				}
				case 1:
				{
					foreach(Player, i)
					{
						if(GetPlayerInterior(i) == 11)
						{
							StopAudioStreamForPlayer(i);
							PlayAudioStreamForPlayer(i,
							"https://zaycevfm.cdnvideo.ru/ZaycevFM_pop_128.mp3", 
							505.1734, -76.7013, 998.7578, 50.0, 1);
						}
					}
				}
				case 2:
				{
					foreach(Player, i)
					{
						if(GetPlayerInterior(i) == 11)
						{
							StopAudioStreamForPlayer(i);
							PlayAudioStreamForPlayer(i,
							"https://zaycevfm.cdnvideo.ru/ZaycevFM_disco_128.mp3", 
							505.1734, -76.7013, 998.7578, 50.0, 1);
						}
					}
				}
				case 3:
				{
					foreach(Player, i)
					{
						if(GetPlayerInterior(i) == 11)
						{
							StopAudioStreamForPlayer(i);
							PlayAudioStreamForPlayer(i,
							"https://zaycevfm.cdnvideo.ru/ZaycevFM_club_128.mp3", 
							505.1734, -76.7013, 998.7578, 50.0, 1);
						}
					}
				}
				case 4:
				{
					foreach(Player, i)
					{
						if(GetPlayerInterior(i) == 11)
						{
							StopAudioStreamForPlayer(i);
							PlayAudioStreamForPlayer(i,
							"https://zaycevfm.cdnvideo.ru/ZaycevFM_rnb_128.mp3", 
							505.1734, -76.7013, 998.7578, 50.0, 1);
						}
					}
				}
				case 5:
				{
					foreach(Player, i)
					{
						if(GetPlayerInterior(i) == 11)
						{
							StopAudioStreamForPlayer(i);
							PlayAudioStreamForPlayer(i,
							"https://zaycevfm.cdnvideo.ru/ZaycevFM_relax_128.mp3", 
							505.1734, -76.7013, 998.7578, 50.0, 1);
						}
					}
				}
				case 6:
				{
					foreach(Player, i)
					{
						if(GetPlayerInterior(i) == 11)
						{
							StopAudioStreamForPlayer(i);
							PlayAudioStreamForPlayer(i,
							"https://zaycevfm.cdnvideo.ru/ZaycevFM_rus_128.mp3", 
							505.1734, -76.7013, 998.7578, 50.0, 1);
						}
					}
				}
				case 7:
				{
					foreach(Player, i)
					{
						if(GetPlayerInterior(i) == 11)
						{
							StopAudioStreamForPlayer(i);
							PlayAudioStreamForPlayer(i,
							"https://zaycevfm.cdnvideo.ru/ZaycevFM_rap_128.mp3", 
							505.1734, -76.7013, 998.7578, 50.0, 1);
						}
					}
				}
				case 8:
				{
					foreach(Player, i)
					{
						if(GetPlayerInterior(i) == 11)
						{
							StopAudioStreamForPlayer(i);
							PlayAudioStreamForPlayer(i,
							"https://zaycevfm.cdnvideo.ru/ZaycevFM_metal_128.mp3", 
							505.1734, -76.7013, 998.7578, 50.0, 1);
						}
					}
				}
				case 9:
				{
					foreach(Player, i)
					{
						if(GetPlayerInterior(i) == 11)
						{
							StopAudioStreamForPlayer(i);
							PlayAudioStreamForPlayer(i,
							"https://zaycevfm.cdnvideo.ru/ZaycevFM_bass_128.mp3", 
							505.1734, -76.7013, 998.7578, 50.0, 1);
						}
					}
				}
				case 10: 
				{
					foreach(Player, i)
					{
						if(GetPlayerInterior(i) == 11)
						{
							StopAudioStreamForPlayer(i);
							SetPVarInt(playerid, "Radio", 0);
						}
					}
				}
			}
		}
	}
	if (dialogid == DIALOG_BARMENU)
	{
		if(response)
		{
			new Float:pos[3];
			GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
			switch(listitem)
			{
				case 0:
				{
					if(GetPlayerDrunkLevel(playerid) <= 6000){
						ApplyAnimation(playerid, "PED", "SHOVE_PARTIAL", 4.0, 0, 1, 1, 1, 0);
					}
					if(GetPlayerDrunkLevel(playerid) < 9000){
						ApplyAnimation(playerid, "PAULNMAC", "Piss_loop", 4.0, 0, 1, 1, 1, 0);
						IsAnimLoop[playerid] = 1;
					}
					SetPlayerDrunkLevel(playerid, GetPlayerDrunkLevel(playerid)+3000);
					SetPlayerSpecialAction(playerid, 22); // beer
				}
				case 1:
				{
					if(GetPlayerDrunkLevel(playerid) <= 12000){
						ApplyAnimation(playerid, "PED", "KO_SKID_FRONT", 4.0, 0, 1, 1, 1, 0);
					}
					SetPlayerSpecialAction(playerid, 22);
					SetPlayerDrunkLevel(playerid, GetPlayerDrunkLevel(playerid)+4000); // vodka
				}
				case 2: CreateExplosion(pos[0], pos[1], pos[2], 12, 2);// sambuka
				case 3:
				{
					SetPlayerDrunkLevel(playerid, 4000);// tequilla
					ApplyAnimation(playerid,"VENDING","VEND_DRINK_P",4.0,0,0,0,0,0,1);
					ApplyAnimation(playerid,"PED","IDLE_TIRED",4.0,0,0,0,0,0,1);
				}
				case 4:
				{
					SetPlayerDrunkLevel(playerid, 4000);// Djeen
					ApplyAnimation(playerid,"PED","GAS_CWR",4.0,0,0,0,0,0,1);
				}
				case 5:
				{
					SetPlayerDrunkLevel(playerid, 4000);// Kon
					ApplyAnimation(playerid,"VENDING","VEND_DRINK_P",4.0,0,0,0,0,0,1);
				}
				case 6:
				{
					SetPlayerDrunkLevel(playerid, 4000);// Whiskey
					ApplyAnimation(playerid,"VENDING","VEND_DRINK2_P",4.0,0,0,0,0,0,1);
				}
				case 7: SetPlayerDrunkLevel(playerid, 4000);// Sake
				case 8:
				{
					SetPlayerSpecialAction(playerid, 22);
					SetPlayerAttachedObject(playerid, 7, 19078, 1, 0.329150, -0.072101, 0.156082, 0.0, 0.0, 0.0, 1.000000, 1.000000, 1.000000 );
					SendClientMessage(playerid, -1,
					"Yo-ho-ho, and a bottle of rum! Drink and the devil will take you to the end.");
					SetPlayerDrunkLevel(playerid, 4000);// Rom
				}
				case 9:
				{
					SetPlayerDrunkLevel(playerid, 5000);// Cymus
					SendClientMessage(playerid, -1,
					"ыстыk kымыз oте дaмді болды, Мен kазаk тілін тyсіне бастадым");
				}
				case 10:
				{
					if(GetPlayerDrunkLevel(playerid) < 40000){
						SetPlayerSpecialAction(playerid, 22);
						SetPlayerDrunkLevel(playerid, 50000);// abscent
						SendClientMessage(playerid, -1,
						"A very strong drink, if you sort it out, you can burn alive");
					}
					else CreateExplosion(pos[0], pos[1], pos[2], 1, 2);
				}
				case 11:
				{
					SetPlayerSpecialAction(playerid, 23); // sprunk
					SetPlayerDrunkLevel(playerid, 0); 
				}
			}
		}
	}
	return 1;
}

stock MUSICMENU(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_MUSICBOX, DIALOG_STYLE_LIST, "Music box (1 cookie to switch)",
	"Rock\nPop\nDisco\nClub\nRnB\nRelax\nRussian\nRap\nMetal\nBass\n{AFAFAF}Turn Off",
	"Confirm", "Cancel");
	return 1;
}

stock BARMENU(playerid)
{
	if(GetPVarInt(playerid, "Lang") == 1)
	{
		ShowPlayerDialog(playerid, DIALOG_BARMENU, DIALOG_STYLE_TABLIST, "Bar",
		"Beer\t{CD853F}The third most popular drink in the world (after water and tea)\n\
		Vodka\t{CD853F}In the post-Soviet space, it is used as an independent drink\n\
		Sambuca\t{CD853F}Italian digestif with anise aroma.\n\
		Tequila\t{CD853F}Mexican national drink\n\
		Gin\t{CD853F}Has a very dry harmonious taste, sharp character, clear juniper flavor\n\
		Cognac\t{CD853F}In the USSR, any brandy close to the production technology of real cognac was called cognac\n\
		Whiskey\t{CD853F}Literally, the expression translates as 'water of life'\n\
		Sake\t{CD853F}Rice wine, one of the traditional Japanese alcoholic beverages\n\
		Rum\t{CD853F}Doctors of the Royal Navy of Britain recommended rum to sailors for almost all diseases.\n\
		Koumiss\t{CD853F}Sour-milk drink made from mare's milk\n\
		Absinthe\t{CD853F}(Non-drinkable) A strong alcoholic drink, usually containing about 70% (sometimes 85%) alcohol\n\
		{00FF00}Soda\t{CD853F}Helps sober up\n",
		"Confirm", "Cancel");
	} else {
		ShowPlayerDialog(playerid, DIALOG_BARMENU, DIALOG_STYLE_TABLIST, "Bar",
		"Пиво\t{CD853F}Третий по популярности напиток в мире (после воды и чая)\n\
		Водка\t{CD853F}На постсоветском пространстве употребляется в качестве самостоятельного напитка\n\
		Самбука\t{CD853F}Итальянский дижестив с ароматом аниса.\n\
		Текила\t{CD853F}Мексиканский национальный напиток\n\
		Джин\t{CD853F}Обладает очень сухим гармоничным вкусом, резким характером, чётким привкусом можжевельника\n\
		Коньяк\t{CD853F}В СССР коньяком назывался любой бренди, близкой к технологии производства настоящего коньяка\n\
		Виски\t{CD853F}Дословно выражение переводится как «вода жизни»\n\
		Саке\t{CD853F}Рисовое вино, один из традиционных японских алкогольных напитков\n\
		Ром\t{CD853F}Врачи Королевского флота Британии рекомендовали ром морякам практически от всех болезней.\n\
		Кумыс\t{CD853F}Кисломолочный напиток из кобыльего молока\n\
		Абсент\t{CD853F}(Невыпиваемый) Крепкий алкогольный напиток, содержащий обычно около 70% (иногда 85%) алкоголя\n\
		{00FF00}Минералочка\t{CD853F}Помогает протрезветь\n",
		"Confirm", "Cancel");
	}
	return 1;
}