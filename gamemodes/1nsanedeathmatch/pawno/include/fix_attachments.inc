#if defined _fix_attachments_included
	#endinput
#endif
#define _fix_attachments_included

/*
 * ===============
 *  LIBRARY:
 * ===============
 *
 * fix_attachments.inc
 *
 * ================
 *  LIST OF FIXES/ADDONS:
 * ================
 *
 * FIX:			SetPlayerAttachedObject
 * PROBLEM:  	The attached objects hovers the camera while zooming with certain weapons like Sniper rifle, RPG etc.
 * SOLUTION: 	Temporarily remove player attached objects while player is in zooming session.
 * CREDITS:		Gammix
 *
 * FIX:			Destroy attached objects
 * PROBLEM:  	The attached objects doesn't get auto destroy when player disconnects.
 * SOLUTION: 	Destroy them under OnPlayerDisconnect.
 * CREDITS:		Gammix
 *
 */

enum e_ATTACHMENT_DATA
{
	bool:	att_used,
 			att_modelid,
    		att_boneid,
    Float:	att_offsetX,
   	Float:	att_offsetY,
   	Float:	att_offsetZ,
   	Float:  att_rotX,
   	Float:  att_rotY,
   	Float:  att_rotZ,
   	Float:  att_scaleX,
   	Float:  att_scaleY,
   	Float:  att_scaleZ,
			att_color1,
			att_color2
};

static
	t_PlayerAttachments[MAX_PLAYERS][MAX_PLAYER_ATTACHED_OBJECTS][e_ATTACHMENT_DATA]
;

public OnPlayerDisconnect(playerid, reason)
{
	for (new i; i < MAX_PLAYER_ATTACHED_OBJECTS; i++)
	{
	    if (t_PlayerAttachments[playerid][i][att_used])
	    {
			RemovePlayerAttachedObject(playerid, i);

			t_PlayerAttachments[playerid][i][att_used] = false;
		}
	}

    #if defined ATT_OnPlayerDisconnect
       	return ATT_OnPlayerDisconnect(playerid, reason);
	#else
	   	return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
    #undef OnPlayerDisconnect
#else
    #define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect ATT_OnPlayerDisconnect
#if defined ATT_OnPlayerDisconnect
    forward ATT_OnPlayerDisconnect(playerid, reason);
#endif

#if ! defined KEY_AIM
	#define KEY_AIM 128
#endif

#if ! defined HOLDING
    #define HOLDING(%0) ((newkeys & (%0)) == (%0))
#endif

#if ! defined RELEASED
	#define RELEASED(%0) (((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))
#endif

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (HOLDING(KEY_AIM))
	{
	    switch (GetPlayerWeapon(playerid))
		{
			case WEAPON_SNIPER, WEAPON_ROCKETLAUNCHER, WEAPON_HEATSEEKER, WEAPON_CAMERA:
			{
			    for (new i; i < MAX_PLAYER_ATTACHED_OBJECTS; i++)
				{
					if (IsPlayerAttachedObjectSlotUsed(playerid, i))
				    {
						RemovePlayerAttachedObject(playerid, i);
	     			}
		        }
		    }
		}
	}
	else if(RELEASED(KEY_AIM))
	{
	    for (new i; i < MAX_PLAYER_ATTACHED_OBJECTS; i++)
		{
			if (! IsPlayerAttachedObjectSlotUsed(playerid, i) && t_PlayerAttachments[playerid][i][att_used])
		    {
				SetPlayerAttachedObject(playerid, i, t_PlayerAttachments[playerid][i][att_modelid], t_PlayerAttachments[playerid][i][att_boneid],
													 t_PlayerAttachments[playerid][i][att_offsetX], t_PlayerAttachments[playerid][i][att_offsetY], t_PlayerAttachments[playerid][i][att_offsetZ],
													 t_PlayerAttachments[playerid][i][att_rotX], t_PlayerAttachments[playerid][i][att_rotY], t_PlayerAttachments[playerid][i][att_rotZ],
													 t_PlayerAttachments[playerid][i][att_scaleX], t_PlayerAttachments[playerid][i][att_scaleY], t_PlayerAttachments[playerid][i][att_scaleZ],
													 t_PlayerAttachments[playerid][i][att_color1], t_PlayerAttachments[playerid][i][att_color2]
			 							);
			}
		}
	}

	#if defined ATT_OnPlayerKeyStateChange
       	return ATT_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
	#else
	   	return 1;
	#endif
}
#if defined _ALS_OnPlayerKeyStateChange
    #undef OnPlayerKeyStateChange
#else
    #define _ALS_OnPlayerKeyStateChange
#endif
#define OnPlayerKeyStateChange ATT_OnPlayerKeyStateChange
#if defined ATT_OnPlayerKeyStateChange
    forward ATT_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
#endif

#undef KEY_AIM
#undef HOLDING
#undef RELEASED

stock ATT_SetPlayerAttachedObject(playerid, index, modelid, bone, Float:fOffsetX = 0.0, Float:fOffsetY = 0.0, Float:fOffsetZ = 0.0, Float:fRotX = 0.0, Float:fRotY = 0.0, Float:fRotZ = 0.0, Float:fScaleX = 1.0, Float:fScaleY = 1.0, Float:fScaleZ = 1.0, materialcolor1 = 0, materialcolor2 = 0)
{
	if (SetPlayerAttachedObject(playerid, index, modelid, bone, fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, fScaleX, fScaleY, fScaleZ, materialcolor1, materialcolor2))
	{
		t_PlayerAttachments[playerid][index][att_modelid] = modelid;

		t_PlayerAttachments[playerid][index][att_boneid] = bone;

		t_PlayerAttachments[playerid][index][att_offsetX] = fOffsetX;
		t_PlayerAttachments[playerid][index][att_offsetY] = fOffsetY;
		t_PlayerAttachments[playerid][index][att_offsetZ] = fOffsetZ;

		t_PlayerAttachments[playerid][index][att_rotX] = fRotX;
		t_PlayerAttachments[playerid][index][att_rotY] = fRotY;
		t_PlayerAttachments[playerid][index][att_rotZ] = fRotZ;

		t_PlayerAttachments[playerid][index][att_scaleX] = fScaleX;
		t_PlayerAttachments[playerid][index][att_scaleY] = fScaleY;
		t_PlayerAttachments[playerid][index][att_scaleZ] = fScaleZ;

		t_PlayerAttachments[playerid][index][att_color1] = materialcolor1;
		t_PlayerAttachments[playerid][index][att_color2] = materialcolor2;

		t_PlayerAttachments[playerid][index][att_used] = true;
		
		return true;
	}
	else
	{
		return false;
	}
}
#if defined _ALS_SetPlayerAttachedObject
    #undef SetPlayerAttachedObject
#else
	native BAD_SetPlayerAttachedObject(playerid, index, modelid, bone, Float:fOffsetX = 0.0, Float:fOffsetY = 0.0, Float:fOffsetZ = 0.0, Float:fRotX = 0.0, Float:fRotY = 0.0, Float:fRotZ = 0.0, Float:fScaleX = 1.0, Float:fScaleY = 1.0, Float:fScaleZ = 1.0, materialcolor1 = 0, materialcolor2 = 0) = SetPlayerAttachedObject;
    #define _ALS_SetPlayerAttachedObject
#endif
#define SetPlayerAttachedObject ATT_SetPlayerAttachedObject

stock ATT_RemovePlayerAttachedObject(playerid, index)
{
	if (RemovePlayerAttachedObject(playerid, index))
	{
		t_PlayerAttachments[playerid][index][att_used] = false;

		return true;
	}
	else
	{
		return false;
	}
}
#if defined _ALS_RemovePlayerAttachedObject
    #undef RemovePlayerAttachedObject
#else
	native BAD_RemovePlayerAttachedObject(playerid, index) = RemovePlayerAttachedObject;
    #define _ALS_RemovePlayerAttachedObject
#endif
#define RemovePlayerAttachedObject ATT_RemovePlayerAttachedObject
