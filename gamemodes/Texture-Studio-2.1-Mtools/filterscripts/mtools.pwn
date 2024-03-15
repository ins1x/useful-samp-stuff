/*
filterscript: MTOOLS
homepage: https://vk.com/1nsanemapping
wiki: https://github.com/ins1x/mtools/wiki

About: MTOOLS for Texture Studio SA:MP

MTOOLS is a filterscript that complements Texture Studio and provides
a classic dialog interface. Mtools gives mappers more features to be more productive.

Requirements:
- SA:MP 0.3.7 R2 server or highter (DL not supported now)
- Incognito Streamer plugin v 2.7+ (Last 2.9.4 supported)
- mtools works correctly with Texture Studio 2.0 and above

Installation:
- Install latest version Texture Studio
- Copy the mtools.amx file to the filterscripts folder
- Create /scriptfiles/mtools folder
- Open the server.cfg file in any editor and add mtools to filtescripts.
	filterscripts tstudio mtools
	plugins crashdetect sscanf streamer filemanager
> Note: mtools is connected after tstudio (filterscripts tstudio mtools)
After loading, press ALT or type /mtools to open the main menu

Editor options: TABSIZE 4, encoding windows-1251, Lang EN-RU
*/

#define VERSION              	"0.3.22"
#define BUILD_DATE             	"16.03.2022"

#define DIALOG_MAIN 				6001
#define DIALOG_OBJECTS				6002
#define DIALOG_CREATEOBJ 			6003
#define DIALOG_DELETE 				6004
#define DIALOG_CAMSET 				6005
#define DIALOG_GROUPEDIT			6006
#define DIALOG_OBJLIST				6007
#define DIALOG_TUTORIAL				6008
#define DIALOG_CREATEMENU			6009
#define DIALOG_TPLIST				6010
#define DIALOG_CREATEMAPICON		6011
#define DIALOG_CREATEPICKUP			6012
#define DIALOG_SCOORDS				6013
#define DIALOG_SETTINGS				6014
#define DIALOG_INFOMENU				6015
#define DIALOG_WEATHER				6016
#define DIALOG_TIME					6017
#define DIALOG_ETC					6018
#define DIALOG_KEYBINDS				6019
#define DIALOG_ABOUT				6020
#define DIALOG_CLEARTEMPFILES		6021
#define DIALOG_SOUNDTEST			6022
#define DIALOG_CMDS					6023
#define DIALOG_GRAVITY				6024
#define DIALOG_ROTATION				6025
#define DIALOG_VEHICLE				6026
#define DIALOG_SOUNDPOINT			6027
#define DIALOG_SKIN					6028
#define DIALOG_CAMINTERPOLATE		6029
#define DIALOG_EDITMENU				6030
#define DIALOG_REMMENU				6031
#define DIALOG_TEXTUREMENU			6032
#define DIALOG_MAPMENU				6033
#define DIALOG_INTERFACE_SETTINGS	6034
#define DIALOG_MAINMENU_KEYBINDSET	6035
#define DIALOG_ACTORS				6036
#define DIALOG_ACTORSMASSMENU		6037
#define DIALOG_ACTORSMASSANIM		6038
#define DIALOG_ACTORCREATE			6039
#define DIALOG_ACTORANIMLIB			6040
#define DIALOG_ACTORANIMNAME		6041
#define DIALOG_PLAYERATTACHMAIN		6042
#define DIALOG_ATPINDEX_SELECT		6043
#define DIALOG_ATPMODEL_SELECT		6044
#define DIALOG_ATPBONE_SELECT		6045
#define DIALOG_ATPCOORD_INPUT		6046
#define DIALOG_VAE					6047
#define DIALOG_VAENEW				6048
#define DIALOG_CREATEPICKUP_BYNUM	6049
#define DIALOG_OBJECTSMENU			6050
#define DIALOG_FAVORITES			6051
#define DIALOG_LIMITS				6052
#define DIALOG_REMDEFOBJECT			6053
#define DIALOG_ACTORINDEX			6054
#define DIALOG_VEHSETTINGS			6055
#define DIALOG_VEHMOD				6056
#define DIALOG_RANGEDEL				6057
#define DIALOG_CAMPOINT				6058
#define DIALOG_CAMDELAY				6059
#define DIALOG_ENVIRONMENT			6060
#define DIALOG_MOVINGOBJ			6061
#define DIALOG_CAMFIX				6062
#define DIALOG_WHEELS				6063
#define DIALOG_OBJSEARCH			6064
#define DIALOG_TEXTURESEARCH		6065
#define DIALOG_ACTORMASSANIM		6066
#define DIALOG_VEHSPEC				6067
#define DIALOG_VEHSTYLING			6068
#define DIALOG_SPOILERS				6069
#define DIALOG_CREDITS				6070
#define DIALOG_OBJDISTANCE			6071
#define DIALOG_OBJDISTANCE2			6072
#define DIALOG_MAPINFO				6073
#define DIALOG_MAPINFO_RESULTS		6074
#define DIALOG_DUPLICATESEARCH		6075
#define DIALOG_FLYMODESETTINGS		6076
#define DIALOG_FMACCEL				6077
#define DIALOG_FMSPEED				6078
#define DIALOG_CREATE3DTEXT			6079
#define DIALOG_3DTEXTMENU			6080
#define DIALOG_INDEX3DTEXT			6081
#define DIALOG_UPDATE3DTEXT			6082
#define DIALOG_DYNOBJSPEED			6083
#define DIALOG_DISTANCE3DTEXT		6084
#define DIALOG_COLOR3DTEXT			6085
#define DIALOG_MODELSIZEINFO		6086
#define DIALOG_ASKDELETE			6087
#define DIALOG_GAMETEXTTEST			6088
#define DIALOG_GAMETEXTSTYLE		6089
#define DIALOG_ROTSET				6090
#define DIALOG_COLORSTIP			6091
#define DIALOG_PREFABMENU			6092
#define DIALOG_CAMDESCRIPTION		6093
#define DIALOG_SETINTERIOR			6094
#define DIALOG_SETWORLD				6095
#define DIALOG_ENVPRESETS			6096
#define DIALOG_TEXTUREBUFFER		6097
#define DIALOG_OBJECTSSEARCH		6098
#define DIALOG_MTAFAVORITES			6099
#define DIALOG_OBJECTSCAT			6100
#define DIALOG_LST_LIGHTING			6101
#define DIALOG_LST_NATURE			6102
#define DIALOG_LST_WALLS			6103
#define DIALOG_LST_TRASH			6104
#define DIALOG_LST_SAMPOBJ			6105
#define DIALOG_LST_STREETS			6106
#define DIALOG_LST_INTERIORS		6107
#define DIALOG_LST_HOUSECOMP		6108
#define DIALOG_LST_LANDSCAPE		6109
#define DIALOG_LST_BANNERS			6110
#define DIALOG_LST_ROADS			6111
#define DIALOG_WEAPONS				6120
#define DIALOG_WEAPONS_MELEE		6121
#define DIALOG_WEAPONS_PISTOLS		6122
#define DIALOG_WEAPONS_SHOTGUNS		6123
#define DIALOG_WEAPONS_SUBMACHINE	6124
#define DIALOG_WEAPONS_RIFLES		6125
#define DIALOG_WEAPONS_ASSAULT		6126
#define DIALOG_WEAPONS_HEAVY		6127
#define DIALOG_WEAPONS_GRENADES		6128
#define DIALOG_WEAPONS_HANDHELD		6129
//#define DIALOG_WEAPONS_RESERVE	6130
#define DIALOG_PICKUPS_ENTER		6131
#define DIALOG_PICKUPS_HOUSE		6132
#define DIALOG_UGMP_FEATURES		6133
#define DIALOG_AUTOTIME				6134

#define COLOR_SERVER_GREY		0x87bae7FF
#define COLOR_GREY 				0xAFAFAFAA
#define COLOR_RED  				0xF40B74FF
#define COLOR_LIME 				0x33DD1100

#include <a_samp>
// UG-MP optional and can work without it
#tryinclude <ugmp>
#tryinclude <ugmp_postfx>

#include <foreach>
#if !defined foreach
	#define foreach(%1,%2) for (new %2 = 0; %2 < MAX_PLAYERS; %2++) if (IsPlayerConnected(%2))
	#define __SSCANF_FOREACH__
#endif

// Add YSF func later
//#include <YSF> //https://github.com/IllidanS4/YSF/wiki
#if !defined _YSF_included
	#if !defined GetGravity
	native Float:GetGravity();
	#endif
#endif

#if !defined _YSF_included
// Already defined in YSF.inc
IsPlayerSpawned(playerid)
{
	new pState = GetPlayerState(playerid);
	return 0 <= playerid <= MAX_PLAYERS && pState != PLAYER_STATE_NONE 
	&& pState != PLAYER_STATE_WASTED && pState != PLAYER_STATE_SPECTATING;
}
#endif

// old include streamer version 2.7.2 (TS 2.0 RU)
#include "/modules/streamer.inc" 
// new include streamer version 2.9.4 (TS 1.9 EN)
//#include <streamer>

// check old or new streamer plugin connected
#if defined INVALID_STREAMER_ID
	#define _new_streamer_included
#else 
	#define INVALID_STREAMER_ID (0)
#endif

#include <filemanager>

/* ** Macros ** */
// HOLDING(keys)
#define HOLDING(%0) \
	((newkeys & (%0)) == (%0))
// RELEASED(keys)
#define RELEASED(%0) \
	(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))
// PRESSED(keys)
#define PRESSED(%0) \
	(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

#define isnull(%1) \
	((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
	
#define GetDistanceBetweenPoints(%0,%1,%2,%3,%4,%6) \
	(VectorSize(%0-%3,%1-%4,%2-%6))

// Streamer macros
#define GetStreamerVersion()					Streamer_IncludeFileVersion
#define GetDynamicObjectPoolSize()				Streamer_GetUpperBound(STREAMER_TYPE_OBJECT)
#define GetDynamicObjectModel(%1)				Streamer_GetIntData(STREAMER_TYPE_OBJECT,(%1),E_STREAMER_MODEL_ID)
//GetNearestVisibleItem
#define GetNearestVisibleObject(%0)				GetNearestVisibleItem((%0),STREAMER_TYPE_OBJECT)
#define GetNearestVisiblePickup(%0)				GetNearestVisibleItem((%0),STREAMER_TYPE_PICKUP)
#define GetNearestVisibleCP(%0)					GetNearestVisibleItem((%0),STREAMER_TYPE_CP)
#define GetNearestVisibleRaceCP(%0)				GetNearestVisibleItem((%0),STREAMER_TYPE_RACE_CP)
#define GetNearestVisibleMapIcon(%0)			GetNearestVisibleItem((%0),STREAMER_TYPE_MAP_ICON)
#define GetNearestVisible3DText(%0)				GetNearestVisibleItem((%0),STREAMER_TYPE_3D_TEXT_LABEL)
#define GetNearestVisibleArea(%0)				GetNearestVisibleItem((%0),STREAMER_TYPE_AREA)
#define GetNearestVisibleActor(%0)				GetNearestVisibleItem((%0),STREAMER_TYPE_ACTOR)

#if defined _streamer_included
	#if !defined _new_streamer_included
	#define MAX_OBJECTS			4096
	#define MAX_ACTORS			4096
	#define MAX_PICKUPS			4096
	#define MAX_MAPICONS		512
	#define MAX_3DTEXT_GLOBAL	4096
	#endif
	#define MAX_REMOVED_OBJECTS	1000
#else
	#define MAX_MAPICONS		100
	#define MAX_REMOVED_OBJECTS	1000
#endif

// for compatibility with older streamer versions
#if !defined _streamer_included
	#if defined STREAMER_TYPE_OBJECT
		#define _streamer_included
	#endif
#endif

/*
65535 invalid objectid
1000 max objects
0 - 999 possible objectid

0 invalid dynamic objectid
~2147483647 max dynamic objects
1 - 2147483647 possible dynamic objectid
*/

#define INVALID_OBJECT_ID (0xFFFF)
#define TEXT3D_DEFAULT_DISTANCE 	20.0
#define TEXT3D_DEFAULT_COLOR	 	0xAFAFAFAA

#define TEXTURE_STUDIO
#define FILTERSCRIPT

// Variables without :bool tag because have problems with export to sql
new DB: mtoolsDB; //main database
new mtoolsRcon = false;
new bindFkeyToFlymode = false;
new useNOS = true;
new useBoost = false;
new useFlip = true;
new useAutoTune = true;
new useAutoFixveh = true;
new use3dTextOnObjects = true;
new removePlayerVehicleOnExit = false;
new targetInfo = true;
new streamedObjectsTD = true;
new aimPoint = true;
new vehCollision = true;
new superJump = true;
new fpsBarTD = true;
new autoLoadMap = true;
new showEditMenu = true;
new askDelete = true;
new savePlayerPos = true;
new hideMtoolsMenu = false;
new useFastMove = false;
new cSelector = true;
new mainMenuKeyCode = 1024; // ALT key
new LangSet = 0;

new EDIT_OBJECT_ID[MAX_PLAYERS];
new EDIT_OBJECT_MODELID[MAX_PLAYERS];
new LAST_OBJECT_ID[MAX_PLAYERS];
new LAST_DIALOG[MAX_PLAYERS];
new SELECTION_MODE[MAX_PLAYERS];
new EDIT_VEHICLE_ID[MAX_PLAYERS];
new PlayerVehicle[MAX_PLAYERS];
new bool:OnFly[MAX_PLAYERS];
new firstperson[MAX_PLAYERS];
new Vehcam[MAX_PLAYERS];
new MAX_VISIBLE_OBJECTS; //defined at OnGameMode init
// PlayerTextDraws
new PlayerText:Objrate[MAX_PLAYERS];
new PlayerText:FPSBAR[MAX_PLAYERS];
new PlayerText:TDspecbar[MAX_PLAYERS]; 
new PlayerText:TDAIM[MAX_PLAYERS];
new PlayerText:Logo[MAX_PLAYERS];
new PlayerText:TDmessage[MAX_PLAYERS];
// Dash Cam (etc Police cam)
new PlayerText:DashCam[MAX_PLAYERS];
new PlayerText:DashCam2[MAX_PLAYERS];

// Forwards
forward LoadMtoolsDb(); // load mtlools.db
forward OnScriptUpdate(); // 0,5 sec timer (replace OnPlayerUpdtae)
forward ShowPlayerMenu(playerid, dialogid); // mtools main menu
forward DeleteObjectsInRange(playerid, Float:range);
forward SpawnNewVehicle(playerid, vehiclemodel); //spawn new veh by id
forward VaeUnDelay(target); // vae delay timer
forward VaeGetKeys(playerid); // vae keys hook
forward SurflyMode(playerid); // switch on/off surfly
forward Surfly(playerid); // timer
forward SetPlayerLookAt(playerid,Float:x,Float:y); // cam set look at point
forward GetVehicleRotation(vehicleid,&Float:rx,&Float:ry,&Float:rz); 
forward MtoolsHudToggle(playerid);// on-off hud
forward FirstPersonMode(playerid);// on-off 1-st person mode
forward AutoTimeChange(playerid);// steps forward 1 hour on the timer
forward SendTexdrawMessage(playerid, hidedelay, text[]); // show textdraw message 
forward HideTexdrawMessage(playerid); // hide mess at the bottom of the screen

// Player spawn data
enum LastPosData
{
	Float:LastPosX, Float:LastPosY,
	Float:LastPosZ, Float:LastPosA
}
new Float:LastPlayerPos[MAX_PLAYERS][LastPosData];

// CAMEDIT
new
	Float:fPX, Float:fPY, Float:fPZ,
	Float:fVX, Float:fVY, Float:fVZ,
	Float:object_x, Float:object_y, Float:object_z
;
const Float:fScale = 5.0;

enum preSetsCamedit
{
	Float:Cam_StartX,
	Float:Cam_StartY,
	Float:Cam_StartZ,
	Float:Cam_EndX,
	Float:Cam_EndY,
	Float:Cam_EndZ,
	Float:Cam_StartLookX,
	Float:Cam_StartLookY,
	Float:Cam_StartLookZ,
	Float:Cam_EndLookX,
	Float:Cam_EndLookY,
	Float:Cam_EndLookZ,
	Cam_MoveSpeed,
	Cam_RotSpeed,
	Cam_EditStatus
}

new Float:CamData[MAX_PLAYERS][preSetsCamedit];

// 3d texts global data
enum text3dData
{
	Text3D:index3d, Text3Dvalue[64],
	Text3Dcolor[11], Float: Text3Ddistance,
	Float: tPosX, Float: tPosY, Float: tPosZ
}
new Text3dArray[MAX_3DTEXT_GLOBAL][text3dData];
new CurrentIndex3dText = 0;

// Object movements system
enum oMovData
{
	Float:X1, Float:Y1,	Float:Z1,
	Float:X2, Float:Y2, Float:Z2,
	MoveSpeed, movobject
}

new Float:ObjectsMoveData[MAX_PLAYERS][oMovData];
// VAE Vehicle attachments editor
enum playerSets
{
	Float:OffSetX,
	Float:OffSetY,
	Float:OffSetZ,
	Float:OffSetRX,
	Float:OffSetRY,
	Float:OffSetRZ,
	obj,
	EditStatus,
	bool: delay,
	lr,
	VehicleID,
	objmodel,
	timer
}

new Float:VaeData[MAX_PLAYERS][playerSets];

const vaeFloatX =  1;
const vaeFloatY =  2;
const vaeFloatZ =  3;
const vaeFloatRX = 4;
const vaeFloatRY = 5;
const vaeFloatRZ = 6;
const vaeModel   = 7;
// END vae

// attachobjectseditor
enum
{
	Float:ATPCOORD_X,
	Float:ATPCOORD_Y,
	Float:ATPCOORD_Z
}
enum
{
	ATPPOS_OFFSET_X,
	ATPPOS_OFFSET_Y,
	ATPPOS_OFFSET_Z,
	ROT_OFFSET_X,
	ROT_OFFSET_Y,
	ROT_OFFSET_Z,
	ATPSCALE_X,
	ATPSCALE_Y,
	ATPSCALE_Z
}

new AttachmentBones[18][15] =
{
	{"Спина"},
	{"Голова"},
	{"Л. плечо"},
	{"Пр. плечо"},
	{"Л. кисть"},
	{"Пр. кисть"},
	{"Л. бедро"},
	{"Пр. бедро"},
	{"Л. стопа"},
	{"Пр. стопа"},
	{"Пр. голень"},
	{"Л. голень"},
	{"Л. предплечье"},
	{"Пр. предплечье"},
	{"Л. ключица"},
	{"Пр. ключица"},
	{"Шея"},
	{"Челюсть"}
};

new AttachmentBonesEN[18][15] =
{
	{"Back"},
	{"Head"},
	{"L. shoulder"},
	{"Right shoulder"},
	{"L. Brush"},
	{"Ex. Brush"},
	{"L. thigh"},
	{"Right thigh"},
	{"L. stop"},
	{"Right stop"},
	{"Right shin"},
	{"L. shin"},
	{"L. forearm"},
	{"R. forearm"},
	{"L. collarbone"},
	{"R. collarbone"},
	{"Neck"},
	{"Jaw"}
};

new
bool:	gEditingAttachments		[MAX_PLAYERS],
		gCurrentAttachIndex		[MAX_PLAYERS],
bool:	gIndexUsed				[MAX_PLAYERS][MAX_PLAYER_ATTACHED_OBJECTS],
		gIndexModel				[MAX_PLAYERS][MAX_PLAYER_ATTACHED_OBJECTS],
		gIndexBone				[MAX_PLAYERS][MAX_PLAYER_ATTACHED_OBJECTS],
Float:	gIndexPos				[MAX_PLAYERS][MAX_PLAYER_ATTACHED_OBJECTS][3],
Float:	gIndexRot				[MAX_PLAYERS][MAX_PLAYER_ATTACHED_OBJECTS][3],
Float:	gIndexSca				[MAX_PLAYERS][MAX_PLAYER_ATTACHED_OBJECTS][3],
		gCurrentAxisEdit		[MAX_PLAYERS];
// END attachobjectseditor

// Actors
new indexActor = 0, animactordatalib[32], animactordataname[32];
//new Actors[11] = {0, 0, ...};
new Actors[10];
// Spawn weapons (default none weapons on spawn)
// example: new weapon[11] = {0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0}; give sawn off 
new weapon[11] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
// Favorite objects. TODO: Add import from base later
new array_FavObjects[28] = {
	1215,1290,1570,1223,3534,3525,3461,3877,
	3524,3472,3437,19588,18728,1361,8623,2811,
	3509,738,19943,1255,946,638,650,3471,1460
};
new AutoTimeTimer = -1;

isNumeric(const string[])
{
    for(new x = 0; x < strlen(string); x++)
    {
        if(string[x] < '0' || string[x] > '9')
            return false;
    }
    return true;
}

main()
{
	print("Filterscript mtools loaded successful.\n");
}

public LoadMtoolsDb()
{
	if(fexist("mtools/mtools.db"))
	{
		mtoolsDB = db_open("mtools/mtools.db");
		print("mtools.db loaded");
	} else {
		// Create table with default values
		mtoolsDB = db_open("mtools/mtools.db");
		db_query(mtoolsDB, "CREATE TABLE Settings (Option text, Value int)");
		db_query(mtoolsDB, "INSERT INTO Settings (Option, Value) VALUES('Language',0)");
		db_query(mtoolsDB, "INSERT INTO Settings (Option, Value) VALUES('mainMenuKeyCode',1024)");
		db_query(mtoolsDB, "INSERT INTO Settings (Option, Value) VALUES('bindFkeyToFlymode',0)");
		db_query(mtoolsDB, "INSERT INTO Settings (Option, Value) VALUES('aimPoint',1)");
		db_query(mtoolsDB, "INSERT INTO Settings (Option, Value) VALUES('useNOS',1)");
		db_query(mtoolsDB, "INSERT INTO Settings (Option, Value) VALUES('useBoost',0)");
		db_query(mtoolsDB, "INSERT INTO Settings (Option, Value) VALUES('useFlip',1)");
		db_query(mtoolsDB, "INSERT INTO Settings (Option, Value) VALUES('useAutoTune',1)");
		db_query(mtoolsDB, "INSERT INTO Settings (Option, Value) VALUES('useAutoFixveh',1)");
		db_query(mtoolsDB, "INSERT INTO Settings (Option, Value) VALUES('use3dTextOnObjects',1)");
		db_query(mtoolsDB, "INSERT INTO Settings (Option, Value) VALUES('removePlayerVehicleOnExit',0)");
		db_query(mtoolsDB, "INSERT INTO Settings (Option, Value) VALUES('targetInfo',1)");
		db_query(mtoolsDB, "INSERT INTO Settings (Option, Value) VALUES('streamedObjectsTD',1)");
		db_query(mtoolsDB, "INSERT INTO Settings (Option, Value) VALUES('vehCollision',0)");
		db_query(mtoolsDB, "INSERT INTO Settings (Option, Value) VALUES('superJump',0)");
		db_query(mtoolsDB, "INSERT INTO Settings (Option, Value) VALUES('fpsBarTD',1)");
		db_query(mtoolsDB, "INSERT INTO Settings (Option, Value) VALUES('autoLoadMap',1)");
		db_query(mtoolsDB, "INSERT INTO Settings (Option, Value) VALUES('showEditMenu',1)");
		db_query(mtoolsDB, "INSERT INTO Settings (Option, Value) VALUES('cSelector',1)");
		if(fexist("mtools/mtools.db")) print("mtools.db created");
		else print("[fail] create mtools.db. Check /scriptfiles/mtools the directory was created!");
	}
	
	// Load settings
	new DBResult:MtoolsSettings;
	new field[64];
	MtoolsSettings = db_query(mtoolsDB, "SELECT Option, Value FROM Settings"); 
	db_get_field_assoc(MtoolsSettings, "Value", field, 24);
	//printf("value lang: %i", strval(field));
	LangSet = strval(field);
	db_next_row(DBResult:MtoolsSettings);
	
	db_get_field_assoc(MtoolsSettings, "Value", field, 24);
	mainMenuKeyCode = strval(field);
	db_next_row(DBResult:MtoolsSettings);
	
	db_get_field_assoc(MtoolsSettings, "Value", field, 24);
	bindFkeyToFlymode = strval(field);
	db_next_row(DBResult:MtoolsSettings);
	
	db_get_field_assoc(MtoolsSettings, "Value", field, 24);
	aimPoint = strval(field);
	db_next_row(DBResult:MtoolsSettings);
	
	db_get_field_assoc(MtoolsSettings, "Value", field, 24);
	useNOS = strval(field);
	db_next_row(DBResult:MtoolsSettings);
	
	db_get_field_assoc(MtoolsSettings, "Value", field, 24);
	useBoost = strval(field);
	db_next_row(DBResult:MtoolsSettings);
	
	db_get_field_assoc(MtoolsSettings, "Value", field, 24);
	useFlip = strval(field);
	db_next_row(DBResult:MtoolsSettings);
	
	db_get_field_assoc(MtoolsSettings, "Value", field, 24);
	useAutoTune = strval(field);
	db_next_row(DBResult:MtoolsSettings);
	
	db_get_field_assoc(MtoolsSettings, "Value", field, 24);
	useAutoFixveh = strval(field);
	db_next_row(DBResult:MtoolsSettings);
	
	db_get_field_assoc(MtoolsSettings, "Value", field, 24);
	use3dTextOnObjects = strval(field);
	db_next_row(DBResult:MtoolsSettings);
	
	db_get_field_assoc(MtoolsSettings, "Value", field, 24);
	removePlayerVehicleOnExit = strval(field);
	db_next_row(DBResult:MtoolsSettings);
	
	db_get_field_assoc(MtoolsSettings, "Value", field, 24);
	targetInfo = strval(field);
	db_next_row(DBResult:MtoolsSettings);
	
	db_get_field_assoc(MtoolsSettings, "Value", field, 24);
	streamedObjectsTD = strval(field);
	db_next_row(DBResult:MtoolsSettings);
	
	db_get_field_assoc(MtoolsSettings, "Value", field, 24);
	vehCollision = strval(field);
	db_next_row(DBResult:MtoolsSettings);
	
	db_get_field_assoc(MtoolsSettings, "Value", field, 24);
	superJump = strval(field);
	db_next_row(DBResult:MtoolsSettings);
	
	db_get_field_assoc(MtoolsSettings, "Value", field, 24);
	fpsBarTD = strval(field);
	db_next_row(DBResult:MtoolsSettings);
	
	db_get_field_assoc(MtoolsSettings, "Value", field, 24);
	autoLoadMap = strval(field);
	db_next_row(DBResult:MtoolsSettings);
	
	db_get_field_assoc(MtoolsSettings, "Value", field, 24);
	showEditMenu = strval(field);
	db_next_row(DBResult:MtoolsSettings);

	db_get_field_assoc(MtoolsSettings, "Value", field, 24);
	cSelector = strval(field);
	db_next_row(DBResult:MtoolsSettings);
	//db_free_result(MtoolsSettings);
	return 1;
}

public OnFilterScriptInit()
{
	// Load database
	LoadMtoolsDb();

	// Check rcon mode
	if(fexist("mtools/rcon.txt")) {
		mtoolsRcon = true;
	}

	// vae init
	for(new i = 0; i < MAX_PLAYERS; ++i)
	{
		if(IsPlayerConnected(i))
		{
			VaeData[i][timer] = -1;
			VaeData[i][obj] =  -1;
		}
	}
	// server version checker
	new server_version[64];
    GetConsoleVarAsString("version", server_version, sizeof(server_version));
	if(strfind("0.3.7", server_version, true) != -1)
	{
		printf("Recommended server version is 0.3.7, current %s", server_version);
	}

	// Streamer config
	#if defined _new_streamer_included
	#undef STREAMER_OBJECT_SD
	#define STREAMER_OBJECT_SD 550.0
	#undef STREAMER_OBJECT_DD
	#define STREAMER_OBJECT_DD 550.0
	
		// use if there are many objects in the interiors and they don’t hope to load
		#if defined AddSimpleModel // DL-SUPPORT
			Streamer_SetVisibleItems(STREAMER_TYPE_OBJECT, 1500);
		#else
			//Sets the current visible item amount 1000 objects(default 500)
			#if defined Streamer_SetVisibleItems
			Streamer_SetVisibleItems(STREAMER_TYPE_OBJECT, MAX_OBJECTS, -1);
			#endif
		#endif	
	#endif

	// Set 0,5 sec update timer 
	SetTimer("OnScriptUpdate",500,true);

	return 1;
}

public OnPlayerConnect(playerid)
{
	//PlayerPlaySound(playerid, 1132, 0.0, 0.0, 0.0);// camera shot
	//SendClientMessage(playerid, COLOR_GREY, 
	//"Visit mtools developers page: https://vk.com/1nsanemapping");
	
	//print("Streamer config:");
	/*(new tmpstr[64];
	format(tmpstr, sizeof(tmpstr), "STREAMER_OBJECT_SD: %.1f | STREAMER_OBJECT_DD: %.1f",
	STREAMER_OBJECT_SD, STREAMER_OBJECT_DD);
	printf("%s", tmpstr);
	*/
	//printf("MAX_VISIBLE_OBJECTS: %i", MAX_VISIBLE_OBJECTS);
	SendRconCommand("language English/Russian");
	
	// This feature is disabled by default to save bandwidth. 
	// But needto use GetPlayerCameraTargetVehicle(playerid)
	EnablePlayerCameraTarget(playerid, true);
	// Texdraws 
	// objects rate info
	//Objrate[playerid] = CreatePlayerTextDraw(playerid, 34, 310, "_");
	Objrate[playerid] = CreatePlayerTextDraw(playerid, 34, 435, "_");
	PlayerTextDrawLetterSize(playerid, Objrate[playerid], 0.20, 1.2);
	PlayerTextDrawAlignment(playerid, Objrate[playerid], 1);
	//PlayerTextDrawColor(playerid, Objrate[playerid], 0xDFA906AA);
	PlayerTextDrawColor(playerid, Objrate[playerid], 0xFFFFFFFF);
	PlayerTextDrawSetShadow(playerid, Objrate[playerid], 0);
	PlayerTextDrawSetOutline(playerid, Objrate[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, Objrate[playerid], 255);
	PlayerTextDrawFont(playerid, Objrate[playerid], 2);
	PlayerTextDrawSetProportional(playerid, Objrate[playerid], 1);
	
	//FPSBAR[playerid] = CreatePlayerTextDraw(playerid, 34, 325, "_");
	FPSBAR[playerid] = CreatePlayerTextDraw(playerid, 34, 425, "_");
	PlayerTextDrawLetterSize(playerid, FPSBAR[playerid], 0.20, 1.2);
	PlayerTextDrawAlignment(playerid, FPSBAR[playerid], 1);
	//PlayerTextDrawColor(playerid, FPSBAR[playerid], 0xDFA906AA);
	PlayerTextDrawColor(playerid, FPSBAR[playerid], 0xFFFFFFFF);
	PlayerTextDrawSetShadow(playerid, FPSBAR[playerid], 0);
	PlayerTextDrawSetOutline(playerid, FPSBAR[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, FPSBAR[playerid], 255);
	PlayerTextDrawFont(playerid, FPSBAR[playerid], 2);
	PlayerTextDrawSetProportional(playerid, FPSBAR[playerid], 1);
	
	TDspecbar[playerid] = CreatePlayerTextDraw(playerid, 20.0, 150.0, " "); 
	PlayerTextDrawFont(playerid, TDspecbar[playerid], 1); 
	PlayerTextDrawLetterSize(playerid, TDspecbar[playerid], 0.195, 0.9); 
	PlayerTextDrawSetOutline(playerid, TDspecbar[playerid], 1); 
	
	TDAIM[playerid] = CreatePlayerTextDraw(playerid, 320.5, 211.5, "."); //light
	PlayerTextDrawFont(playerid, TDAIM[playerid], 1); 
	PlayerTextDrawBackgroundColor(playerid, TDAIM[playerid], 255);
	PlayerTextDrawColor(playerid, TDAIM[playerid], -1);
	PlayerTextDrawLetterSize(playerid, TDAIM[playerid], 0.5, 1.6); 
	PlayerTextDrawSetOutline(playerid, TDAIM[playerid], 0);
	PlayerTextDrawSetProportional(playerid, TDAIM[playerid], 1);
	PlayerTextDrawSetShadow(playerid, TDAIM[playerid], 0);
	
	TDmessage[playerid] = CreatePlayerTextDraw(playerid,370.0, 380.0, "");
	PlayerTextDrawLetterSize(playerid, TDmessage[playerid], 0.25, 1.1);
	PlayerTextDrawAlignment(playerid, TDmessage[playerid], 1);
	PlayerTextDrawColor(playerid, TDmessage[playerid], -1);
	PlayerTextDrawSetShadow(playerid, TDmessage[playerid], 0);
	PlayerTextDrawSetOutline(playerid, TDmessage[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, TDmessage[playerid], 51);
	PlayerTextDrawFont(playerid, TDmessage[playerid], 2);
	PlayerTextDrawSetProportional(playerid, TDmessage[playerid], 1);

	//DashCam[playerid] = CreatePlayerTextDraw(playerid,200.0, 15.0, "");
	DashCam[playerid] = CreatePlayerTextDraw(playerid,150.0, 105.0, "");
	PlayerTextDrawLetterSize(playerid, DashCam[playerid], 0.4, 1.0);
	PlayerTextDrawAlignment(playerid, DashCam[playerid], 1);
	PlayerTextDrawColor(playerid, DashCam[playerid], -1);
	PlayerTextDrawSetShadow(playerid, DashCam[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DashCam[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DashCam[playerid], 51);
	PlayerTextDrawFont(playerid, DashCam[playerid], 2);
	PlayerTextDrawSetProportional(playerid, DashCam[playerid], 1);

	//DashCam2[playerid] = CreatePlayerTextDraw(playerid,400.0, 15.0, "");
	DashCam2[playerid] = CreatePlayerTextDraw(playerid,415.0, 105.0, "");
	PlayerTextDrawLetterSize(playerid, DashCam2[playerid], 0.4, 1.0);
	PlayerTextDrawAlignment(playerid, DashCam2[playerid], 1);
	PlayerTextDrawColor(playerid, DashCam2[playerid], -1);
	PlayerTextDrawSetShadow(playerid, DashCam2[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DashCam2[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DashCam2[playerid], 51);
	PlayerTextDrawFont(playerid, DashCam2[playerid], 2);
	PlayerTextDrawSetProportional(playerid, DashCam2[playerid], 1);

	Logo[playerid] = CreatePlayerTextDraw(playerid, 500, 8, "~R~M~w~TOOLS"); 
	PlayerTextDrawFont(playerid, Logo[playerid], 1); 
	PlayerTextDrawLetterSize(playerid, Logo[playerid], 0.3, 1.0); 
	PlayerTextDrawSetOutline(playerid, Logo[playerid], 1); 
	PlayerTextDrawShow(playerid, Logo[playerid]);
	
	// vars init
	SetPVarInt(playerid,"lang",LangSet); // Lang 0 - RU Lang 1 - EN
	SetPVarInt(playerid,"hud",1); // toggle all internal textdraws 
	SetPVarInt(playerid,"freezed",0); //used in VAE
	SetPVarInt(playerid,"specbar",-1);  //toggle debug(spec) bar
	SetPVarInt(playerid,"Firstperson",0); // toggle first person mod
	SetPVarInt(playerid,"LightsStatus",0); // vehicle lights
	SetPVarInt(playerid, "drunk", 0); // need for frs counter
	SetPVarInt(playerid, "DashCam", 0); // toggle police cam
	PlayerTextDrawShow(playerid, Objrate[playerid]);
	PlayerTextDrawShow(playerid, FPSBAR[playerid]);

	SetPlayerTime(playerid,12,0); 
	SetPVarInt(playerid,"Hour",12); 
	SetPlayerWeather(playerid,2); 
	SetPVarInt(playerid,"Weather",2);
	
	VaeData[playerid][timer] = -1;
	VaeData[playerid][obj] =  -1;
	EDIT_OBJECT_ID[playerid] = -1;
	EDIT_VEHICLE_ID[playerid] = -1;
	SELECTION_MODE[playerid] = 0;
    EDIT_OBJECT_MODELID[playerid] = -1;
    LAST_DIALOG[playerid] = -1;

	OnFly[playerid] = false;
	//hide logo
	//#if defined TEXTURE_STUDIO
	//CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/logo");
	//#endif
	
	SendClientMessageToAllEx(0x33DD1100, 
	"Нажмите <ALT> для вызова mtools. Подробнее /help ",
	"Press <Y> to open mtools. Use /help to get more");
	SendClientMessageToAllEx(0x33DD1100, 
	"Прежде чем приступать к работе создайте либо загрузите карту (/loadmap)",
	"Create or load a map before getting started (/loadmap)");
	
	if(autoLoadMap)
	{
		#if defined TEXTURE_STUDIO
		CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/loadmap");		
		#endif
	}
	#if defined UGMP_POSTFX_INCLUDED
	// Makes rubbish (e.g. the flying 'zombie elvis found' newspapers and leaves) (in)visible for a single player.
	// Rubbish is visible by all players by default.
	TogglePlayerRubbish(playerid, true);
	// Makes procedural grass visible to a single player. 
	// The grass will move with the in-game wind, and is visible to all players by default.
	TogglePlayerGrass(playerid, true);
	SetPVarInt(playerid, "TogglePlayerGrass", true);
	// Enables or disables the sun for a single player.
	TogglePlayerSun(playerid, true);
	SetPVarInt(playerid, "TogglePlayerSun", true);
	// Enables or disables the night vision effect inmediately.
	TogglePlayerNightVision(playerid, true);
	SetPVarInt(playerid, "TogglePlayerNightVision", true);
	// Enables or disables the infrared effect inmediately.
	TogglePlayerInfraRed(playerid, true);
	SetPVarInt(playerid, "TogglePlayerInfraRed", true);
	// Enables or disables the CCTV effect inmediately. This effect is never used in the original game.
	TogglePlayerCCTV(playerid, true);
	SetPVarInt(playerid, "TogglePlayerCCTV", true);
	// Enables or disables the fog effect inmediately. This effect is never used in the original game.
	TogglePlayerFogOverlay(playerid, true);
	SetPVarInt(playerid, "TogglePlayerFogOverlay", true);
	// Enables or disables the video camera effect inmediately. This effect is present in GTA: SA, but never used.
	// It is used in GTA: VC as the camera overlay you see when entering/exiting the golf club or airport.
	TogglePlayerVideoCameraOverlay(playerid, true);
	SetPVarInt(playerid, "TogglePlayerVideoCameraOverlay", true);
	// Makes real-time shadows visible to a single player.
	// This includes the stencil shadow you see below the player on the PC version of GTA: SA. 
	// By default, real-time shadows are enabled for all players.
	TogglePlayerRealTimeShadows(playerid, true);
	SetPVarInt(playerid, "TogglePlayerRealTimeShadows", true);
	#endif 

	return 1;
}

public OnPlayerSpawn(playerid)
{
	SetPlayerHealth(playerid, 99999);
	// TODO: Add save skin option
	new hostname[64]; 
    GetServerVarAsString("hostname", hostname, sizeof(hostname));
	if(strfind(hostname,"1nsanemapping") != -1) SetPlayerSkin(playerid, 160);
	// Restore last position
	if(savePlayerPos)
	{
		if(LastPlayerPos[playerid][LastPosX] != 0.0)
		{
			SetPlayerPos(playerid, LastPlayerPos[playerid][LastPosX], LastPlayerPos[playerid][LastPosY], LastPlayerPos[playerid][LastPosZ]);
			SetActorFacingAngle(playerid, LastPlayerPos[playerid][LastPosA]);
		}
	}
	// Give selected Weapons 
	ResetPlayerWeapons(playerid);
	for(new i = sizeof(weapon) -1; i > -1; i--)
	{
		if (weapon[i] > 0)
		{
			GivePlayerWeapon(playerid, weapon[i], 9998);
		}
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	//firstpersonfix
	if(IsValidObject(firstperson[playerid])) {
		DestroyObject(firstperson[playerid]);
	} 
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	if(savePlayerPos)
	{
		GetPlayerPos(playerid, LastPlayerPos[playerid][LastPosX], LastPlayerPos[playerid][LastPosY], LastPlayerPos[playerid][LastPosZ]);
		GetActorFacingAngle(playerid, LastPlayerPos[playerid][LastPosA]);
	}
	
	PlayerTextDrawDestroy(playerid,	Logo[playerid]);
	PlayerTextDrawDestroy(playerid, TDspecbar[playerid]);
	PlayerTextDrawDestroy(playerid, TDAIM[playerid]);
	PlayerTextDrawDestroy(playerid, FPSBAR[playerid]);
	PlayerTextDrawDestroy(playerid, Objrate[playerid]);
	PlayerTextDrawDestroy(playerid, DashCam[playerid]);
	PlayerTextDrawDestroy(playerid, DashCam2[playerid]);
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	// Open main menu on press ALT (rcon give full menu)
	if(newkeys == mainMenuKeyCode && !hideMtoolsMenu) 
	{
		if(mainMenuKeyCode == 131072)
		{
			// dirty hack (hide default menu)
			GameTextForPlayer(playerid, "~w~", 2000, 0);
		}
		
		if(mtoolsRcon) {
			if(IsPlayerAdmin(playerid)) ShowPlayerMenu(playerid, DIALOG_MAIN);
		} else {
			ShowPlayerMenu(playerid, DIALOG_MAIN);
		}
	
	}
	// open main menu in vehicle
	if(newkeys == 65536)// Y (InVehicle)
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			if(mainMenuKeyCode == 1024)// KEY_ACTION
			{
				if(mtoolsRcon)
				{
					if(IsPlayerAdmin(playerid)) ShowPlayerMenu(playerid, DIALOG_MAIN);
				} else {
					ShowPlayerMenu(playerid, DIALOG_MAIN);
				}
			}
		}
	}
	// hold menu
	if((newkeys & KEY_WALK) && (newkeys & KEY_CROUCH)) { // C + ALT
		if(hideMtoolsMenu) 
		{
			hideMtoolsMenu = false;
			SendClientMessageEx(playerid, -1,
			"Основное меню снова включено",
			"Main menu is on again");
		} else {
			hideMtoolsMenu = true;
			SendClientMessageEx(playerid, -1,
			"Вы скрыли основное меню, стобы вернуть нажмите (C + ALT)",
			"You have hidden the main menu, to return press (C + ALT)");
		}
	}
	// flip H key in vehicle
	if(useFlip)
	{
		if(newkeys == 2 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			FlipVehicle(GetPlayerVehicleID(playerid));
		}
	}
	// boost
	if(useBoost)
	{
		if(PRESSED(KEY_FIRE) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			const Float:velocity = 1.5;
			new Float:angle;
			GetVehicleZAngle(GetPlayerVehicleID(playerid), angle);
			new Float:vx = velocity * -floatcos(angle - 90.0, degrees);
			new Float:vy = velocity * -floatsin(angle - 90.0, degrees);
			SetVehicleVelocity(GetPlayerVehicleID(playerid), vx, vy, 0.0);
		}
	}
	if(useFastMove)
	{
		if(HOLDING(KEY_SPRINT) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		{
			new Float:player_velocity = 5.0;
			new Float:angle;
			GetPlayerFacingAngle(playerid, angle);
			new Float:vx = player_velocity * -floatcos(angle - 90.0, degrees);
			new Float:vy = player_velocity * -floatsin(angle - 90.0, degrees);
			SetPlayerVelocity(playerid, vx, vy, 0.1);
		}
	}
	// autofix to LMB
	if(useAutoFixveh)
	{
		if(PRESSED(KEY_FIRE) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{ 
			RepairVehicle(GetPlayerVehicleID(playerid));
		}
	}
	// Open vae menu on player attemp exit from veh
	if(GetPVarInt(playerid, "VaeEdit") > 0)
	{
		if(newkeys == KEY_SECONDARY_ATTACK) // ENTER
		{
			TogglePlayerControllable(playerid, false);
			SetPVarInt(playerid,"freezed",1);
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) {
				PutPlayerInVehicle(playerid, PlayerVehicle[playerid], 0);
			}
			ShowPlayerMenu(playerid, DIALOG_VAE);
		}
	}
	// Start/stop flymode on F/ENTER
	if(newkeys == KEY_SECONDARY_ATTACK) // ENTER
	{
		if(bindFkeyToFlymode)
		{	
			#if defined TEXTURE_STUDIO
			if(GetPVarInt(playerid, "Editmode") != 5) { 
				CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/flymode");
			}
			#endif
		} else {
			/*
			if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
			{
				#if defined TEXTURE_STUDIO
				if(GetPVarInt(playerid, "Editmode") != 5) { 
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/flymode");
				}
				#endif
			}
			*/
			if(OnFly[playerid])// disable surfly
			{
				new Float:x,Float:y,Float:z;
				GetPlayerPos(playerid,x,y,z);
				SetPlayerPos(playerid,x,y,z);
				OnFly[playerid] = false;
			}
		}
	}
	// Auto tuning press 2
	if(useAutoTune)
	{
		if(newkeys == 512)
		{
			new WheelsIDs[14] = {1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085};
			// http://wiki.sa-mp.com/wiki/Car_Component_ID
			new RandomWheel = random(sizeof(WheelsIDs));
			new vehicleid = GetPlayerVehicleID(playerid);
			if (IsPlayerInAnyVehicle(playerid))
			{
				ChangeVehicleColor(vehicleid, random(120), random(120));
				switch(GetVehicleModel(GetPlayerVehicleID(playerid)))
				{
					case 446,432,448,452,424,453,454,461,462,463,468,471,430,472,449,473,481,484,
					493,509,510,521,538,522,523,532,537,570,581,586,590,569,595,604,611: return 0;
				}
				AddVehicleComponent(vehicleid, WheelsIDs[RandomWheel]);
			}
		}
	}
	// Auto NOs refill
	if(useNOS)
	{
		if(newkeys == 1 || newkeys == 9 || newkeys == 33 
		&& oldkeys != 1 || oldkeys != 9 || oldkeys != 33)
		{
			switch(GetVehicleModel(GetPlayerVehicleID(playerid)))
			{
				case 446,432,448,452,424,453,454,461,462,463,468,471,430,472,449,473,481,484,
				493,509,510,521,538,522,523,532,537,570,581,586,590,569,595,604,611: return 0;
			}
			AddVehicleComponent(GetPlayerVehicleID(playerid), 1010);
		}
	}
	// Super jump on default <KEY_JUMP>
	if(PRESSED(KEY_JUMP))
	{
		if(superJump)
		{
			new Float:SuperJump[3];
			GetPlayerVelocity(playerid, SuperJump[0], SuperJump[1], SuperJump[2]);
			SetPlayerVelocity(playerid, SuperJump[0], SuperJump[1], SuperJump[2]+5);
		}
	}
	// Select object in C key <KEY_CROUCH>
	if(PRESSED(KEY_CROUCH))
	{
		if(cSelector)
		{
			#if defined TEXTURE_STUDIO
			CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/csel");		
			#else 
			SelectObject(playerid);
			#endif
		}
	}
	return 1;
}

public VaeGetKeys(playerid)
{
	new Keys, ud, gametext[36], Float: toAdd;
	
    GetPlayerKeys(playerid,Keys,ud,VaeData[playerid][lr]);    
	switch(Keys)
	{
		case KEY_FIRE:   toAdd = 0.000500;		
		default:         toAdd = 0.005000;
	}	
    if(VaeData[playerid][lr] == 128)
    {
        switch(VaeData[playerid][EditStatus])
        {
            case vaeFloatX:
            {
                VaeData[playerid][OffSetX] = floatadd(VaeData[playerid][OffSetX], toAdd);
                format(gametext, 36, "offsetx: ~w~%f", VaeData[playerid][OffSetX]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatY:
            {
                VaeData[playerid][OffSetY] = floatadd(VaeData[playerid][OffSetY], toAdd);
                format(gametext, 36, "offsety: ~w~%f", VaeData[playerid][OffSetY]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatZ:
            {
                VaeData[playerid][OffSetZ] = floatadd(VaeData[playerid][OffSetZ], toAdd);
                format(gametext, 36, "offsetz: ~w~%f", VaeData[playerid][OffSetZ]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRX:
            {
				if(Keys == 0) VaeData[playerid][OffSetRX] = floatadd(VaeData[playerid][OffSetRX],
				floatadd(toAdd, 1.000000));	
				else VaeData[playerid][OffSetRX] = floatadd(VaeData[playerid][OffSetRX],
				floatadd(toAdd,0.100000));					                			
                format(gametext, 36, "offsetrx: ~w~%f", VaeData[playerid][OffSetRX]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRY:
            {
            	if(Keys == 0) VaeData[playerid][OffSetRY] = floatadd(VaeData[playerid][OffSetRY],
				floatadd(toAdd, 1.000000));	
				else VaeData[playerid][OffSetRY] = floatadd(VaeData[playerid][OffSetRY],
				floatadd(toAdd,0.100000));	
            	format(gametext, 36, "offsetry: ~w~%f", VaeData[playerid][OffSetRY]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRZ:
            {
                if(Keys == 0) VaeData[playerid][OffSetRZ] = floatadd(VaeData[playerid][OffSetRZ],
				floatadd(toAdd, 1.000000));	
				else VaeData[playerid][OffSetRZ] = floatadd(VaeData[playerid][OffSetRZ],
				floatadd(toAdd,0.100000));	
                format(gametext, 36, "offsetrz: ~w~%f", VaeData[playerid][OffSetRZ]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeModel:
            {
                SetTimerEx("VaeUnDelay", 1000, false, "d", playerid);
                if(VaeData[playerid][delay]) return 1;
                DestroyObject(VaeData[playerid][obj]);
                VaeData[playerid][obj] = CreateObject(VaeData[playerid][objmodel]++,
				0.0, 0.0, -10.0, -50.0, 0, 0, 0);
                format(gametext, 36, "model: ~w~%d", VaeData[playerid][objmodel]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
				VaeData[playerid][delay] = true;
            }
		}
		AttachObjectToVehicle(VaeData[playerid][obj], VaeData[playerid][VehicleID],
		VaeData[playerid][OffSetX], VaeData[playerid][OffSetY], VaeData[playerid][OffSetZ],
		VaeData[playerid][OffSetRX], VaeData[playerid][OffSetRY], VaeData[playerid][OffSetRZ]);
	}
	else if(VaeData[playerid][lr] == -128)
	{
	    switch(VaeData[playerid][EditStatus])
        {
            case vaeFloatX:
            {
                VaeData[playerid][OffSetX] = floatsub(VaeData[playerid][OffSetX], toAdd);
                format(gametext, 36, "offsetx: ~w~%f", VaeData[playerid][OffSetX]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatY:
            {
                VaeData[playerid][OffSetY] = floatsub(VaeData[playerid][OffSetY], toAdd);
                format(gametext, 36, "offsety: ~w~%f", VaeData[playerid][OffSetY]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatZ:
            {
                VaeData[playerid][OffSetZ] = floatsub(VaeData[playerid][OffSetZ], toAdd);
                format(gametext, 36, "offsetz: ~w~%f", VaeData[playerid][OffSetZ]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRX:
            {
				if(Keys == 0) VaeData[playerid][OffSetRX] = floatsub(VaeData[playerid][OffSetRX],
				floatadd(toAdd, 1.000000));	
				else VaeData[playerid][OffSetRX] = floatsub(VaeData[playerid][OffSetRX],
				floatadd(toAdd,0.100000));			
                format(gametext, 36, "offsetrx: ~w~%f", VaeData[playerid][OffSetRX]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRY:
            {
            	if(Keys == 0) VaeData[playerid][OffSetRY] = floatsub(VaeData[playerid][OffSetRY],
				floatadd(toAdd, 1.000000));	
				else VaeData[playerid][OffSetRY] = floatsub(VaeData[playerid][OffSetRY],
				floatadd(toAdd,0.100000));	
            	format(gametext, 36, "offsetry: ~w~%f", VaeData[playerid][OffSetRY]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeFloatRZ:
            {
                if(Keys == 0) VaeData[playerid][OffSetRZ] = floatsub(VaeData[playerid][OffSetRZ],
				floatadd(toAdd, 1.000000));	
				else VaeData[playerid][OffSetRZ] = floatsub(VaeData[playerid][OffSetRZ],
				floatadd(toAdd,0.100000));	
                format(gametext, 36, "offsetrz: ~w~%f", VaeData[playerid][OffSetRZ]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
            }
            case vaeModel:
            {
                SetTimerEx("VaeUnDelay", 1000, false, "d", playerid);
                if(VaeData[playerid][delay]) return 1;
                DestroyObject(VaeData[playerid][obj]);
                VaeData[playerid][obj] = CreateObject(VaeData[playerid][objmodel]--,
				0.0, 0.0, -10.0, -50.0, 0, 0, 0);
                format(gametext, 36, "model: ~w~%d", VaeData[playerid][objmodel]);
				GameTextForPlayer(playerid, gametext, 1000, 3);
				VaeData[playerid][delay] = true;
            }
		}
		AttachObjectToVehicle(VaeData[playerid][obj], VaeData[playerid][VehicleID],
		VaeData[playerid][OffSetX], VaeData[playerid][OffSetY], VaeData[playerid][OffSetZ],
		VaeData[playerid][OffSetRX], VaeData[playerid][OffSetRY], VaeData[playerid][OffSetRZ]);
	}
    return 1;
}

public VaeUnDelay(target)
{
    VaeData[target][delay] = false;
    return 1;
}

#if defined _streamer_included
public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	/*EDIT_OBJECT_ID[playerid] = objectid;
	new string[64];
	format(string, sizeof(string), "id: %i", EDIT_OBJECT_ID[playerid]);
	SendClientMessage(playerid, -1, string);*/

	if(showEditMenu)
	{
		if(SELECTION_MODE[playerid] == 4)
		{
			if(response == EDIT_RESPONSE_CANCEL)
			{
				CancelEdit(playerid);
				SELECTION_MODE[playerid] = 0;
				SetPVarInt(playerid, "Editmode",0);
			}
			return 1;
		}
		if(response == EDIT_RESPONSE_FINAL || response == EDIT_RESPONSE_CANCEL)
		{
			CancelEdit(playerid);
			ShowPlayerMenu(playerid,DIALOG_EDITMENU);
			SetPVarInt(playerid, "Editmode",0);
		}
	}
	return 1;
}

public OnPlayerSelectDynamicObject(playerid, objectid, modelid, Float:x, Float:y, Float:z)
{
	// TS Studio enum objects beginning with 0
	EDIT_OBJECT_ID[playerid] = objectid;
	EDIT_OBJECT_MODELID[playerid] = modelid;
	
	/*new string[64];
	format(string, sizeof(string), "id: %i model: %i", objectid, modelid);
	SendClientMessage(playerid, -1, string);*/
		
	switch(GetPVarInt(playerid, "Editmode"))
	{
		case 2:
	    {
			#if defined TEXTURE_STUDIO
			CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/editobject");
			#else
			EditDynamicObject(playerid, objectid);
			#endif
		}
		case 4:
		{
			if(askDelete)
			{
				ShowPlayerDialog(playerid, DIALOG_ASKDELETE, DIALOG_STYLE_MSGBOX,
				"You are sure?", "Delete this object?", "Delete", "Cancel");
			} else {
				#if defined TEXTURE_STUDIO
				CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/dobject");
				#else
				DestroyDynamicObject(objectid);
				#endif
			}
		}
	}
	
	ShowPlayerMenu(playerid,DIALOG_EDITMENU);
	return 1;
}
#endif

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	// the studio texture already has this function, 
	// and is only needed in case you run mtools without TStudio
	if (IsPlayerAdmin(playerid)) 
	{
		SetPlayerPos(playerid, fX, fY, fZ+1.0);
		//format(inmess, sizeof(inmess), "~w~x=%.2f y=%.2f z=%.2f", fX,fY,fZ);
    }
    return 1;
}

/*
public OnPlayerSelectObject(playerid, type, objectid, modelid, Float:fX, Float:fY, Float:fZ)
{
	SetPVarInt(playerid, "SelectedObject", objectid);
	SetPVarInt(playerid, "ModelID", modelid);
	
	SendClientMessagef(playerid, -1, "objectid: %i modelid: %i", objectid, modelid);
	
	return 1;
}
*/
//==================================[CMDS]======================================

public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[128], tmp[128], idx;
	cmd = strtok(cmdtext, idx);
	
	// Menu and submenu binds
	if(!strcmp(cmdtext, "/mtools", true))
    {
		ShowPlayerMenu(playerid, DIALOG_MAIN);
        return 1;
    }
	if (!strcmp(cmdtext, "/map", true))
	{
		ShowPlayerMenu(playerid,DIALOG_MAPMENU);
		return true;
	}
	if (!strcmp(cmdtext, "/mapload", true))
	{
		#if defined TEXTURE_STUDIO
		CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/loadmap");		
		#endif
		return true;
	}
	if (!strcmp(cmdtext, "/mapinfo", true))
	{
		ShowPlayerMenu(playerid,DIALOG_MAPINFO);
		return true;
	}
	if (!strcmp(cmdtext, "/mapicon", true))
	{
		if(GetPVarInt(playerid, "lang") == 0)
		{
			ShowPlayerDialog(playerid, DIALOG_CREATEMAPICON, DIALOG_STYLE_INPUT,
			"Mapicon","{FFFFFF}Посмотреть список доступных mapicon можно на сайте\n"\
			"{00BFFF}https://pawnokit.ru/mapicons_id\n"\
			"{FFFFFF}Введите {00FF00}mapicon ID:\n","Create","Back");
		} else {
			ShowPlayerDialog(playerid, DIALOG_CREATEMAPICON, DIALOG_STYLE_INPUT, "Mapicon",
			"{FFFFFF}Type {00FF00}mapicon ID:\n","Create","Back");
		}
		return true;
	}
	if (!strcmp(cmdtext, "/cam", true))
	{
		ShowPlayerMenu(playerid,DIALOG_CAMSET);
		return true;
	}
	if (!strcmp(cmdtext, "/edit", true))
	{
		ShowPlayerMenu(playerid,DIALOG_EDITMENU);
		return true;
	}
	if (!strcmp(cmdtext, "/new", true))
	{
		ShowPlayerMenu(playerid,DIALOG_CREATEMENU);
		return true;
	}
	if (!strcmp(cmdtext, "/help", true))
	{
		ShowPlayerMenu(playerid, DIALOG_INFOMENU);
		return true;
	}
	if (!strcmp(cmdtext, "/cmds", true) || !strcmp(cmdtext, "/commands", true))
	{
		ShowPlayerMenu(playerid, DIALOG_CMDS);
		return true;
	}
	if(!strcmp(cmdtext,"/w", true) || !strcmp(cmdtext,"/weapons", true))
    {
		ShowPlayerMenu(playerid, DIALOG_WEAPONS);
        return 1;
    }
	if(!strcmp(cmdtext,"/veh", true) || !strcmp(cmdtext,"/vehicle", true) || !strcmp(cmdtext,"/av", true))
    {
		ShowPlayerMenu(playerid, DIALOG_VEHICLE);
        return 1;
    }
	if(!strcmp(cmdtext,"/v", true))
    {
		#if defined TEXTURE_STUDIO
		CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/tcar");		
		#else
		SendClientMessage(playerid, -1, "Function unavaiable. Need TextureStudio");
		#endif
        return 1;
    }
	if (!strcmp(cmdtext, "/v ", true, 3))
	{
		if (!cmdtext[3])
		{
			SendClientMessageEx(playerid, COLOR_GREY,
			"Использование: /v [vehicleid]", "Use: /v [vehicleid]");
			#if defined TEXTURE_STUDIO
			CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/tcar");		
			#endif
			return true;
		}
		new PARAM = strval(cmdtext[3]);
		SpawnNewVehicle(playerid, PARAM);
		return true;
	}
	if (!strcmp(cmd, "/vehcolor", true) || !strcmp(cmd, "/cc", true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER){
			return SendClientMessageEx(playerid, -1,
			"Вы должны быть в машине", "You must be in the car");
		}
		tmp = strtok(cmdtext, idx);
		if (strlen(tmp) == 0){
			return SendClientMessage(playerid, -1, "Use: /carcolor [color1] [color2]. Colors 0-255");
		}
		new c1 = strval(tmp);
		
		if(c1 < 0 || c1 > 255)
		{
			return SendClientMessageEx(playerid, -1,
			"Неверное значение. Доступные 0-255", "Incorrect value. Available 0-255");
		}
		
		tmp = strtok(cmdtext, idx);
		if (strlen(tmp) == 0){
			return SendClientMessage(playerid, -1, "Use: /carcolor [color1] [color2]. Colors 0-255");
		}
		new c2 = strval(tmp);
	
		if(c2 < 0 || c2 > 255)
		{
			return SendClientMessageEx(playerid, -1,
			"Неверное значение. Доступные 0-255", "Incorrect value. Available 0-255");
		}
		new tmpstr[64];
		new vehicleid = GetPlayerVehicleID(playerid);
		ChangeVehicleColor(vehicleid, c1, c2);
		PlayerPlaySound(playerid, 1134, 0, 0, 0);// respray
		format(tmpstr, sizeof tmpstr, "new colors %i - %i", c1, c2);
		SendClientMessage(playerid, -1, tmpstr);
		return 1;
	}
	if(!strcmp("/removepaintjob", cmd, true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER){
			return SendClientMessageEx(playerid, -1,
			"Вы должны быть в машине", "You must be in the car");
		}
		new vehicleid = GetPlayerVehicleID(playerid);
		ChangeVehiclePaintjob(vehicleid, 3);
		return SendClientMessageEx(playerid, -1,
		"Раскраска успешно удалена.", "Paintjob successfully deleted");
	}
	// vae
	if(!strcmp("/vae", cmd, true))
	{
		// if no object selected
		if(VaeData[playerid][obj] == -1)
		{
			ShowPlayerDialog(playerid, DIALOG_VAENEW, DIALOG_STYLE_INPUT, "VAE New attach", 
			"specify the object model to attach to the vehicle.\
			(For example minigun: 362)\nEnter model id:", ">>>","Cancel");
		} else {
			ShowPlayerMenu(playerid, DIALOG_VAE);
		}
		return true;
	}
	if(!strcmp("/vaestop", cmd, true))
	{
		KillTimer(VaeData[playerid][timer]);
		return SendClientMessageEx(playerid, -1, "Редактирование закончено.", "Editing is complete");
	}
	if(!strcmp("/vaesave", cmd, true))
	{		
		tmp = strtok(cmdtext, idx);
		new File: file = fopen("mtools/Vaeditions.txt", io_append);
		new str[200];
		format(str, 200, "\r\nAttachObjectToVehicle(objectid, vehicleid, %f, %f, %f, %f, %f, %f); //Object Model: %d | %s",
		VaeData[playerid][OffSetX], VaeData[playerid][OffSetY], VaeData[playerid][OffSetZ],
		VaeData[playerid][OffSetRX], VaeData[playerid][OffSetRY], VaeData[playerid][OffSetRZ],
		VaeData[playerid][objmodel], tmp);
		fwrite(file, str);
		fclose(file);
		return SendClientMessageEx(playerid, -1, "Всё сохранено в \"vaeditions.txt\".", "Saved to \"vaeditions.txt\".");
	}
	if(!strcmp("/vaemodel", cmd, true))
	{
		//VaeData[playerid][EditStatus] = vaeModel;
		SendClientMessage(playerid, -1, "Editing Object Model.");
		ShowPlayerDialog(playerid, DIALOG_VAENEW, DIALOG_STYLE_INPUT,
		"VAE New attach", "specify the object model to attach to the vehicle.\
		(For example minigun: 362)\nEnter model id:", ">>>","Cancel");
	}
	// END vae
	if(!strcmp(cmdtext, "/drunk", true))
    {	
		tmp = strtok(cmdtext, idx);
		if (strlen(tmp) == 0){
			SendClientMessage(playerid, -1, "Set drunk level. Use: /drunk [0-50000]");
			SendClientMessageEx(playerid, -1, 
			"Когда уровень опьянения игрока выше 5000, скрывается HUD",
			"When the player's intoxication level is above 5000, the HUD is hidden.");
			SetPVarInt(playerid, "drunk", 0);
			SetPlayerDrunkLevel(playerid, 0);
		}
		new drunklvl = strval(tmp);
		//GetPlayerDrunkLevel(playerid);
		if(drunklvl > -1 && drunklvl <= 50000) SetPVarInt(playerid, "drunk", drunklvl);
		else SendClientMessage(playerid, -1, "Set drunk level. Use: /drunk [0-50000]");
		return 1;
	}
	if(!strcmp(cmdtext,"/stop", true))
    {
		if(GetPVarInt(playerid, "Editmode") != 5) { 
			SetPVarInt(playerid, "Editmode", 5);
			if(mainMenuKeyCode == 1024 || mainMenuKeyCode == 262144) {
				hideMtoolsMenu = true;
			}
		} else {
			#if defined TEXTURE_STUDIO
			CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/mtextures");		
			#else
			SendClientMessage(playerid, -1, "Function unavaiable. Need TextureStudio");
			#endif
			SetPVarInt(playerid, "Editmode", 0);
			if(mainMenuKeyCode == 1024 || mainMenuKeyCode == 262144) {
				hideMtoolsMenu = false;
			}
		}
		CancelEdit(playerid);
        return 1;
    }
	if(!strcmp(cmdtext,"/mtexture", true))
    {
		if(GetPVarInt(playerid, "Editmode") != 5) { 
			SetPVarInt(playerid, "Editmode", 5);
			if(mainMenuKeyCode == 1024 || mainMenuKeyCode == 262144) {
				hideMtoolsMenu = true;
			}
		} else {
			SetPVarInt(playerid, "Editmode", 0);
			if(mainMenuKeyCode == 1024 || mainMenuKeyCode == 262144) {
				hideMtoolsMenu = false;
			}
		}
		#if defined TEXTURE_STUDIO
		CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/mtextures");		
		#else
		SendClientMessage(playerid, -1, "Function unavaiable. Need TextureStudio");
		#endif
        return 1;
    }
	if(!strcmp(cmdtext, "/tbuffer", true))
    {
		ShowPlayerMenu(playerid, DIALOG_TEXTUREBUFFER);
		return 1;
	}
	if(!strcmp(cmdtext, "/flip", true))
    {
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			FlipVehicle(GetPlayerVehicleID(playerid));
		}
		return 1;
	}
	if(!strcmp(cmdtext, "/fix", true) || !strcmp(cmdtext, "/vehrepair", true))
    {
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{ 
			RepairVehicle(GetPlayerVehicleID(playerid));
		}
        return 1;
    }
	if(!strcmp(cmdtext, "/wheels", true))
    {
		ShowPlayerDialog(playerid, DIALOG_WHEELS, DIALOG_STYLE_LIST,
		"Wheels",
		"Shadow\nMega\nWires\nClassic\nRimshine\nCutter"\
		"\nTwist\nSwitch\nGrove\nImport\nDollar\nTrance"\
		"\nAtomic\n{A9A9A9}Default",
		"OK", " < ");
		return 1;
	}
	if(!strcmp(cmdtext, "/hydraulics", true))
	{
		AddVehicleComponent(GetPlayerVehicleID(playerid),1087);
		PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
		return 1;
	}
	if(strcmp(cmdtext, "/lights", true) == 0)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if(vehicleid != INVALID_VEHICLE_ID)
			{
				if (GetPVarInt(playerid, "LightsStatus") != 0)
				{
					new engine, lights, alarm, doors, bonnet, boot, objective;
					GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
					SetVehicleParamsEx(vehicleid,engine,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
					SetPVarInt(playerid, "LightsStatus",0);
				} else {	
					new engine, lights, alarm, doors, bonnet, boot, objective;
					GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
					SetVehicleParamsEx(vehicleid,engine,VEHICLE_PARAMS_ON,alarm,doors,bonnet,boot,objective);
					SetPVarInt(playerid, "LightsStatus",1);
				}
			}
		}
		return 1;
	}
	// debug
	if(!strcmp(cmdtext, "/specbar", true, 8)) 
	{
		new specid;
		if(!cmdtext[8]) 
		{
			if(GetPVarInt(playerid, "specbar") == -1)
			{
				PlayerTextDrawHide(playerid, TDspecbar[playerid]);
				specid = playerid;
				PlayerTextDrawShow(playerid, TDspecbar[playerid]);
				SetPVarInt(playerid, "specbar", specid);
				return true;
			} else {
				PlayerTextDrawHide(playerid, TDspecbar[playerid]);
				SetPVarInt(playerid, "specbar",-1);
				return true;
			}
		}
		PlayerTextDrawHide(playerid, TDspecbar[playerid]);
		specid = strval(cmdtext[9]);
		PlayerTextDrawShow(playerid, TDspecbar[playerid]);
		SetPVarInt(playerid, "specbar", specid);
		return true;
	}
	// EDITOR cmds
	if (!strcmp(cmd, "/rotate", true) || !strcmp(cmd, "/rot", true))
	{
		tmp = strtok(cmdtext, idx);
		if (strlen(tmp) == 0){
			SendClientMessage(playerid, -1, "Use: /rotate [rx] [ry] [rz]");
			return ShowPlayerMenu(playerid, DIALOG_ROTATION);
		}
		new rx = strval(tmp);
		
		tmp = strtok(cmdtext, idx);
		if (strlen(tmp) == 0){
			SendClientMessage(playerid, -1, "Use: /rotate [rx] [ry] [rz]");
			return ShowPlayerMenu(playerid, DIALOG_ROTATION);
		}
		new ry = strval(tmp);
	
		tmp = strtok(cmdtext, idx);
		if (strlen(tmp) == 0){
			SendClientMessage(playerid, -1, "Use: /rotate [rx] [ry] [rz]");
			return ShowPlayerMenu(playerid, DIALOG_ROTATION);
		}
		new rz = strval(tmp);
 
		if(EDIT_OBJECT_ID[playerid] == -1) 
			return SendClientMessageEx(playerid, -1,
			"сперва нужно выбрать объект!", "first you need to select an object!");
		
		#if defined TEXTURE_STUDIO
		new param[24];
		format(param, sizeof(param), "/rx %d", rx);
		CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);
		format(param, sizeof(param), "/ry %d", ry);
		CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);
		format(param, sizeof(param), "/rz %d", rz);
		CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);
		#else
		SetDynamicObjectRot(EDIT_OBJECT_ID[playerid], rx, ry, rz);
		#endif
		return 1;
	}
	if (!strcmp(cmd, "/spos", true))
	{
		new Float:pos[4];
		GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
		GetPlayerFacingAngle(playerid, pos[3]);
		SetPVarFloat(playerid, "lastPosX", pos[0]);
		SetPVarFloat(playerid, "lastPosY", pos[1]);
		SetPVarFloat(playerid, "lastPosZ", pos[2]);
		SetPVarFloat(playerid, "lastPosA", pos[3]);
		SendClientMessage(playerid, COLOR_GREY,
		"OnFoot position saved. Use: /lpos to load saved position");
		return 1;
	}
	if (!strcmp(cmd, "/lpos", true))
	{
		if(GetPVarType(playerid, "lastPosX") == PLAYER_VARTYPE_NONE)
		{
			return SendClientMessage(playerid, COLOR_GREY,
			"Use: /spos to save current OnFoot position");
		}
		SetPlayerPos(playerid, GetPVarFloat(playerid, "lastPosX"),
		GetPVarFloat(playerid, "lastPosY"), GetPVarFloat(playerid, "lastPosZ"));
		SetPlayerFacingAngle(playerid, GetPVarFloat(playerid, "lastPosA"));
		SendClientMessage(playerid, COLOR_GREY,
		"Saved OnFoot position loaded");
		return 1;
	}
	if (!strcmp(cmd, "/cpos", true) || !strcmp(cmd, "/coords", true))
	{
		GetPlayerCoords(playerid);
		return 1;
	}
	if (!strcmp(cmd, "/pos", true))
	{
		tmp = strtok(cmdtext, idx);
		if (strlen(tmp) == 0){
			return SendClientMessage(playerid, -1, "Use: /pos [ox] [oy] [oz]");
		}
		new ox = strval(tmp);
		
		tmp = strtok(cmdtext, idx);
		if (strlen(tmp) == 0){
			return SendClientMessage(playerid, -1, "Use: /pos [ox] [oy] [oz]");
		}
		new oy = strval(tmp);
	
		tmp = strtok(cmdtext, idx);
		if (strlen(tmp) == 0){
			return SendClientMessage(playerid, -1, "Use: /pos [ox] [oy] [oz]");
		}
		new oz = strval(tmp);
 
		if(EDIT_OBJECT_ID[playerid] == -1) 
			return SendClientMessageEx(playerid, -1,
			"сперва нужно выбрать объект!", "first you need to select an object!");
		
		#if defined TEXTURE_STUDIO
		new param[24];
		format(param, sizeof(param), "/ox %d", ox);
		CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);
		format(param, sizeof(param), "/oy %d", oy);
		CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);
		format(param, sizeof(param), "/oz %d", oz);
		CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);
		#else
		SetDynamicObjectRot(EDIT_OBJECT_ID[playerid], ox, oy, oz);
		#endif
		return 1;
	}
	if (!strcmp(cmd, "/tplist", true) || !strcmp(cmd, "/teles", true))
	{
		ShowPlayerMenu(playerid, DIALOG_TPLIST);
		return 1;
	}
	if (!strcmp(cmd, "/tpc", true))
	{
		tmp = strtok(cmdtext, idx);
		if (strlen(tmp) == 0){
			return SendClientMessage(playerid, -1, "Use: /tpc [x] [y] [z]");
		}
		new px = strval(tmp);
		
		tmp = strtok(cmdtext, idx);
		if (strlen(tmp) == 0){
			return SendClientMessage(playerid, -1, "Use: /tpc [x] [y] [z]");
		}
		new py = strval(tmp);
	
		tmp = strtok(cmdtext, idx);
		if (strlen(tmp) == 0){
			return SendClientMessage(playerid, -1, "Use: /tpc [x] [y] [z]");
		}
		new pz = strval(tmp);
		
		#if defined TEXTURE_STUDIO
		new param[24];
		format(param, sizeof(param), "/tpcoord %d %d %d", px, py, pz);
		CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);
		#else
		SetPlayerPos(playerid, px, py, pz);
		#endif
		return 1;
	}
	if(!strcmp(cmdtext, "/oadd", true))
	{
		ShowPlayerMenu(playerid,DIALOG_CREATEOBJ);
		return 1;
	}
	if(!strcmp(cmdtext, "/dive", true))
	{
		if(IsPlayerInAnyVehicle(playerid)) return 1;
		tmp = strtok(cmdtext, idx);
		if (strlen(tmp) == 0){
			SendClientMessage(playerid, -1, "Use: /dive [100-2000]");
			return ShowPlayerMenu(playerid, DIALOG_ROTATION);
		}
		new height = strval(tmp);
		
		if(height < 100 || height > 2000) {
			return SendClientMessageEx(playerid, -1,
			"Неккоректное значение. Допустимые от 100 до 2000",
			"Incorrect value. Valid from 100 to 2000");
		}
		new Float:x, Float:y, Float:z;
		//if(IsApplyAnimation(playerid, "FALL_fall") && z > 150) return 1;
		GetPlayerPos(playerid, x, y, z);
		z = z + height;
		SetPlayerPos(playerid, x, y, z);
		GivePlayerWeapon(playerid, 46, 1);
		return 1;
	}
	if(!strcmp(cmdtext, "/nearest", true))
	{
		new tmpstr[64];
		new objectid = GetNearestVisibleItem(playerid, STREAMER_TYPE_OBJECT);
		if (GetPVarInt(playerid, "lang") == 0) {
			format(tmpstr, sizeof(tmpstr), "Nearest object -  objectid: %i modelid: %i",
			objectid, GetDynamicObjectModel(objectid));
		} else {
			format(tmpstr, sizeof(tmpstr), "Ближайший объект - objectid: %i modelid: %i",
			objectid, GetDynamicObjectModel(objectid));
		}
		SendClientMessage(playerid, -1, tmpstr);
		return 1;
	}
	// camera cmds
	if (!strcmp(cmdtext, "/fixcam", true))
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
		{
			new Float:x1,Float:y1,Float:z1;
			GetPlayerCameraPos(playerid,x1,y1,z1);
			SetPlayerCameraPos(playerid, x1,y1,z1);
			GetPlayerCameraLookAt(playerid, x1,y1,z1);
			SetPlayerCameraLookAt(playerid, x1,y1,z1);
		} else {
			new Float:X, Float:Y, Float:Z, Float:Angle;
			GetPlayerPos(playerid, X , Y , Z);
			GetPlayerFacingAngle(playerid, Angle);
			SetPlayerCameraPos(playerid, X , Y , Z); 
			SetPlayerCameraLookAt(playerid, X , Y , Z);
			GetPlayerFacingAngle(playerid, Angle);
		}
		SendClientMessageEx(playerid, -1,
		"Введите /retcam для того чтобы вернуть камеру",
		"Enter /retcam to return the camera");
		return 1;
	}
	if (!strcmp(cmdtext, "/retcam", true))
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
		{
			#if defined TEXTURE_STUDIO
			CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/flymode");
			#endif
		} else {
			SetCameraBehindPlayer(playerid);
		}
		return 1;
	}
	if (!strcmp(cmdtext, "/firstperson", true))
	{
		FirstPersonMode(playerid);
		return true;
	}
	if (!strcmp(cmdtext, "/camera", true))
	{
		GivePlayerWeapon(playerid, 43, 10000);
		return true;
	}
	if (!strcmp(cmdtext, "/jump", true))
	{
		Jump(playerid);
		return true;
	}
	if (!strcmp(cmdtext, "/fly", true) || !strcmp(cmdtext, "/surfly", true))
	{
		SurflyMode(playerid);
		return true;
	}
	if (!strcmp(cmdtext, "/hud", true))
	{
		MtoolsHudToggle(playerid);
		return true;
	}
	if (!strcmp(cmdtext, "/nologo", true))
	{
		PlayerTextDrawHide(playerid, Logo[playerid]);
		return true;
	}
	if(!strcmp(cmdtext, "/freeze", true))
	{
		if(GetPVarInt(playerid, "freezed") > 0)
		{
			TogglePlayerControllable(playerid, true);
			SetPVarInt(playerid,"freezed",0);
			SendClientMessageEx(playerid, -1, "Вы размороженны","You are unfreezed");
		} else {
			TogglePlayerControllable(playerid, false);
			SetPVarInt(playerid,"freezed",1);
			SendClientMessageEx(playerid, -1, "Вы замороженны","You are freezed");
		}
		return 1;
	}
	if(!strcmp(cmdtext, "/unfreeze", true))
	{
		TogglePlayerControllable(playerid, true);
		SetPVarInt(playerid,"freezed",0);
		SendClientMessageEx(playerid, -1, "Вы замороженны","You are freezed");
		return 1;
	}
	if(!strcmp(cmdtext, "/slowmo", true))
	{
		if(GetGravity() == 0.008)
		{
			SendClientMessageEx(playerid, COLOR_LIME,
			"Включен режим слоумо",
			"Slow motion mode enabled");
			SetGravity(0.001);
		} else {
			SetGravity(0.008);
		}
		return 1;
	}
	if (!strcmp(cmdtext, "/respawn", true) || !strcmp(cmdtext, "/kill", true))
	{
	    if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT)
	    {
	        SendClientMessageEx(playerid, COLOR_GREY,
			"Сейчас Вы не можете заспавниться.", "You can't respawn yourself right now.");
	        return true;
	    }
		SpawnPlayer(playerid);
		return true;
	}
	if(!strcmp(cmdtext, "/day", true))
	{
		SetPlayerTime(playerid, 9, 0);
		return 1;
	}
	if(!strcmp(cmdtext, "/night", true))
	{
		SetPlayerTime(playerid, 21, 0); 
		return 1;
	}
	if (!strcmp("/weather", cmd, true))
	{
		tmp = strtok(cmdtext, idx);
		if (strlen(tmp) == 0 || strval(tmp) > 255 || strval(tmp) < 1){
			SendClientMessageEx(playerid, COLOR_GREY,
			"Использование: /weather [№ погоды]", "Use: /weather [weather ID]");
			ShowPlayerDialog(playerid, DIALOG_WEATHER, DIALOG_STYLE_INPUT,
			"Set weather",
			"Weather IDs 1-22 appear to work correctly (max 255)\n"\
			"Enter weather id\n", "Ok", "Cancel");
			return true;
		}
		
		SetPlayerWeather(playerid, strval(tmp)); 
		SetPVarInt(playerid,"Weather",strval(tmp));
		return true;
	}
	if (!strcmp("/time", cmd, true))
	{
		tmp = strtok(cmdtext, idx);
		if (strlen(tmp) == 0 || strval(tmp) > 23 || strval(tmp) < 0){
			SendClientMessageEx(playerid, COLOR_GREY,
			"Использование: /time [час]", "Use: /time [hour]");
			ShowPlayerDialog(playerid, DIALOG_TIME, DIALOG_STYLE_INPUT,
			"Set time", "Enter time [0-23]. Default [12].", "Ok", "Cancel");
			return true;
		}
		
		SetPlayerTime(playerid,strval(tmp),0); 
		SetPVarInt(playerid,"Hour",strval(tmp));
		return true;
	}
	if (!strcmp(cmdtext, "/jetpack", true) || !strcmp(cmdtext, "/jp", true))
	{
		if (GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
		{
			SendClientMessageEx(playerid, COLOR_GREY, 
			"Вы не можете использовать джетпак в наблюдении.", 
			"You can't use jetpack while spectating.");
			return true;
		}
		if (GetPlayerState(playerid) == SPECIAL_ACTION_USEJETPACK)
		{
			SendClientMessageEx(playerid, COLOR_GREY,
			"Вы уже на джетпаке.", "You already have jetpack.");
			return true;
		}
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USEJETPACK);
		return true;
	}
	if (!strcmp(cmdtext, "/deletecar", true))
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			DestroyVehicle(vehicleid);
		}
		return 1;
	}
	if(!strcmp(cmdtext, "/unbug", true))
	{
		//It is necessary to quickly return many variables to their original ones
		//if the player gets into a bug
		CancelEdit(playerid);
		SetCameraBehindPlayer(playerid);
		if(GetGravity() != 0.008) SetGravity(0.008);
		SetPVarInt(playerid, "freezed", 0);
		hideMtoolsMenu = false;
		return 1;
	}
	if(!strcmp(cmdtext, "/autotime", true))
	{
		if(GetPVarInt(playerid, "AutoTime") > 0)
		{
			KillTimer(AutoTimeTimer);
			SetPVarInt(playerid, "AutoTime", 0);
			SendClientMessageEx(playerid, -1,
			"Функция автоматической смены времени остановлена",
			"Automatic time change function stopped");
		} else {
			ShowPlayerMenu(playerid, DIALOG_AUTOTIME);
		}
		return 1;
	}
	if(!strcmp(cmdtext, "/ugmp", true))
	{
		#if defined UGMP_POSTFX_INCLUDED
		new
			grass_state[14], rubbish_state[14],
			sun_state[14], nightvision_state[14],
			infared_state[14], cctv_state[14],
			fogoverlay_state[14], vccam_state[14],
			realtimeshadows_state[14]
		;
		
		if (GetPVarInt(playerid, "TogglePlayerGrass") > 0) grass_state = "{00FF00}[ON]";
		else grass_state = "{FF0000}[OFF]";
		if (IsRubbishVisibleForPlayer(playerid)) rubbish_state = "{00FF00}[ON]";
		else rubbish_state = "{FF0000}[OFF]";
		if (GetPVarInt(playerid, "TogglePlayerSun") > 0) sun_state = "{00FF00}[ON]";
		else sun_state = "{FF0000}[OFF]";
		if (GetPVarInt(playerid, "TogglePlayerNightVision") > 0) nightvision_state = "{00FF00}[ON]";
		else nightvision_state = "{FF0000}[OFF]";
		if (GetPVarInt(playerid, "TogglePlayerInfraRed") > 0) infared_state = "{00FF00}[ON]";
		else infared_state = "{FF0000}[OFF]";
		if (GetPVarInt(playerid, "TogglePlayerCCTV") > 0) cctv_state = "{00FF00}[ON]";
		else cctv_state = "{FF0000}[OFF]";
		if (GetPVarInt(playerid, "TogglePlayerFogOverlay") > 0) fogoverlay_state = "{00FF00}[ON]";
		else fogoverlay_state = "{FF0000}[OFF]";
		if (GetPVarInt(playerid, "TogglePlayerVideoCameraOverlay") > 0) vccam_state = "{00FF00}[ON]";
		else vccam_state = "{FF0000}[OFF]";
		if (GetPVarInt(playerid, "TogglePlayerRealTimeShadows") > 0) realtimeshadows_state = "{00FF00}[ON]";
		else realtimeshadows_state = "{FF0000}[OFF]";
		
		new tablisttext[350];
		format(tablisttext, sizeof(tablisttext),
		"Crass on floor\t%s\n\
		Rubbish on ground\t%s\n\
		Show sun to a player\t%s\n\
		Night vision\t%s\n\
		InfaRed vision\t%s\n\
		CCTV\t%s\n\
		FogOverlay\t%s\n\
		VideoCameraOverlay\t%s\n\
		RealTimeShadows\t%s\n",
		grass_state, rubbish_state, 
		sun_state, nightvision_state,
		infared_state, cctv_state,
		fogoverlay_state, vccam_state,
		realtimeshadows_state);

		ShowPlayerDialog(playerid, DIALOG_UGMP_FEATURES, DIALOG_STYLE_TABLIST,
		"UG-MP Features", tablisttext, "Select", "Cancel");
		#else
		ShowPlayerDialog(playerid, DIALOG_UGMP_FEATURES, DIALOG_STYLE_MSGBOX,
		"UG-MP Features", 
		"UG:MP functions not included.\n\
		Use ug-mp client and connect plugin.\n\
		NOTE: If you really use ugmp client and plugin, try recompile this filterscript.",
		"Select", "Cancel");
		#endif
		return 1;
	}
	// Debug commands
	if(!strcmp(cmdtext, "/testf", true))
    {
		// Per AMX function calling
		//CallFunctionInScript("tstudio", "OnPlayerCommandText", "is", playerid, "/flymode");
		//CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/flymode");
		//SelectObject(playerid);
		//SendClientMessagef(playerid, -1, "cam mode: %i", GetPlayerCameraMode(playerid));
		//SendClientMessagef(playerid, -1, "obj: %i", Streamer_GetUpperBound(STREAMER_TYPE_OBJECT)-1);
		//IsPlayerInRangeOfAnyObject(playerid, 20.0);
		/*new internalid = Streamer_GetItemInternalID(playerid,
		 STREAMER_TYPE_OBJECT, EDIT_OBJECT_ID[playerid]);
		new streamerid = Streamer_GetItemStreamerID(playerid,
		 STREAMER_TYPE_OBJECT, EDIT_OBJECT_ID[playerid]);
		printf("internalid %i streamerid %i", internalid, streamerid);
		*/
        return 1;
    }
	if (!strcmp(cmdtext, "/reloadmtools", true)) 
	{
		if(IsPlayerAdmin(playerid))
		{
			SendRconCommand("unloadfs mtools");
			SendRconCommand("loadfs mtools");
			SendClientMessageEx(playerid, COLOR_GREY, 
			"filterscript mtools был перезагружен",
			"filterscript mtools reloaded");
			return 1;
		} else {
			return SendClientMessageEx(playerid, COLOR_GREY,
			"Для использования этих функций нужны RCON права", 
			"To use these functions, you need RCON rights!");
		}
	}
    return 0;
}

//================================END CMDS======================================

public OnPlayerText(playerid, text[])
{
   return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(response) LAST_DIALOG[playerid] = dialogid;
	new string[256];
	if(dialogid == DIALOG_MAIN)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: ShowPlayerMenu(playerid, DIALOG_EDITMENU);
				case 1: ShowPlayerMenu(playerid, DIALOG_CREATEMENU);
				case 2: ShowPlayerMenu(playerid, DIALOG_REMMENU);
				case 3: ShowPlayerMenu(playerid, DIALOG_TEXTUREMENU);
				case 4: ShowPlayerMenu(playerid, DIALOG_MAPMENU);
				case 5: ShowPlayerMenu(playerid, DIALOG_VEHICLE);
				case 6: ShowPlayerMenu(playerid, DIALOG_CAMSET);
				case 7: ShowPlayerMenu(playerid, DIALOG_ETC);
				case 8: ShowPlayerMenu(playerid, DIALOG_SETTINGS);
				case 9: ShowPlayerMenu(playerid, DIALOG_INFOMENU);
			}
		}
	}
	if(dialogid == DIALOG_INFOMENU)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: ShowPlayerMenu(playerid, DIALOG_CMDS);
				case 1:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/thelp");		
					#else
					SendClientMessage(playerid, -1, "Function unavaiable. Need TextureStudio");
					#endif
				}
				case 2: 
				{
					if (GetPVarInt(playerid, "lang") == 0)
					{
						ShowPlayerDialog(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, 
						"Hotkeys",
						"{FFFFFF}Горячие клавиши mtools:\n"\
						"ALT - откроет меню редатора карт\n"\
						"Escape - чтобы выйти из редактора, или выбора объекта\n"\
						"Space - чтобы вращать камеру во время редактирования\n"\
						"В машине\n"\
						"2 - автотюнинг\n\n"\
						"Горячие клавиши Texture Studio:\n"\
						"Открыть меню:\n"\
						" в flymode - Shift в обычном режиме - N\n\n"\
						"При включенном ежиме выбора текстуры /mtextures\n"\
						"нажмите Alt и текстура встанет на объект\n\n"\
						"В flymode чтобы листать текстуры:\n"\
						" вниз - зажмите F+Num4\n"\
						" вверх - зажмите F+Num6\n"\
						" страница влево - Num4\n"\
						" страница вправо - Num6\n"\
						"Листать текстуры не в /flymode:\n"\
						" вниз - H\n"\
						" вверх - Y\n"\
						" страница влево - Num4\n"\
						" страница вправо - Num6\n\n"\
						"Добавить текстуру в тему:\n"\
						" в флаймоде при введенной команде /csel - ПРОБЕЛ\n"\
						" в обычном режиме - ПРОБЕЛ+ПКМ\n\n"\
						"При включенном /editobject нажмите Alt и объект с копируется.\n"\
						"Скопировать свойства объекта в буфер обмена - H+ЛКМ по объекту\n"\
						"Вставить свойства объекта из буфера обмена - Alt+ЛКМ по объекту. \n",
						"OK","");
					} else {
						ShowPlayerDialog(playerid, DIALOG_TUTORIAL, DIALOG_STYLE_MSGBOX, 
						"Hotkeys",
						"GUI: When in fly mode to open the GUI press 'Jump Key'\n"\
						"otherwise it can be opened by pressing 'N' Key\n"\
						"{FFFFFF} mtools hotkeys: \n"\
						"ALT - will open the map editor menu \n"\
						"Escape - to exit the editor, or select an object \n"\
						"Space - to rotate the camera while editing \n"\
						"In the car \n"\
						"2 - auto tuning \n\n",
						"OK","");
					}
				}
				case 3:
				{
					new tmpstr[48];
					// random color generate
					new c, rcolor[6];
					do {
						rcolor[c] = random(9);
						c+=1;
					} while (c != 6);
					
					ShowPlayerDialog(playerid, DIALOG_COLORSTIP, DIALOG_STYLE_MSGBOX,
					"Color codes {FF0000}RR{008000}GG{0000FF}BB{FFFF00} - HEX",
					"{FF0000}RED \t FF0000 \t 0xFF0000FF\n\
					{008000}GREEN \t 008000 \t 0x008000FF\n\
					{0000FF}BLUE \t 0000FF \t 0x0000FFFF\n\
					{FFFF00}YELLOW \t FFFF00 \t 0xFFFF00FF\n\
					{FF00FF}PINK \t FF00FF \t 0xFF0080FF\n\
					{00ffff}AQUA \t 00FFFF \t 0x00FFFFFF\n\
					{00ff00}LIME \t 00FF00 \t 0x00FF00FF\n\
					{800080}PURPLE \t 800080 \t 0x800080FF\n\
					{FFFFFF}WHITE \t FFFFFF \t 0xFFFFFFFF\n\
					{808080}GREY \t 808080 \t 0x808080FF\n\
					{363636}BLACK \t 000000 \t 0x000000FF\n",
					"OK","Cancel");
					
					format(tmpstr, sizeof(tmpstr),
					"Random color: {%d%d%d%d%d%d}%d%d%d%d%d%d",
					rcolor[0],rcolor[1],rcolor[2],rcolor[3],rcolor[4],rcolor[5],
					rcolor[0],rcolor[1],rcolor[2],rcolor[3],rcolor[4],rcolor[5]);
					SendClientMessage(playerid, -1, tmpstr);
				}
				case 4:	//https://www.burgershot.gg/showthread.php?tid=174
				{
					PlayerPlaySound(playerid, 32402, 0.0, 0.0, 0.0); //heli slah ped 
					ShowPlayerDialog(playerid, DIALOG_CREDITS, DIALOG_STYLE_MSGBOX, "Credits", 
					"{FFFFFF}Texture Studio credits:\n\n"\
					"Pottus - Creating the script itself\n"\
					"Crayder - New developer\n\n"\
					"Incognito - Streamer plugin\n"\
					"Y_Less - sscanf - original object model sizes - YSI\n"\
					"Slice - strlib - sqlitei\n"\
					"JaTochNietDan Filemanager\n"\
					"SDraw - 3D Menu include\n"\
					"codectile - Objectmetry functions\n"\
					"Abyss Morgan - Streamer Functions\n",
					"OK", "");
				}
				case 5: 
				{
					new tbtext[500];
					new header[100];
					format(header, sizeof(header),
					"{FF0000}M{FFFFFF}TOOLS {FFFFFF}Version: {FFD700}%s{FFFFFF} build %s\n",
					VERSION, BUILD_DATE);
					if (GetPVarInt(playerid, "lang") == 0)
					{
						format(tbtext, sizeof(tbtext),
						"{FF0000}m{FFFFFF}tools — это filterscript который дополняет \n\
						Texture Studio и предоставляет классический интерфейс на диалогах \n\
						с основными функциями редактора карт\n\n\
						Домашняя страница mtools: {4682b4}vk.com/1nsanemapping{FFFFFF}\n\
						Нашли баг? Сообщите о находке!\n");
					} else {
						format(tbtext, sizeof(tbtext),
						"{FF0000}m{FFFFFF}tools is a filterscript that complements Texture Studio and provides\n"\
						"a classic dialog interface with basic map editor functions\n\n"\
						"mtools homepage: {4682b4}vk.com/1nsanemapping{FFFFFF}\n"\
						"Have you found a bug? Please report it!\n");
					}
					PlayerPlaySound(playerid, 32402, 0.0, 0.0, 0.0); //heli slah ped 
					ShowPlayerDialog(playerid, DIALOG_ABOUT, DIALOG_STYLE_MSGBOX,
					header,	tbtext, "OK", "");
				}
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_MAIN);
	}
	if(dialogid == DIALOG_ETC)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: Jump(playerid);
				case 1:
				{
					SurflyMode(playerid);
					// failunder
					//new Float:x, Float:y, Float:z;
					//GetPlayerPos(playerid, x,y,z);
					//SetPlayerPos(playerid,x,y,z-4);
				}
				/*case 3:
				{
					ShowPlayerDialog(playerid, DIALOG_SOUNDPOINT, DIALOG_STYLE_INPUT, "Soundpoint",
					"{FFFFFF}Sets the radio to the player's current position(Example: 19800[bass])\nEnter sound ID:", "Select","Cancel");
				}*/
				case 2:
				{
					if (GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
					{
						SendClientMessageEx(playerid, COLOR_GREY,
						"Вы не можете использовать джетпак в наблюдении.",
						"You can't use jetpack while spectating.");
						return true;
					}
					if (GetPlayerState(playerid) == SPECIAL_ACTION_USEJETPACK)
					{
						SendClientMessageEx(playerid, COLOR_GREY,
						"Вы уже на джетпаке.", "You already have jetpack.");
						return true;
					}
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USEJETPACK);
				}
				case 3:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/gotoint");
					#endif
				}
				case 4:
				{
					ShowPlayerMenu(playerid, DIALOG_TPLIST);
				}
				case 5:
				{
					for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++){
						Streamer_Update(i);
					}
					// Note: dynamic objects are restored in 50 ms 
					// (or through the specified value by the Streamer_TickRate function).
					Streamer_DestroyAllVisibleItems(playerid, STREAMER_TYPE_OBJECT);
					SendClientMessageEx(playerid, -1,
					"Все динамические объекты были обновлены","All dynamic objects have been updated");
				}
				case 6: ShowPlayerMenu(playerid, DIALOG_SOUNDTEST);
				case 7: 
				{
					ShowPlayerDialog(playerid, DIALOG_GAMETEXTSTYLE, DIALOG_STYLE_LIST,
					"Select Gametext style",
					"{FFFFFF}Game Text 0\n"\
					"{00FF00}Game Text 1\n"\
					"{FF0000}Game Text 2\n"\
					"{FFFFFF}Game Text 3\n"\
					"{FFFFFF}Game Text 4\n"\
					"{FFFFFF}Game Text 5\n"\
					"{FFFFFF}Game Text 6\n",
					"OK","Cancel");
				}
				case 8: ShowPlayerMenu(playerid, DIALOG_WEAPONS);
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_MAIN);
	}
	if(dialogid == DIALOG_TPLIST)
	{
		if(response)
		{
			#if defined UGMP_INCLUDED
			switch(listitem)
			{
				case 0: SetPlayerPos(playerid,1765.7373,-1895.3802,14.1300); // LS
				case 1: SetPlayerPos(playerid,-1984.3955,138.3253,27.9796); // SF
				case 2: SetPlayerPos(playerid, 1317.222167, 1267.032104, 10.820312); // LV
				case 3: SetPlayerPos(playerid, 6041.0176,-8327.3174,9.8347); // VC
				case 4: SetPlayerPos(playerid, 9348.4795,7643.6357,16.4687); // LC
				case 5: SetPlayerPos(playerid, 8754.6406,14210.1553,6.4485); // bullworth
			}
			#else 
			switch(listitem)
			{
				case 0: SetPlayerPos(playerid,1765.7373,-1895.3802,14.1300); // LS
				case 1: SetPlayerPos(playerid,-1984.3955,138.3253,27.9796); // SF
				case 2: SetPlayerPos(playerid, 1317.222167, 1267.032104, 10.820312); // LV
				case 3: SetPlayerPos(playerid,-2256.1833,2364.7615,5.6276); // Bayside
				case 4: SetPlayerPos(playerid,43.8830,1173.1411,18.8473); // LV bone country
				case 5: SetPlayerPos(playerid,-1064.1818,-1223.9795,130.1247); // SF Flint country
				case 6: SetPlayerPos(playerid,1078.4608,-331.7300,74.8740); // LS Red country 
				case 7: SetPlayerPos(playerid,-2095.4441,-2368.0361,31.3874); // Whetsone - chilliad
			}
			#endif
		}
	}
	if(dialogid == DIALOG_VEHICLE)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: 
				{
					#if defined TEXTURE_STUDIO
					if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
					{
						new param[24];
						EDIT_VEHICLE_ID[playerid] = GetPlayerVehicleID(playerid);
						format(param, sizeof(param), "/avsel %i", EDIT_VEHICLE_ID[playerid]);
						CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);
					}
					#else
					if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)	{
						EDIT_VEHICLE_ID[playerid] = GetPlayerVehicleID(playerid);
					}
					#endif
				}
				case 1: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/tcar");
					#endif
				}
				case 2: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/avnewcar");
					#endif
				}
				case 3: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/avclonecar");
					#endif
				}
				case 4: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/avdeletecar");
					#endif
				}
				case 5: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/avsetspawn");
					#endif
				}
				case 6: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/avexport");
					#endif
				}
				case 7: RespawnAllVehicles();
				case 8: 
				{
					new tbtext[450];
					if(GetPVarInt(playerid, "lang") == 0)
					{		
						format(tbtext, sizeof(tbtext),
						"Цвета\t{00FF00}/avcarcolor\n"\
						"Покрасочные работы\t{00FF00}/avpaint\n"\
						"Телепорт в мастерскую\t{00FF00}/avmodcar\n"\
						"Установить гидравлику\t\n"\
						"Установить закись азота\t\n"\
						"[>] Диски\t\n"\
						"[>] Стайлинг\t\n");
					} else {
						format(tbtext, sizeof(tbtext),
						"Color\t{00FF00}/avcarcolor\n"\
						"Paintjobs\t{00FF00}/avpaint\n"\
						"Workshop teleport\t{00FF00}/avmodcar\n"\
						"Install hydraulics \t\n"\
						"Install NOS \t\n"\
						"[>] Wheels\t\n"\
						"[>] Styling\t\n");
					}
					
					ShowPlayerDialog(playerid, DIALOG_VEHMOD, DIALOG_STYLE_TABLIST,
					"[VEHICLE - TUNING]",tbtext, "OK","Cancel");
				}
				case 9: 
				{
					new tbtext[350];
					if(GetPVarInt(playerid, "lang") == 0)
					{		
						format(tbtext, sizeof(tbtext),
						"Откр Капот\n"\
						"Откр Багажник\n"\
						"[Вкл/откл] Фары\n"\
						"Пробить все 4 колеса\n"\
						"Пробить задние 2 колеса\n"\
						"Сигнализация\n");
					} else {
						format(tbtext, sizeof(tbtext),
						"Open Hood \n"\
						"Open Trunk \n"\
						"[On/off] Headlights \n"\
						"Punch all 4 wheels \n"\
						"Punch rear 2 wheels \n"\
						"Alarm \n");
					}
					
					ShowPlayerDialog(playerid, DIALOG_VEHSPEC, DIALOG_STYLE_LIST,
					"[VEHICLE - Spec]",tbtext, "OK","Cancel");
				}
				case 10: ShowPlayerMenu(playerid, DIALOG_VEHSETTINGS);
			}
		} else {
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) ShowPlayerMenu(playerid, DIALOG_MAIN);
		}
	}
	if(dialogid == DIALOG_VEHSETTINGS)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: 
				{
					if(useBoost)
					{
						useBoost = false;
						SendClientMessageEx(playerid, -1, "Бустер отключен.", "Boost mode disabled.");
					} else {
						useBoost = true;
						SendClientMessageEx(playerid, -1, "Бустер включен. Нажмите ЛКМ для ускорения",
						"Boost mode enabled. Press LMB to increase speed");
					}
					new query[128];
					format(query,sizeof(query),
					"UPDATE `Settings` SET Value=%d WHERE Option='useBoost'", useBoost);
					db_query(mtoolsDB,query);
				}
				case 1: 
				{
					if(useNOS)
					{
						useNOS = false;
						SendClientMessageEx(playerid, -1, "Автопополение NOS отключено.",
						"NOS refill disabled.");
					} else {
						useNOS = true;
						SendClientMessageEx(playerid, -1, "Автопополение NOS включено.",
						"NOS refill enabled.");
					}
					new query[128];
					format(query,sizeof(query),
					"UPDATE `Settings` SET Value=%d WHERE Option='useNOS'", useNOS);
					db_query(mtoolsDB,query);
				}
				case 2:
				{
					if(useAutoFixveh)
					{
						useAutoFixveh = false;
						SendClientMessageEx(playerid, -1, "Автопопочинка отключена",
						"Auto vehicle repair disabled");
					} else {
						useAutoFixveh = true;
						SendClientMessageEx(playerid, -1, "Автопопочинка включена",
						"Auto vehicle repair enabled");
					}
					new query[128];
					format(query,sizeof(query),
					"UPDATE `Settings` SET Value=%d WHERE Option='useAutoFixveh'", useAutoFixveh);
					db_query(mtoolsDB,query);
				}
				case 3:
				{
					if(useAutoTune)
					{
						useAutoTune = false;
						SendClientMessageEx(playerid, -1, "Автотюнинг на <2> отключен",
						"Auto vehicle tuning on key <2> disabled");
					} else {
						useAutoTune = true;
						SendClientMessageEx(playerid, -1, "Автотюнинг на <2> включен",
						"Auto vehicle tuning on key <2> enabled");
					}
					new query[128];
					format(query,sizeof(query),
					"UPDATE `Settings` SET Value=%d WHERE Option='useAutoTune'", useAutoTune);
					db_query(mtoolsDB,query);
				}
				case 4:
				{
					if(useFlip)
					{
						useFlip = false;
						SendClientMessageEx(playerid, -1, "Flip на <H> отключен",
						"Flip on key <H> disabled");
					} else {
						useFlip = true;
						SendClientMessageEx(playerid, -1, "Flip на <H> включен",
						"Flip on key <H> enabled");
					}
					new query[128];
					format(query,sizeof(query),
					"UPDATE `Settings` SET Value=%d WHERE Option='useFlip'", useFlip);
					db_query(mtoolsDB,query);
				}
				case 5:
				{
					if(vehCollision)
					{
						DisableRemoteVehicleCollisions(playerid, 0); //off
						vehCollision = false;
						SendClientMessageEx(playerid, -1, "Коллизия транспорта включена",
						"Vehicle collision enabled");
					} else {
						DisableRemoteVehicleCollisions(playerid, 1); //disable collision
						vehCollision = true;
						SendClientMessageEx(playerid, -1, "Коллизия транспорта отключена", 
						"Vehicle collision disabled");
					}
					new query[128];
					format(query,sizeof(query),
					"UPDATE `Settings` SET Value=%d WHERE Option='vehCollision'", vehCollision);
					db_query(mtoolsDB,query);
				}
				case 6:
				{
					SendClientMessageEx(playerid, COLOR_LIME, 
					"Эта опция работает только для траспорта вызванного через /v [id]",
					"This option only works for a transport called via / v [id]");
					if(removePlayerVehicleOnExit)
					{
						removePlayerVehicleOnExit = false;
						SendClientMessageEx(playerid, -1, "Автоудаление транспорта игрока отключено",
						"auto delete player transport is disabled");
					} else {
						removePlayerVehicleOnExit = true;
						SendClientMessageEx(playerid, -1, "Автоудаление транспорта игрока включено",
						"auto delete player transport is enabled");
					}
					new query[128];
					format(query,sizeof(query),
					"UPDATE `Settings` SET Value=%d WHERE Option='removePlayerVehicleOnExit'", removePlayerVehicleOnExit);
					db_query(mtoolsDB,query);
				}
			}
		} else {
			if(LAST_DIALOG[playerid] == DIALOG_VEHICLE) {
				ShowPlayerMenu(playerid, DIALOG_VEHICLE);
			} else if(LAST_DIALOG[playerid] == DIALOG_SETTINGS) {
				ShowPlayerMenu(playerid, DIALOG_SETTINGS);
			}
		}
	}
	if(dialogid == DIALOG_VEHSTYLING)
	{// https://wiki.sa-mp.com/wiki/Car_Component_ID
	    if(response)
		{
			switch(listitem)
        	{
				case 0:// Alien kit
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					if(GetVehicleModel(vehicleid) == 562) // Elegy
			        {
			            AddVehicleComponent(vehicleid,1036);
			            AddVehicleComponent(vehicleid,1034);
			            AddVehicleComponent(vehicleid,1038);
			            AddVehicleComponent(vehicleid,1040);
			            AddVehicleComponent(vehicleid,1147);
			            AddVehicleComponent(vehicleid,1149);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			        }
					else if(GetVehicleModel(vehicleid) == 565) // Flash
					{
					    AddVehicleComponent(vehicleid,1046);
					    AddVehicleComponent(vehicleid,1047);
					    AddVehicleComponent(vehicleid,1049);
					    AddVehicleComponent(vehicleid,1051);
					    AddVehicleComponent(vehicleid,1054);
					    AddVehicleComponent(vehicleid,1150);
					    AddVehicleComponent(vehicleid,1153);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					}
					else if(GetVehicleModel(vehicleid) == 559) // Jester
					{
					    AddVehicleComponent(vehicleid,1065);
					    AddVehicleComponent(vehicleid,1067);
					    AddVehicleComponent(vehicleid,1069);
					    AddVehicleComponent(vehicleid,1071);
					    AddVehicleComponent(vehicleid,1159);
					    AddVehicleComponent(vehicleid,1160);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					}
					else if(GetVehicleModel(vehicleid) == 560) // Sultan
					{
					    AddVehicleComponent(vehicleid,1141);
					    AddVehicleComponent(vehicleid,1169);
					    AddVehicleComponent(vehicleid,1138);
					    AddVehicleComponent(vehicleid,1026);
					    AddVehicleComponent(vehicleid,1027);
					    AddVehicleComponent(vehicleid,1028);
					    AddVehicleComponent(vehicleid,1032);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					}
					else if(GetVehicleModel(vehicleid) == 558)  // Uranus
					{			
					    AddVehicleComponent(vehicleid,1164);
					    AddVehicleComponent(vehicleid,1166);
					    AddVehicleComponent(vehicleid,1168);
					    AddVehicleComponent(vehicleid,1088);
					    AddVehicleComponent(vehicleid,1090);
					    AddVehicleComponent(vehicleid,1092);
					    AddVehicleComponent(vehicleid,1094);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					} else {
						return SendClientMessageEx(playerid, -1,
						"Недоступно для данного транспорта","Not available for this vehicle");
					}
				}
				case 1:
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					if(GetVehicleModel(vehicleid) == 562) // Elegy
			        {
			            AddVehicleComponent(vehicleid,1035);
			            AddVehicleComponent(vehicleid,1037);
			            AddVehicleComponent(vehicleid,1039);
			            AddVehicleComponent(vehicleid,1041);
			            AddVehicleComponent(vehicleid,1046);
			            AddVehicleComponent(vehicleid,1048);
			            AddVehicleComponent(vehicleid,1172);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			        }
					else if(GetVehicleModel(vehicleid) == 565) // Flash
					{
					    AddVehicleComponent(vehicleid,1045);
					    AddVehicleComponent(vehicleid,1048);
					    AddVehicleComponent(vehicleid,1050);
					    AddVehicleComponent(vehicleid,1052);
					    AddVehicleComponent(vehicleid,1053);
					    AddVehicleComponent(vehicleid,1151);
					    AddVehicleComponent(vehicleid,1152);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					}
					else if(GetVehicleModel(vehicleid) == 559) // Jester
					{
					    AddVehicleComponent(vehicleid,1066);
					    AddVehicleComponent(vehicleid,1068);
					    AddVehicleComponent(vehicleid,1070);
					    AddVehicleComponent(vehicleid,1072);
					    AddVehicleComponent(vehicleid,1073);
					    AddVehicleComponent(vehicleid,1158);
					    AddVehicleComponent(vehicleid,1161);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					}
					/*else if(GetVehicleModel(vehicleid) == 561) // Stratum
					{
					    AddVehicleComponent(vehicleid,1156); //xflow
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					}*/
					else if(GetVehicleModel(vehicleid) == 560) // Sultan
					{
					    AddVehicleComponent(vehicleid,1029);
					    AddVehicleComponent(vehicleid,1030);
					    AddVehicleComponent(vehicleid,1033);
					    AddVehicleComponent(vehicleid,1031);
					    AddVehicleComponent(vehicleid,1139);
					    AddVehicleComponent(vehicleid,1140);
					    AddVehicleComponent(vehicleid,1170);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					}
					else if(GetVehicleModel(vehicleid) == 558)  // Uranus
					{			
					    AddVehicleComponent(vehicleid,1089);
					    AddVehicleComponent(vehicleid,1091);
					    AddVehicleComponent(vehicleid,1093);
					    AddVehicleComponent(vehicleid,1095);
					    AddVehicleComponent(vehicleid,1165);
					    AddVehicleComponent(vehicleid,1167);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					} else {
						return SendClientMessageEx(playerid, -1,
						"Недоступно для данного транспорта","Not available for this vehicle");
					}
				}
				case 2:
				{
					ShowPlayerDialog(playerid, DIALOG_SPOILERS, DIALOG_STYLE_LIST, "Spoilers",
					 "{ffffff}Pro\nWin\nDrag\nAlpha\nChamp\nRace\nWorx","OK", " < ");
				}
				case 3: //hood remove
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					new panels, doors, lights, tires;
					GetVehicleDamageStatus(vehicleid,panels,doors,lights,tires);
					UpdateVehicleDamageStatus(vehicleid, panels, (doors | 0b00000100), lights, tires);
				}
				case 4: // trunk remove
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					new panels, doors, lights, tires;
					GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
					UpdateVehicleDamageStatus(vehicleid, panels, (doors | 0b00000000_00000000_0000100_00000100), lights, tires);
				}
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_VEHICLE);
	}
	if(dialogid == DIALOG_SPOILERS)
	{
	    if(response)
		{
			new vehicleid;
			vehicleid = GetPlayerVehicleID(playerid);
			switch(vehicleid){
				case 406,407,430,432,425,447,464,476,601:
				{
					return SendClientMessageEx(playerid, -1,
					"Недоступно для данного транспорта","Not available for this vehicle"); // airveh
				}
				case 446,448,452,424,453,454,461,462,463,468,471,472,449,473,481,484,493,
				509,510,521,538,522,523,532,537,570,581,586,590,569,595,604,611:
				{
					return SendClientMessageEx(playerid, -1,
					"Недоступно для данного транспорта","Not available for this vehicle");
				}
			}
			// 1000 - Pro 1001 - Win 1002 - Drag 1003 - Alpha 1014 - Champ 1015 - Race 1016 - Worx
		    if(listitem == 0)AddVehicleComponent(vehicleid,1000);
			if(listitem == 1)AddVehicleComponent(vehicleid,1001);
			if(listitem == 2)AddVehicleComponent(vehicleid,1002);
			if(listitem == 3)AddVehicleComponent(vehicleid,1003);
			if(listitem == 4)AddVehicleComponent(vehicleid,1014);
			if(listitem == 5)AddVehicleComponent(vehicleid,1015);
			if(listitem == 6)AddVehicleComponent(vehicleid,1016);
			PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
		}
		else ShowPlayerMenu(playerid, DIALOG_VEHICLE);
	}
	if(dialogid == DIALOG_WHEELS)
	{
	    if(response)
		{
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) {
				return SendClientMessageEx(playerid, -1,
				"Вы должны быть в машине", "You must be in the car");
			}
			new vehicleid;
			vehicleid = GetPlayerVehicleID(playerid);
			switch(listitem)
			{
				case 0: AddVehicleComponent(vehicleid,1073);
				case 1: AddVehicleComponent(vehicleid,1074);
				case 2: AddVehicleComponent(vehicleid,1076);
				case 3: AddVehicleComponent(vehicleid,1077);
				case 4: AddVehicleComponent(vehicleid,1075);
				case 5: AddVehicleComponent(vehicleid,1079);
				case 6: AddVehicleComponent(vehicleid,1078);
				case 7: AddVehicleComponent(vehicleid,1080);
				case 8: AddVehicleComponent(vehicleid,1081);
				case 9: AddVehicleComponent(vehicleid,1082);
				case 10: AddVehicleComponent(vehicleid,1083);
				case 11: AddVehicleComponent(vehicleid,1084);
				case 12: AddVehicleComponent(vehicleid,1085);
				case 13:
				{
					new dop;
					dop = GetVehicleComponentInSlot(vehicleid, 7);
					if(dop != 0)
					{
						RemoveVehicleComponent(vehicleid, dop);
						PlayerPlaySound(playerid,5202,0.0,0.0,0.0);
					}
				}
			}
			if(listitem >= 0 && listitem <= 12) {
				PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
			}
			ShowPlayerDialog(playerid, DIALOG_WHEELS, DIALOG_STYLE_LIST,
			"Wheels",
			"Shadow\nMega\nWires\nClassic\nRimshine\nCutter"\
			"\nTwist\nSwitch\nGrove\nImport\nDollar\nTrance"\
			"\nAtomic\n{A9A9A9}Default",
			"OK", " < ");
		}
	}
	if(dialogid == DIALOG_VEHSPEC) 
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					// open hood
					new vehicleid = GetPlayerVehicleID(playerid);
					if (IsABike(vehicleid) || IsABoat(vehicleid) || 
					IsAPlane(vehicleid) || IsANoSpeed(vehicleid)) {
						return SendClientMessageEx(playerid, -1,
						"Недоступно для данного транспорта","Not available for this vehicle");
					}
					new engine,lights,alarm,doors,bonnet,boot,objective;
					GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
					SetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
					if (bonnet != 0) {
						SetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,0,boot,objective); 
					}
					else SetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,1,boot,objective);
				}
				case 1:
				{
					// open trunk
					new vehicleid = GetPlayerVehicleID(playerid);
					if(IsABike(vehicleid) || IsABoat(vehicleid) ||
					IsAPlane(vehicleid) || IsANoSpeed(vehicleid)) {
						return SendClientMessageEx(playerid, -1,
						"Недоступно для данного транспорта","Not available for this vehicle");
					}
					new engine,lights,alarm,doors,bonnet,boot,objective;
					GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
					SetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
					if(boot != 0) {
						SetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,0,objective);
					}
					else SetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,1,objective);
				}
				case 2:
				{
					// turn on-off lights
					new vehicleid = GetPlayerVehicleID(playerid);
					if(IsABoat(vehicleid) || IsAPlane(vehicleid) ||
					IsANoSpeed(vehicleid)){
						return SendClientMessageEx(playerid, -1,
						"Недоступно для данного транспорта","Not available for this vehicle");
					}
					new engine,lights,alarm,doors,bonnet,boot,objective;
					GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
					SetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
					if(lights != 0){
						SetVehicleParamsEx(vehicleid,engine,0,alarm,doors,bonnet,boot,objective);
					}
					else SetVehicleParamsEx(vehicleid,engine,1,alarm,doors,bonnet,boot,objective);
				}
				case 3: // 4 wheels cut
				{
					if(useAutoFixveh) {
						SendClientMessageEx(playerid, -1,
						"Рекомендуется отключить autofix в настройках для использования этой функции","it is recommended to disable auto-repair in the settings to use this function");
					}
					new vehicleid = GetPlayerVehicleID(playerid);
					if(IsABoat(vehicleid) || IsAPlane(vehicleid) || IsANoSpeed(vehicleid)){
						return SendClientMessageEx(playerid, -1,
						"Недоступно для данного транспорта","Not available for this vehicle");
					}
					new panels, doors, lights, tires;	
					GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
					UpdateVehicleDamageStatus(vehicleid, panels, doors, lights, 15);
				}
				case 4: // 2 wheels cut
				{
					if(useAutoFixveh) {
						SendClientMessageEx(playerid, -1,
						"Рекомендуется отключить autofix в настройках для использования этой функции","it is recommended to disable auto-repair in the settings to use this function");
					}
					new vehicleid = GetPlayerVehicleID(playerid);
					if(IsABoat(vehicleid) || IsAPlane(vehicleid) || IsANoSpeed(vehicleid)){
						return SendClientMessageEx(playerid, -1,
						"Недоступно для данного транспорта","Not available for this vehicle");
					}
					new panels, doors, lights, tires;	
					GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
					UpdateVehicleDamageStatus(vehicleid, panels, doors, lights, 5);
				}
				case 5: // alarm
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					if(IsABoat(vehicleid) || IsAPlane(vehicleid) || IsANoSpeed(vehicleid)){
						return SendClientMessageEx(playerid, -1,
						"Недоступно для данного транспорта","Not available for this vehicle");
					}
					new engine, lights, alarm, doors, bonnet, boot, objective;
					GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
					if(alarm != 0){
						SetVehicleParamsEx(vehicleid, engine,
						lights, 1, doors, bonnet, boot, objective);
					} else {
						SetVehicleParamsEx(vehicleid, engine,
						lights, 0, doors, bonnet, boot, objective);
					}
				}
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_VEHICLE);
	}
	if(dialogid == DIALOG_VEHMOD)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/avcarcolor");		
					#endif
				}
				case 1: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/avpaint");		
					#endif
				}
				case 2: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/avmodcar");		
					#endif
				}
				case 3:
				{
					// hydraulics
					AddVehicleComponent(GetPlayerVehicleID(playerid),1087);
					PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
				}
				case 4:
				{
					switch(GetVehicleModel(GetPlayerVehicleID(playerid)))
					{
						case 446,432,448,452,424,453,454,461,462,463,468,471,430,472,449,473,481,484,
						493,509,510,521,538,522,523,532,537,570,581,586,590,569,595,604,611: return 0;
					}
					AddVehicleComponent(GetPlayerVehicleID(playerid), 1010);
					PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
				}
				case 5: 
				{
					ShowPlayerDialog(playerid, DIALOG_WHEELS, DIALOG_STYLE_LIST,
					"Wheels",
					"Shadow\nMega\nWires\nClassic\nRimshine\nCutter"\
					"\nTwist\nSwitch\nGrove\nImport\nDollar\nTrance"\
					"\nAtomic\n{A9A9A9}Default",
					"OK", " < ");
				}
				case 6:
				{
					if (GetPVarInt(playerid, "lang") == 0)
					{
						ShowPlayerDialog(playerid, DIALOG_VEHSTYLING, DIALOG_STYLE_LIST,
						"Styling",
						"{4682B4}Обвес Wheel Arc. Alien\n"\
						"{FF4500}Обвес Wheel Arc. X-Flow\n"\
						"{E6E6FA}[>] Спойлеры Transfender\n"\
						"{B22222}Снять капот\n"\
						"{B22222}Снять багажник\n",
						"OK", " < ");
					} else {
						ShowPlayerDialog (playerid, DIALOG_VEHSTYLING, DIALOG_STYLE_LIST,
						"Styling",
						"{4682B4} Wheel Arc body kit. Alien \n"\
						"{FF4500} Wheel Arc body kit. X-Flow \n"\
						"{E6E6FA} [>] Spoilers for Transfender \n"\
						"{B22222} Remove the hood \n"\
						"{B22222} Remove trunk \n",
						"OK", "<");
					}
				}
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_VEHICLE);
	}
	if(dialogid == DIALOG_TEXTUREMENU)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: 
				{
					// Disable menu keys on texture mode
					CancelEdit(playerid);
					if(GetPVarInt(playerid, "Editmode") != 5) { 
						SetPVarInt(playerid, "Editmode", 5);
						if(mainMenuKeyCode == 1024 || mainMenuKeyCode == 262144) {
							hideMtoolsMenu = true;
						}
					} else {
						SetPVarInt(playerid, "Editmode", 0);
						if(mainMenuKeyCode == 1024 || mainMenuKeyCode == 262144) {
							hideMtoolsMenu = false;
						}
					}

					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/mtextures");		
					if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
					{
						SendClientMessageEx(playerid, COLOR_LIME,
						"Управление в режиме полета", "Controls in flymode:");
						SendClientMessageEx(playerid, COLOR_LIME,
						"Enter + Num 4 - Пред. текстура, Enter + Num 6 - След. текстура", 
						"Enter + Num 4 - Last Texture, Enter + Num 6 - Next Texture");
					} else {
						SendClientMessageEx(playerid, COLOR_LIME,
						"Управление пешком", "Controls on-foot:");
						SendClientMessageEx(playerid, COLOR_LIME,
						"Y - Пред. текстура, H - След. текстура", 
						"Y - Last Texture, H - Next Texture");
					}
					SendClientMessageEx(playerid, COLOR_LIME,
					"Num 4 - Пред. Страница, Num 6 - След. Страница",
					"Num 4 - Last Page, Num 6 - Next Page");
					SendClientMessageEx(playerid, COLOR_LIME,
					"/stop - Закончить редактирование",
					"/stop - Finish editing");
					#endif
				}
				case 1: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/stexture");		
					#endif
				}
				case 2: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/text");		
					#endif
				}
				case 3: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/sindex");		
					#endif
				}
				case 4: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/ttextures");		
					#endif
				}
				case 5:
				{
					if (GetPVarInt(playerid, "lang") == 0)
					{
						ShowPlayerDialog(playerid, DIALOG_TEXTURESEARCH, DIALOG_STYLE_INPUT,
						"Textures search", 
						"Поиск текстуры по слову. Введите слово для поиска:\n",
						"Select", "Cancel");
					} else {
						ShowPlayerDialog(playerid, DIALOG_TEXTURESEARCH, DIALOG_STYLE_INPUT,
						"Textures search", 
						"Поиск текстуры по слову. Enter a search word:\n",
						"Select", "Cancel");
					}
				}
				case 6: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/mtreset");		
					#endif
				}
				case 7:
				{
					#if defined TEXTURE_STUDIO
					ShowPlayerMenu(playerid, DIALOG_TEXTUREBUFFER);
					#endif
				}	
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_MAIN);
	}
	if(dialogid == DIALOG_TEXTUREBUFFER)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/copy");		
					#endif
				}
				case 1:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/paste");		
					#endif
				}
				case 2:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/clear");		
					#endif
				}
			}
		}
		//else ShowPlayerMenu(playerid, DIALOG_TEXTUREMENU;
	}
	if(dialogid == DIALOG_MAPMENU)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/loadmap");		
					#endif
				}
				case 1: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/newmap");		
					#endif
				}
				case 2:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/renamemap");		
					#endif
				}
				case 3:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/importmap");		
					#endif
				}
				case 4:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/export");		
					#endif
				}
				case 5:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/avexportall");		
					#endif
				}
				case 6:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/gtaobjects");		
					#endif
				}
				case 7:
				{
					ShowPlayerMenu(playerid, DIALOG_PREFABMENU);
				}
				case 8: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/gall");		
					#endif
				}
				case 9:
				{
					if(GetPVarInt(playerid, "lang") == 0)
					{
						ShowPlayerDialog(playerid, DIALOG_CREATEMAPICON, DIALOG_STYLE_INPUT,
						"Mapicon","{FFFFFF}Посмотреть список доступных mapicon можно на сайте\n"\
						"{00BFFF}https://pawnokit.ru/mapicons_id\n"\
						"{FFFFFF}Введите {00FF00}mapicon ID:\n","Create","Back");
					} else {
						ShowPlayerDialog(playerid, DIALOG_CREATEMAPICON, DIALOG_STYLE_INPUT, "Mapicon",
						"{FFFFFF}Type {00FF00}mapicon ID:\n","Create","Back");
					}
				}
				case 10:
				{
					if (GetPVarInt(playerid, "lang") == 0)
					{
						ShowPlayerDialog(playerid, DIALOG_SCOORDS, DIALOG_STYLE_LIST, "Coords",
						"информация о текущей позиции\n"\
						"сохранить координаты в формате: X,Y,Z\n"\
						"сохранить координаты в формате: X,Y,Z,angle\n"\
						"сохранить координаты в формате: {X,Y,Z},\n"\
						"сохранить координаты в формате: {X,Y,Z,angle,world,interior},\n"\
						"сохранить координаты в формате: {maxX,mixX,maxY,minY},\n",
						"Select","Cancel");
					} else {
						ShowPlayerDialog(playerid, DIALOG_SCOORDS, DIALOG_STYLE_LIST, "Coords",
						"information about the current position\n"\
						"save coordinates in the format: X,Y,Z\n"\
						"save coordinates in the format: X,Y,Z,angle\n"\
						"save coordinates in the format: {X, Y, Z},\n"\
						"save coordinates in the format: {X, Y, Z, angle, world, interior},\n"\
						"save coordinates in the format: {maxX, mixX, maxY, minY},\n",
						"Select","Cancel");
					}
				}
				case 11:
				{
					new tbtext[300], CountActors;
					
					#if defined _new_streamer_included
					CountActors = Streamer_CountItems(STREAMER_TYPE_ACTOR, 1);
					#else 
					new i,j;
					for(i = 0, j = GetActorPoolSize(); i <= j; i++)
					{
						if(!IsValidActor(i)) break;
					}
					CountActors = i;
					#endif
						
					format(tbtext, sizeof(tbtext),
					"Objects:\t{FFFF00}%i\n"\
					"Pickups:\t{FFFF00}%i\n"\
					"CPs:\t{FFFF00}%i\n"\
					"Race CPs:\t{FFFF00}%i\n"\
					"MapIcons:\t{FFFF00}%i\n"\
					"3D Texts:\t{FFFF00}%i\n"\
					"Actors:\t{FFFF00}%i\n"\
					"Vehicles:\t{FFFF00}%i\n"\
					"Dynamic areas:\t{FFFF00}%i\n",
					CountDynamicObjects(),
					CountDynamicPickups(),
					CountDynamicCPs(),
					CountDynamicRaceCPs(),
					CountDynamicMapIcons(),
					CountDynamic3DTextLabels(),
					CountActors,
					GetVehiclePoolSize(),
					CountDynamicAreas()
					);
					
					ShowPlayerDialog(playerid, DIALOG_LIMITS, DIALOG_STYLE_TABLIST, "Limits",
					tbtext,"OK","");
				}
				case 12:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/deletemap");		
					#endif
				}
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_MAIN);
	}
	if(dialogid == DIALOG_PREFABMENU)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/gprefab");		
					#endif
				}
				case 1:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/prefabsetz");		
					#endif
				}
				case 2:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/prefab");		
					#endif
				}
			}
		}
	}
	if(dialogid == DIALOG_MAPINFO)
	{
		if(response)
		{
			LoadMapInfo(playerid, listitem);
		}
	}
	if(dialogid == DIALOG_SETTINGS)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: ShowPlayerMenu(playerid, DIALOG_INTERFACE_SETTINGS);
				case 1: ShowPlayerMenu(playerid, DIALOG_KEYBINDS);
				case 2: ShowPlayerMenu(playerid, DIALOG_VEHSETTINGS);
				case 3:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/bindeditor");
					#endif
				}
				case 4: ShowPlayerMenu(playerid, DIALOG_FLYMODESETTINGS);
				case 5:
				{
					if(GetPVarInt(playerid, "lang") == 0)
					{
						SetPVarInt(playerid, "lang",1);
						LangSet = 1;
						SendClientMessage(playerid, COLOR_GREY, "Your language has been set to English");
					} else {
						SetPVarInt(playerid, "lang",0);
						LangSet = 0;
						SendClientMessage(playerid, COLOR_GREY, "Выбран русский язык");
					}
					new query[128];
					format(query,sizeof(query),
					"UPDATE `Settings` SET Value=%d WHERE Option='Language'", LangSet);
					db_query(mtoolsDB,query);
					ShowPlayerMenu(playerid, DIALOG_SETTINGS);
				}
				case 6:
				{
					if (GetPVarInt(playerid, "lang") == 0)
					{
						ShowPlayerDialog(playerid, DIALOG_SKIN, DIALOG_STYLE_INPUT,
						"Смена скина", "{FFFFFF}Введите id скина", "Ok", "Выход");
					} else { 
						ShowPlayerDialog(playerid, DIALOG_SKIN, DIALOG_STYLE_INPUT, 
						"Change skin", "{FFFFFF}Enter the skin ID below", "Confirm", "Cancel");
					}
				}
				case 7:
				{
					//(dialogid == DIALOG_WEATHER) //weather set
					ShowPlayerDialog(playerid, DIALOG_WEATHER, DIALOG_STYLE_INPUT, "Set weather",
					"{FFFFFF}Weather IDs 1-22 appear to work correctly but other IDs may result in strange effects (max 255)\n\n"\
					"1 = SUNNY_LA (DEFAULT)\t11 = EXTRASUNNY_VEGAS (heat waves)\n"\
					"2 = EXTRASUNNY_SMOG_LA\t12 = CLOUDY_VEGAS\n"\
					"3 = SUNNY_SMOG_LA\t13 = EXTRASUNNY_COUNTRYSIDE\n"\
					"4 = CLOUDY_LA\t\t14 = SUNNY_COUNTRYSIDE\n"\
					"5 = SUNNY_SF\t\t15 = CLOUDY_COUNTRYSIDE\n"\
					"6 = EXTRASUNNY_SF\t\t16 = RAINY_COUNTRYSIDE\n"\
					"7 = CLOUDY_SF\t\t17 = EXTRASUNNY_DESERT\n"\
					"8 = RAINY_SF\t\t18 = SUNNY_DESERT\n"\
					"9 = FOGGY_SF\t\t19 = SANDSTORM_DESERT\n"\
					"10 = SUNNY_VEGAS\t20 = UNDERWATER (greenish, foggy)\n\n"\
					"Enter weather id\n",
					"Ok", "Cancel");
				}
				case 8: 
				{
					if (GetPVarInt(playerid, "lang") == 0)
					{
						ShowPlayerDialog(playerid, DIALOG_TIME, DIALOG_STYLE_INPUT, 
						"Set time",	"Введите время [0-23]. Стандартное [12].", "Ok", "Cancel");
					} else {
						ShowPlayerDialog(playerid, DIALOG_TIME, DIALOG_STYLE_INPUT, 
						"Set time",	"Enter time [0-23]. Default [12].", "Ok", "Cancel");
					}
				}
				case 9: 
				{
					if (GetPVarInt(playerid, "lang") == 0)
					{
						ShowPlayerDialog(playerid, DIALOG_GRAVITY, DIALOG_STYLE_INPUT, 
						"Set gravity","Введите значение гравитации. Стандартное [0.008].",
						"OK", "Cancel");
					} else {
						ShowPlayerDialog(playerid, DIALOG_GRAVITY, DIALOG_STYLE_INPUT, 
						"Set gravity","Enter new gravity value. Default server value [0.008].",
						"OK", "Cancel");
					}
				}
				case 10: 
				{
					if (GetPVarInt(playerid, "lang") == 0)
					{
						ShowPlayerDialog(playerid, DIALOG_SETINTERIOR, DIALOG_STYLE_INPUT, 
						"Set interior",	"Введите ID интерьера", "Ok", "Cancel");
					} else {
						ShowPlayerDialog(playerid, DIALOG_SETINTERIOR, DIALOG_STYLE_INPUT, 
						"Set interior",	"Enter interior ID", "Ok", "Cancel");
					}
				}
				case 11: 
				{
					if (GetPVarInt(playerid, "lang") == 0)
					{
						ShowPlayerDialog(playerid, DIALOG_SETWORLD, DIALOG_STYLE_INPUT, 
						"Set virtual world","Введите новый ID виртуального мира", "OK", "Cancel");
					} else {
						ShowPlayerDialog(playerid, DIALOG_SETWORLD, DIALOG_STYLE_INPUT, 
						"Set virtual world","Enter virtual world ID", "OK", "Cancel");
					}
				}
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_MAIN);
	}
	if(dialogid == DIALOG_KEYBINDS)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					if(bindFkeyToFlymode) 
					{
						bindFkeyToFlymode = false;
					} else { 
						bindFkeyToFlymode = true;
					}
					new query[128];
					format(query,sizeof(query),
					"UPDATE `Settings` SET Value=%d WHERE Option='bindFkeyToFlymode'", bindFkeyToFlymode);
					db_query(mtoolsDB,query);
					ShowPlayerMenu(playerid, DIALOG_KEYBINDS);
				}
				case 1:
				{
					ShowPlayerDialog(playerid, DIALOG_MAINMENU_KEYBINDSET, DIALOG_STYLE_LIST, "Set key",
					"{00FF00}< ALT >\n{00FF00}< Y >\n{00FF00}< N >\n{00FF00}< H >\n", "Select", "Cancel");
				}
				case 2:
				{
					if(superJump) 
					{
						SendClientMessageEx(playerid, -1,
						"Супер прыжок деактивирован", "Super jump deactivated");
						superJump = false;
					} else { 
						SendClientMessageEx(playerid, -1,
						"Супер прыжок активирован, нажмите клавишу прыжка для просмотра",
						"Super jump activated, press jump key to view");
						superJump = true;
					}
					new query[128];
					format(query,sizeof(query),
					"UPDATE `Settings` SET Value=%d WHERE Option='superJump'", superJump);
					db_query(mtoolsDB,query);
					ShowPlayerMenu(playerid, DIALOG_KEYBINDS);
				}
				case 3:
				{
					if(useFastMove)
					{
						SendClientMessageEx(playerid, -1,
						"Быстрое перемещение отключено", "Fast move disabled");
						useFastMove= false;
					} else { 
						SendClientMessageEx(playerid, -1,
						"Быстрое перемещение активированно, нажмите клавишу бега для просмотра",
						"Fast move activated, hold sprint key to fast move");
						useFastMove = true;
					}
					ShowPlayerMenu(playerid, DIALOG_KEYBINDS);
				}
				case 4:
				{
					if(cSelector) 
					{
						SendClientMessageEx(playerid, -1,
						"Выбор объектов на клавишу C отключен",
						"Object selection on the C key is disabled");
						cSelector = false;
					} else { 
						SendClientMessageEx(playerid, -1,
						"Выбор объектов на клавишу C включен",
						"Super jump activated, press jump key to view");
						cSelector = true;
					}
					new query[128];
					format(query,sizeof(query),
					"UPDATE `Settings` SET Value=%d WHERE Option='cSelector'", cSelector);
					db_query(mtoolsDB,query);
					ShowPlayerMenu(playerid, DIALOG_KEYBINDS);
				}
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_SETTINGS);
	}
	if(dialogid == DIALOG_MAINMENU_KEYBINDSET)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: mainMenuKeyCode = 1024;
				case 1: mainMenuKeyCode = 65536;
				case 2: mainMenuKeyCode = 131072;
				case 3: mainMenuKeyCode = 262144;
				case 4: mainMenuKeyCode = 320;
			}
			new query[128];
			format(query,sizeof(query),
			"UPDATE `Settings` SET Value=%d WHERE Option='mainMenuKeyCode'", mainMenuKeyCode);
			db_query(mtoolsDB,query);
			ShowPlayerMenu(playerid, DIALOG_KEYBINDS);
			if(mainMenuKeyCode == 131072)
			{
				SendClientMessageEx(playerid, -1,
				"Не рекомендуется использовать эту клавишу - она задействована под стандартное меню TS",
				"Not recommended to use this key - it is used under the standard TS menu");
			}
			if(mainMenuKeyCode == 320)
			{
				SendClientMessageEx(playerid, -1,
				"Нажмите колесико мышки для просмотра",
				"Press Middle Mouse Button (MMB) to open main menu");
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_SETTINGS);
	}
	if(dialogid == DIALOG_INTERFACE_SETTINGS)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					if(streamedObjectsTD) 
					{
						PlayerTextDrawHide(playerid, Objrate[playerid]);
						streamedObjectsTD = false;
					} else { 
						PlayerTextDrawShow(playerid, Objrate[playerid]);
						streamedObjectsTD = true;
					}
					new query[128];
					format(query,sizeof(query),
					"UPDATE `Settings` SET Value=%d WHERE Option='streamedObjectsTD'",
					streamedObjectsTD);
					db_query(mtoolsDB,query);
					ShowPlayerMenu(playerid, DIALOG_INTERFACE_SETTINGS);
				}
				case 1:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/position");
					#else 
					GetPlayerCoords(playerid);
					#endif
					// hides overlaid text-frames
					if(streamedObjectsTD) {
						PlayerTextDrawHide(playerid, Objrate[playerid]);
						streamedObjectsTD = false;
					} else { 
						PlayerTextDrawShow(playerid, Objrate[playerid]);
						streamedObjectsTD = true;
					}
					if(fpsBarTD) {
						fpsBarTD = false;
					} else { 
						fpsBarTD = true;
					}
					ShowPlayerMenu(playerid, DIALOG_INTERFACE_SETTINGS);
				}
				case 2:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/edittext3d");
					#endif
				}
				case 3:
				{
					#if defined TEXTURE_STUDIO
					if(use3dTextOnObjects)
					{
						CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/hidetext3d");
						
					} else {
						CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/showtext3d");
					}
					new query[128];
					format(query,sizeof(query),
					"UPDATE `Settings` SET Value=%d WHERE Option='use3dTextOnObjects'", use3dTextOnObjects);
					db_query(mtoolsDB,query);
					#else
					SendClientMessageEx(playerid, -1, "Эта функция доступна только в TextureStudio",
					"This feature is only available in TextureStudio");
					#endif
				}
				case 4:
				{
					if(fpsBarTD) 
					{
						fpsBarTD = false;
					} else { 
						fpsBarTD = true;
					}
					new query[128];
					format(query,sizeof(query),
					"UPDATE `Settings` SET Value=%d WHERE Option='fpsBarTD'",
					fpsBarTD);
					db_query(mtoolsDB,query);
					ShowPlayerMenu(playerid, DIALOG_INTERFACE_SETTINGS);
				}
				case 5:
				{
					if(autoLoadMap) 
					{
						autoLoadMap = false;
					} else { 
						autoLoadMap = true;
					}
					new query[128];
					format(query,sizeof(query),
					"UPDATE `Settings` SET Value=%d WHERE Option='autoLoadMap'",
					autoLoadMap);
					db_query(mtoolsDB,query);
					ShowPlayerMenu(playerid, DIALOG_INTERFACE_SETTINGS);
				}
				case 6:
				{
					if(showEditMenu) 
					{
						showEditMenu = false;
					} else { 
						showEditMenu = true;
					}
					new query[128];
					format(query,sizeof(query),
					"UPDATE `Settings` SET Value=%d WHERE Option='showEditMenu'",
					showEditMenu);
					db_query(mtoolsDB,query);
					ShowPlayerMenu(playerid, DIALOG_INTERFACE_SETTINGS);
				}
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_SETTINGS);
	}
	if(dialogid == DIALOG_CREATEMENU)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: ShowPlayerMenu(playerid, DIALOG_OBJECTSMENU);
				case 1: ShowPlayerMenu(playerid, DIALOG_3DTEXTMENU);
				case 2: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/textobj");
					#endif
				}
				case 3: ShowPlayerMenu(playerid, DIALOG_CREATEPICKUP);
				case 4: ShowMainAttachEditMenu(playerid);
				case 5:
				{
					// if no object selected
					if(VaeData[playerid][obj] == -1)
					{
						ShowPlayerDialog(playerid, DIALOG_VAENEW, DIALOG_STYLE_INPUT, "VAE New attach", 
						"specify the object model to attach to the vehicle.\
						(For example minigun: 362)\nEnter model id:",
						">>>","Cancel");
					} else {
						ShowPlayerMenu(playerid, DIALOG_VAE);
					}
				}
				case 6: ShowPlayerMenu(playerid, DIALOG_ACTORS);
				case 7: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/newmap");		
					#endif
				}
			}
		} 
		else ShowPlayerMenu(playerid, DIALOG_MAIN);
	}
	if(dialogid == DIALOG_OBJECTSMENU)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: ShowPlayerMenu(playerid,DIALOG_CREATEOBJ);
				case 1: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/lsel");
					#endif
				}
				case 2:	ShowPlayerMenu(playerid,DIALOG_OBJECTSCAT);
				case 3: ShowPlayerMenu(playerid,DIALOG_OBJECTSSEARCH);
				case 4:
				{
					if (GetPVarInt(playerid, "lang") == 0)
					{
						ShowPlayerDialog(playerid, DIALOG_MODELSIZEINFO, DIALOG_STYLE_INPUT,
						"Object model information", 
						"Введите modelid для поиска:\n",
						"Search", "Cancel");
					} else {
						ShowPlayerDialog(playerid, DIALOG_MODELSIZEINFO, DIALOG_STYLE_INPUT,
						"Object model information", 
						"Enter modelid to search:\n",
						"Search", "Cancel");
					}
				}
				case 5:
				{
					#if defined STREAMER_ALL_TAGS
					Streamer_ToggleAllItems(playerid, STREAMER_TYPE_OBJECT, 1);
					#else
						#if defined _YSF_included
						for(new i = 0; i < MAX_OBJECTS; i++)
						{
							if(IsObjectHiddenForPlayer(playerid, i)) ShowObjectForPlayer(playerid, i);
						}
						#endif
					#endif
					SendClientMessageEx(playerid, -1,
					"Все скрытые объекты были показаны","All hidden objects have been revealed");
				}
				case 6:
				{
					new tbtext[400];
					
					format(tbtext, sizeof tbtext,
					"Select object\t\n"\
					"Set start position\t%.2f,%.2f,%.2f\n"\
					"Set final position\t%.2f,%.2f,%.2f\n"\
					"Set move speed\t%i\n"\
					"Preview\t\n"\
					"Stop\t\n"\
					"Export to filterscript\t\n",
					ObjectsMoveData[playerid][X1],
					ObjectsMoveData[playerid][Y1],
					ObjectsMoveData[playerid][Z1],
					ObjectsMoveData[playerid][X2],
					ObjectsMoveData[playerid][Y2],
					ObjectsMoveData[playerid][Z2],
					ObjectsMoveData[playerid][MoveSpeed]);
					
					ShowPlayerDialog(playerid, DIALOG_MOVINGOBJ, DIALOG_STYLE_TABLIST,
					"[CAM] - Object moviements (MoveDynamicObject)", tbtext,
					"Select", "Cancel");
				}
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_CREATEMENU);
	}
	if(dialogid == DIALOG_OBJECTSSEARCH)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					if (GetPVarInt(playerid, "lang") == 0)
					{
						ShowPlayerDialog(playerid, DIALOG_OBJSEARCH, DIALOG_STYLE_INPUT,
						"Object search", 
						"Поиск объектов по слову. Введите слово для поиска:\n",
						"Search", "Cancel");
					} else {
						ShowPlayerDialog(playerid, DIALOG_OBJSEARCH, DIALOG_STYLE_INPUT,
						"Object search", 
						"Search for objects by word. Enter a search word:\n",
						"Search", "Cancel");
					}
				}
				case 1: 
				{
					new tbtext[128];
					new objectid = GetNearestVisibleItem(playerid, STREAMER_TYPE_OBJECT);
					if (GetPVarInt(playerid, "lang") == 0) {
						format(tbtext, sizeof(tbtext),
						"{FFFFFF}Nearest object %i - modelid: %i\nEnter modelid to search:",
						objectid, GetDynamicObjectModel(objectid));
					} else {
						format(tbtext, sizeof(tbtext),
						"{FFFFFF}Ближайший объект %i - modelid: %i\nВведите modelid для поиска:",
						objectid, GetDynamicObjectModel(objectid));
					}
					ShowPlayerDialog(playerid, DIALOG_DUPLICATESEARCH, DIALOG_STYLE_INPUT,
					"Duplicate search",tbtext, "Search", "Cancel");
				}
				case 2:
				{
					ShowPlayerDialog(playerid, DIALOG_OBJDISTANCE, DIALOG_STYLE_INPUT,
					"Distance [object #1]",
					"{FFFFFF}Determine the distance between two objects. Enter objectid:",
					"Next", "Cancel");
				}
				case 3:
				{
					new tmpstr[64];
					new objectid = GetNearestVisibleItem(playerid, STREAMER_TYPE_OBJECT);
					if (GetPVarInt(playerid, "lang") == 0) {
						format(tmpstr, sizeof(tmpstr), "Nearest object -  objectid: %i modelid: %i",
						objectid, GetDynamicObjectModel(objectid));
					} else {
						format(tmpstr, sizeof(tmpstr), "Ближайший объект - objectid: %i modelid: %i",
						objectid, GetDynamicObjectModel(objectid));
					}
					SendClientMessage(playerid, -1, tmpstr);
				}
			}
		}
		//else ShowPlayerMenu(playerid, DIALOG_OBJECTSMENU);
	}
	if(dialogid == DIALOG_CREATEPICKUP)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					ShowPlayerDialog(playerid,DIALOG_CREATEPICKUP_BYNUM,DIALOG_STYLE_INPUT,
					"Create pickup","Enter pickup id:","Create","Cancel");
				}
				case 1: mCreatePickup(1242, playerid);// armourpickup
				case 2: mCreatePickup(1240, playerid);// hppickup
				case 3: mCreatePickup(370, playerid);// jetpickup
				case 4: mCreatePickup(1274, playerid);// dollar
				case 5: mCreatePickup(1239, playerid);// infoicon
				case 6:
				{
					ShowPlayerDialog(playerid, DIALOG_PICKUPS_ENTER, DIALOG_STYLE_LIST, 
					"House pickup","{363636}Black arrow\n{FFFFFF}White arrow\n\
					{FF0000}Red arrow\n{FFFF00}Yellow arrow\n{008000}Green arrow",
					"Select","Cancel");
				} 
				case 7: mCreatePickup(3096, playerid);// fix vehicle
				case 8: 
				{
					ShowPlayerDialog(playerid, DIALOG_PICKUPS_HOUSE, DIALOG_STYLE_LIST, 
					"House pickup","{008000}Green\n{0000ff}Blue\n\
					{FFFF00}Yellow\n{FF0000}Red\n{ffd800}Orange\n",
					"Select","Cancel");
				}
				case 9: 
				{
					for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++){
						Streamer_Update(i);
					}
					// Note: dynamic objects are restored in 50 ms 
					// (or through the specified value by the Streamer_TickRate function).
					Streamer_DestroyAllVisibleItems(playerid, STREAMER_TYPE_PICKUP);
					SendClientMessageEx(playerid, -1,
					"Все пикапы были обновлены",
					"All dynamic pickups have been updated");
				}
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_CREATEMENU);
	}
	if(dialogid == DIALOG_CREATEPICKUP_BYNUM)
	{
		if(response)
		{
			if(!isnull(inputtext) && isNumeric(inputtext)){
				mCreatePickup(strval(inputtext), playerid);
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_CREATEPICKUP);
	}
	if(dialogid == DIALOG_PICKUPS_HOUSE)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: mCreatePickup(1273, playerid);
				case 1: mCreatePickup(1272, playerid);
				case 2: mCreatePickup(19524, playerid);
				case 3: mCreatePickup(19522, playerid);
				case 4: mCreatePickup(19523, playerid);
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_CREATEPICKUP);
	}
	if(dialogid == DIALOG_PICKUPS_ENTER)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: mCreatePickup(19130, playerid);// black arrow
				case 1: mCreatePickup(1318, playerid);// white arrow
				case 2: mCreatePickup(19133, playerid);// red arrow
				case 3: mCreatePickup(19198, playerid);// yellow arrow
				case 4: mCreatePickup(19134, playerid);// green arrow
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_CREATEPICKUP);
	}
	if(dialogid == DIALOG_FAVORITES)
	{
		if(response)
		{	
			CreateDynamicObjectByModelid(playerid, array_FavObjects[listitem]);
		}
		else ShowPlayerMenu(playerid, DIALOG_OBJECTSCAT);
	}

	#if defined TEXTURE_STUDIO
	if(dialogid == DIALOG_OBJECTSCAT)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					// Favorite objects
					new tbtext[250];
					new tmpstr[10];
					for(new i = 0; i < 25; i++)
					{
						format(tmpstr, sizeof(tmpstr), "%i\n", array_FavObjects[i]);
						strcat(tbtext, tmpstr);
					}
					ShowPlayerDialog(playerid,DIALOG_FAVORITES,DIALOG_STYLE_LIST,
					"Favorites",tbtext,"Create","Close");
				}
				case 1:
				{
					if (GetPVarInt(playerid, "lang") == 0) {
						ShowPlayerDialog(playerid, DIALOG_LST_SAMPOBJ, DIALOG_STYLE_LIST,
						"SA-MP","Трубы\nСферы\nКлетки\nРампы\nДжампы\nДороги",
						"OK","Close");
					} else {
						ShowPlayerDialog(playerid, DIALOG_LST_SAMPOBJ, DIALOG_STYLE_LIST,
						"SA-MP","Tubes\nSpheres\nCages\nRamps\nJumps\nRoads",
						"OK","Close");
					}
				}
				case 2:
				{	
					if (GetPVarInt(playerid, "lang") == 0) {
						ShowPlayerDialog(playerid, DIALOG_LST_LIGHTING, DIALOG_STYLE_LIST,
						"Освещение","Точка освещения\nПрожектор\nНеон\nСтолб со светом\nВсе\n",
						"OK","Close");
					} else {
						ShowPlayerDialog(playerid, DIALOG_LST_LIGHTING, DIALOG_STYLE_LIST,
						"Lighting", "PointLight\nPinSpotLight\nNeon\nBollardLight\nAll\n",
						"OK","Close");
					}			
				}
				case 3:
				{					
					if (GetPVarInt(playerid, "lang") == 0) {
						ShowPlayerDialog(playerid, DIALOG_LST_NATURE, DIALOG_STYLE_LIST,
						"Природа", "Деревья\nТрава\nДеревья\nКамни\n",
						"OK","Close");
					} else {
						ShowPlayerDialog(playerid, DIALOG_LST_NATURE, DIALOG_STYLE_LIST,
						"Nature", "Trees\nGrass\nPlants\nStones",
						"OK","Close");
					}
				}
				case 4:
				{		
					if (GetPVarInt(playerid, "lang") == 0) {			
						ShowPlayerDialog(playerid, DIALOG_LST_WALLS, DIALOG_STYLE_LIST,
						"Стены", "Бетонные блоки\nСтолбы\nCтены\n",
						"OK","Close");
					} else {
						ShowPlayerDialog(playerid, DIALOG_LST_WALLS, DIALOG_STYLE_LIST,
						"Walls", "Concrete blocks\nPillars\nWalls\n",
						"OK","Close");
					}
				}
				case 5:
				{		
					if (GetPVarInt(playerid, "lang") == 0) {			
						ShowPlayerDialog(playerid, DIALOG_LST_HOUSECOMP, DIALOG_STYLE_LIST,
						"Компоненты дома", "Двери\nСтекла\nСтупеньки\n",
						"OK","Close");
					} else {
						ShowPlayerDialog(playerid, DIALOG_LST_HOUSECOMP, DIALOG_STYLE_LIST,
						"House components", "Doors\nGlass\nStairs\n",
						"OK","Close");
					}
				}
				case 6:
				{
					if (GetPVarInt(playerid, "lang") == 0) {
						ShowPlayerDialog(playerid, DIALOG_LST_INTERIORS, DIALOG_STYLE_LIST,
						"Интерьер", "Кровати\nСтолы\nСтулья\nКухни\nКартины\nЛампы",
						"OK","Close");
					} else {
						ShowPlayerDialog(playerid, DIALOG_LST_INTERIORS, DIALOG_STYLE_LIST,
						"Interior", "Beds\nTables\nChairs\nKitchens\nFrames\nLamps",
						"OK","Close");
					}
				}
				case 7:
				{
					if (GetPVarInt(playerid, "lang") == 0) {
						ShowPlayerDialog(playerid, DIALOG_LST_STREETS, DIALOG_STYLE_LIST,
						"Уличные объекты", "[>] Вывески\nУличное освещение\nСкамейки",
						"OK","Close");
					} else {
						ShowPlayerDialog(playerid, DIALOG_LST_STREETS, DIALOG_STYLE_LIST,
						"Street", "[>] Boards\nStreet light\nBenchs",
						"OK","Close");
					}

				}
				case 8:
				{
					if (GetPVarInt(playerid, "lang") == 0) {
						ShowPlayerDialog(playerid, DIALOG_LST_LANDSCAPE, DIALOG_STYLE_LIST,
						"Ландшафт", 
						"Острова и поверхности\n\
						Земляные участки\n\
						Каменные участки",
						"OK","Close");
					} else {
						ShowPlayerDialog(playerid, DIALOG_LST_LANDSCAPE, DIALOG_STYLE_LIST,
						"Landscape", 
						"Islands and surfaces\n\
						Ground plots\n\
						Stone plots",
						"OK","Close");
					}
				}
				case 9:
				{
					if (GetPVarInt(playerid, "lang") == 0) {
						ShowPlayerDialog(playerid, DIALOG_LST_ROADS, DIALOG_STYLE_LIST,
						"Дороги", "MTA\nДороги\nМосты",
						"OK","Close");
					} else {
						ShowPlayerDialog(playerid, DIALOG_LST_ROADS, DIALOG_STYLE_LIST,
						"Roads", "MTA\nRoads\nBridges",
						"OK","Close");
					}
				}
				case 10:
				{
					if (GetPVarInt(playerid, "lang") == 0) {
						ShowPlayerDialog(playerid, DIALOG_LST_TRASH, DIALOG_STYLE_LIST,
						"Мусор", "Коробки\nМусор\n",
						"OK","Close");
					} else {
						ShowPlayerDialog(playerid, DIALOG_LST_TRASH, DIALOG_STYLE_LIST,
						"Trash", "Boxes\nRubbish\n",
						"OK","Close");
					}
				}
				case 11:
				{
					if (GetPVarInt(playerid, "lang") == 0)
					{
						ShowPlayerDialog(playerid, DIALOG_OBJSEARCH, DIALOG_STYLE_INPUT,
						"Object search", 
						"Поиск объектов по слову. Введите слово для поиска:\n",
						"Search", "Cancel");
					} else {
						ShowPlayerDialog(playerid, DIALOG_OBJSEARCH, DIALOG_STYLE_INPUT,
						"Object search", 
						"Search for objects by word. Enter a search word:\n",
						"Search", "Cancel");
					}
				}
			}
		}
	}
	if(dialogid == DIALOG_LST_SAMPOBJ)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch tube");
				case 1:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch sphere");
				case 2:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch cage");
				case 3:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch ramp");
				case 4:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch jump");
				case 5:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch MRoad");
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_OBJECTSCAT);
	}
	if(dialogid == DIALOG_LST_LIGHTING)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch PointLight");
				case 1:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch PinSpotLight");
				case 2:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch Neon");
				case 3:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch BollardLight");
				case 4:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch light");
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_OBJECTSCAT);
	}
	if(dialogid == DIALOG_LST_NATURE)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch tree");
				case 1:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch grass");
				case 2:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch plant");
				case 3:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch rock");
			}
		} 
		else ShowPlayerMenu(playerid, DIALOG_OBJECTSCAT);
	}
	if(dialogid == DIALOG_LST_WALLS)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch Concrete");
				case 1:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch pillar");
				case 2:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch wall");
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_OBJECTSCAT);
	}
	if(dialogid == DIALOG_LST_TRASH)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch box");
				case 1:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch rubbish");
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_OBJECTSCAT);
	}
	if(dialogid == DIALOG_LST_STREETS)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: 
				{
					if (GetPVarInt(playerid, "lang") == 0) {
						ShowPlayerDialog(playerid, DIALOG_LST_BANNERS, DIALOG_STYLE_LIST,
						"Уличные объекты", "Вывески\nЗнаки\nБилборды\nБаннеры",
						"OK","Close");
					} else {
						ShowPlayerDialog(playerid, DIALOG_LST_BANNERS, DIALOG_STYLE_LIST,
						"Street", "Boards\nSigns\nBillboards\nBanners",
						"OK","Close");
					}
				}
				case 1:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch lamp");
				case 2:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch bench");
			}
		} 
		else ShowPlayerMenu(playerid, DIALOG_OBJECTSCAT);
	}
	if(dialogid == DIALOG_LST_BANNERS)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch boards");
				case 1:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch sign");
				case 2:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch bill");
				case 3: CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch banner");
			}
		} 
		else ShowPlayerMenu(playerid, DIALOG_OBJECTSCAT);
	}
	if(dialogid == DIALOG_LST_LANDSCAPE)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch island");
				case 1:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch grnd");
				case 2:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch stone");
			}
		} 
		else ShowPlayerMenu(playerid, DIALOG_OBJECTSCAT);
	}
	if(dialogid == DIALOG_LST_ROADS)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					ShowPlayerDialog(playerid, DIALOG_MTAFAVORITES, DIALOG_STYLE_LIST,
					"Roads", "18450\n3458\n",
					"OK","Close");
				}
				case 1:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch road");
				case 2:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch bridge");
			}
		} 
		else ShowPlayerMenu(playerid, DIALOG_OBJECTSCAT);
	}
	if(dialogid == DIALOG_LST_INTERIORS)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch bed");
				case 1:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch table");
				case 2:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch chair");
				case 3:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch kitch");
				case 4:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch frame");
				case 5:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch MLIGHT");
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_OBJECTSCAT);
	}
	if(dialogid == DIALOG_LST_HOUSECOMP)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch door");
				case 1:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch glass");
				case 2:	CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/osearch stairs");
			}
		} 
		else ShowPlayerMenu(playerid, DIALOG_OBJECTSCAT);
	}
	if(dialogid == DIALOG_MTAFAVORITES)
	{
		if(response)
		{
			//TODO Add preview TD later
		}
	}
	#endif

	if(dialogid == DIALOG_CREATEOBJ)
	{
		if(response)
		{
			new modelid = strval(inputtext);
			if(!IsValidObjectModel(modelid)) {
				SendClientMessageEx(playerid,COLOR_GREY,
				"вы указали несуществующий ID модели!","Wrong objectid!");
				return ShowPlayerMenu(playerid, DIALOG_CREATEOBJ);
			}
			new param[24];
			format(param, sizeof(param), "/cobject %d", modelid);
			#if defined TEXTURE_STUDIO
			CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);		
			#endif
		}
	}
	if(dialogid == DIALOG_CREATE3DTEXT)
	{
		if(response)
		{
			if(!isnull(inputtext))
			{
				if(strlen(inputtext) > 64) {
					return SendClientMessageEx(playerid, COLOR_GREY, 
					"Неверное значение (Max: 64 symbols)", "Incorrect value (Max: 64 symbols)");
				}
				new index =	CurrentIndex3dText;
				strcat(Text3dArray[index][Text3Dvalue], inputtext);
				Text3dArray[index][Text3Ddistance] = TEXT3D_DEFAULT_DISTANCE;
				Text3dArray[index][Text3Dcolor] = TEXT3D_DEFAULT_COLOR;
				GetPlayerPos(playerid,Text3dArray[index][tPosX],
				Text3dArray[index][tPosY],Text3dArray[index][tPosZ]);
				#if defined _streamer_included
				Text3dArray[index][index3d] = CreateDynamic3DTextLabel(Text3dArray[index][Text3Dvalue],
				Text3dArray[index][Text3Dcolor], Text3dArray[index][tPosX], Text3dArray[index][tPosY],
				Text3dArray[index][tPosZ], Text3dArray[index][Text3Ddistance], INVALID_PLAYER_ID,
				INVALID_VEHICLE_ID, 0, -1, -1, -1, Text3dArray[index][Text3Ddistance]);
				#else
				Text3dArray[index][index3d] = Create3DTextLabel(Text3dArray[index][Text3Dvalue],
				Text3dArray[index][Text3Dcolor],Text3dArray[index][tPosX],Text3dArray[index][tPosY],
				Text3dArray[index][tPosZ],Text3dArray[index][Text3Ddistance],0);
				#endif
			}
		}
	}
	if(dialogid == DIALOG_COLOR3DTEXT)
	{
		if(response)
		{
			if(!isnull(inputtext) || strlen(inputtext) > 10)
			{
				new index = CurrentIndex3dText;
				if(index <= MAX_3DTEXT_GLOBAL) {
					Text3dArray[index][Text3Dcolor] = EOS;
					strcat(Text3dArray[index][Text3Dcolor], inputtext);
				}	
			} else {
				SendClientMessageEx(playerid, COLOR_GREY, 
				"Неверное значение", "Incorrect value");
			}
		} 
		else ShowPlayerMenu(playerid, DIALOG_3DTEXTMENU);
	}
	if(dialogid == DIALOG_INDEX3DTEXT)
	{
		if(response)
		{
			if(!isnull(inputtext) || !isNumeric(inputtext))
			{
				new index = strval(inputtext);
				if(index <= MAX_3DTEXT_GLOBAL) {
					CurrentIndex3dText = index;
				}	
			} else {
				SendClientMessageEx(playerid, COLOR_GREY, 
				"Неверное значение", "Incorrect value");
			}
		} 
		else ShowPlayerMenu(playerid, DIALOG_3DTEXTMENU);
	}
	if(dialogid == DIALOG_DISTANCE3DTEXT)
	{
		if(response)
		{
			if(!isnull(inputtext))
			{
				new index = CurrentIndex3dText;
				Text3dArray[index][Text3Ddistance] = strval(inputtext);
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_3DTEXTMENU);
	}
	if(dialogid == DIALOG_UPDATE3DTEXT)
	{
		if(response)
		{
			if(!isnull(inputtext))
			{
				new index = CurrentIndex3dText;
				UpdateDynamic3DTextLabelText(Text3dArray[index][index3d],
				Text3dArray[index][Text3Dcolor], inputtext);
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_3DTEXTMENU);
	}
	if(dialogid == DIALOG_SCOORDS)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: GetPlayerCoords(playerid);
				case 1: SaveCoords(playerid);
				case 2: SaveCoords(playerid,1);
				case 3: SaveCoords(playerid,2);
				case 4: SaveCoords(playerid,3);
				case 5: SaveCoords(playerid,4);
			}
		}
	}
	if(dialogid == DIALOG_CREATEMAPICON)
	{
		if(response)
		{
			if(!strval(inputtext)) return 0;
			new nwMapicon[126];
			new Float:X, Float:Y, Float:Z;
			GetPlayerPos(playerid, X, Y, Z);
			// CreateDynamicMapIcon(Float:x, Float:y, Float:z, type, color, worldid = -1,
			// interiorid = -1, playerid = -1, Float:distance = 100.0);
			#if defined _new_streamer_included 
			//if(IsValidDynamicPickup(pickupid))
			CreateDynamicMapIcon(X, Y, Z, strval(inputtext), 0, -1, -1, -1, 250, MAPICON_LOCAL,-1,0);
			// iconid == the player's icon ID, ranging from 0 to 99, to be used in RemovePlayerMapIcon.
			//SetPlayerMapIcon(playerid, iconid, Float:x, Float:y, Float:z, markertype, color);
			//and with:
			//RemovePlayerMapIcon( playerid, iconid);
			#else
			SetPlayerMapIcon(playerid, strval(inputtext), X, Y, Z, MAPICON_LOCAL, -1);
			#endif
			
			//SetPlayerMapIcon(playerid, 46, X, Y, Z, strval(inputtext), 0 );
			new File:pos2 = fopen("mtools/MapIcons.txt", io_append);
			format(nwMapicon, sizeof nwMapicon, 
			"CreateDynamicMapIcon(%.2f, %.2f, %.2f, %i, 0, -1, -1, -1, 100.0);\r\n", 
			X, Y, Z, strval(inputtext));
			fwrite(pos2, nwMapicon);
			fclose(pos2);
			SendClientMessage(playerid, -1,
			"Dynamic MapIcon export to {FFD700}scriptfiles > mtools > MapIcons.txt");
		}
	}
	if(dialogid == DIALOG_EDITMENU)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/csel");		
					#else 
					SelectObject(playerid);
					#endif
				}
				case 1: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/editobject");
					#else 
					EditDynamicObject(playerid, EDIT_OBJECT_ID[playerid]);
					#endif
				}
				case 2:
				{
					ShowPlayerMenu(playerid, DIALOG_ROTATION);
				}
				case 3:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/scsel");
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/editobject");
					#else
					new clo_object = GetClosestDynamicObject(playerid);
					format(string, sizeof(string), "~w~the closest ID~g~%i", clo_object);
					SendTexdrawMessage(playerid, 2000, string);
					EditDynamicObject(playerid, clo_object);
					#endif
				}
				case 4:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/clone");
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/editobject");
					#else
					new 
						Float: ox, Float: oy, Float: oz,
						Float: rx, Float: ry, Float: rz,
					;
					GetDynamicObjectPos(EDIT_OBJECT_ID[playerid], ox, oy, oz);
					GetDynamicObjectRot(EDIT_OBJECT_ID[playerid], rx, ry, rz);
					CreateDynamicObject(GetDynamicObjectModel(EDIT_OBJECT_ID[playerid]),
					ox, oy, oz, rx, ry, rz,-1,-1,-1, STREAMER_OBJECT_SD); 
					EditDynamicObject(playerid, objectid);
					#endif
				}
				case 5:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/dobject");		
					#else 
					DestroyDynamicObject(EDIT_OBJECT_ID[playerid]);
					#endif
				}
				/*case 7:
				{
					#if defined TEXTURE_STUDIO
					new param[64];
					format(param, sizeof(param), "/minfo %i",
					GetDynamicObjectModel(EDIT_OBJECT_ID[playerid]));
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);					
					#endif
				}*/
				case 6: ShowPlayerMenu(playerid, DIALOG_TEXTUREMENU);
				case 7: ShowPlayerMenu(playerid, DIALOG_GROUPEDIT);
				case 8: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/undo");
					#endif
					SendClientMessageEx(playerid, -1, 
					"{00FF00}>>>{FFFFFF} Возврат предыдущего действия {00FF00}/redo",
					"{00FF00}>>>{FFFFFF} Reverting the previous action {00FF00}/redo" );
				}
				/*
				case 9: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/redo");
					#endif
				}
				*/
				case 9: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/oprop");
					#endif
				}
			}
		} else {
			if(LAST_DIALOG[playerid] == DIALOG_MAIN) {
				ShowPlayerMenu(playerid, DIALOG_MAIN);
			}
			CancelEdit(playerid);
		}
	}
	if(dialogid == DIALOG_GROUPEDIT)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/gsel");		
					SELECTION_MODE[playerid] = 4;
					#else 
					SelectObject(playerid);
					#endif
				}
				case 1: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/setgroup");
					#endif
				}
				case 2: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/selectgroup");
					#endif
				}
				case 3: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/editgroup");
					#endif
				}
				case 4: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/gclone");
					#endif
				}
				case 5: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/gclear");
					#endif
				}
				case 6: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/gdelete");
					#endif
				}
				case 7: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/obmedit");
					#endif
				}
			}
		}
	}
	if(dialogid == DIALOG_REMMENU)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: 
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/dobject");		
					#else 
					DestroyDynamicObject(EDIT_OBJECT_ID);
					#endif
				}
				case 1:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/dcsel");		
					#endif
				}
				case 2: 
				{
					#if defined TEXTURE_STUDIO
						SendClientMessage(playerid, COLOR_GREY, "not available for demo version");
					#else
					
					if (GetPVarInt(playerid, "lang") == 1) {
						ShowPlayerDialog(playerid, DIALOG_RANGEDEL, DIALOG_STYLE_INPUT, "/rangedel",
						"{FFFFFF}This action {FF0000}delete all{FFFFFF} in the specified radius. Enter radius:\n",
						"Delete"," < ");
					} else {
						ShowPlayerDialog(playerid, DIALOG_RANGEDEL, DIALOG_STYLE_INPUT, "/rangedel",
						"{FF0000}Удалить все{FFFFFF} объекты в радиусе. Ввдеите радиус:\n",
						"Удалить"," < ");
					}
					#endif
				}
				case 3: ShowPlayerDialog(playerid, DIALOG_REMDEFOBJECT, DIALOG_STYLE_INPUT,
				"/remobject", "{FFFFFF}Delete default objects by index.\nEnter index:","Delete","<");
				/*case 3:
				{
					#if defined _streamer_included
					if(EDIT_OBJECT_ID[playerid] != 0)
					{
						#if defined TEXTURE_STUDIO
						new param[64];
						format(param, sizeof(param), "/dobject %i", EDIT_OBJECT_ID[playerid]);
						CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);		
						#endif
					} else {
						SendClientMessageEx(playerid, COLOR_GREY,
						"Не найден последний созданный объект",
						"Last created object not found");
					}
					#endif
				}*/
				case 4:
				{
					if(EDIT_OBJECT_ID[playerid] == -1){
						return SendClientMessageEx(playerid, COLOR_GREY, 
						"Не выбран объект", "No object selected");
					}
					#if defined STREAMER_ALL_TAGS
					Streamer_ToggleItem(playerid, STREAMER_TYPE_OBJECT, EDIT_OBJECT_ID[playerid], 0);
					#else
						#if defined _YSF_included
						HideObjectForPlayer(playerid, EDIT_OBJECT_ID[playerid]);
						#endif
					#endif
				}
				case 5:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/undo");		
					#else
					SendClientMessage(playerid, -1, "Function unavaiable. Need TextureStudio");
					#endif
				}
				case 6:
			 	{ 
					ShowPlayerDialog(playerid, DIALOG_CLEARTEMPFILES, DIALOG_STYLE_MSGBOX, "",
					"{FFFFFF}This action {FF0000}delete all{FFFFFF} temporary files. You are sure?\n",
					"Ок","<");
				}
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_MAIN);
	}
	if(dialogid == DIALOG_RANGEDEL)
	{
		if(response)
		{
			if(!isnull(inputtext) && isNumeric(inputtext))
			{
				DeleteObjectsInRange(playerid, strval(inputtext));
			}
		}
	}
	if(dialogid == DIALOG_REMDEFOBJECT)
	{
		if(response)
		{
			if(!isnull(inputtext) && isNumeric(inputtext))
			{
				#if defined TEXTURE_STUDIO
				new param[64];
				format(param, sizeof(param), "/remobject %i", strval(inputtext));
				CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);		
				#endif
			}
		}
	}
	if(dialogid == DIALOG_ASKDELETE)
	{
		if(response)
		{
			#if defined TEXTURE_STUDIO
			CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/dobject");
			#else
		    DestroyDynamicObject(objectid);
			#endif
		}
	}
	if(dialogid == DIALOG_ROTSET)
	{
		if(response)
		{
			if(!isnull(inputtext) && isNumeric(inputtext))
			{
				new param[24];
				new Float:RotX,Float:RotY,Float:RotZ;
				GetDynamicObjectRot(EDIT_OBJECT_ID[playerid], RotX, RotY, RotZ);
				switch(GetPVarInt(playerid, "RotAxis"))
				{
					case 1: 
					{
						format(param, sizeof(param),"/rx %d",strval(inputtext));
						RotX+=strval(inputtext);
					}
					case 2:
					{
						format(param, sizeof(param),"/ry %d",strval(inputtext));
						RotY+=strval(inputtext);
					}
					case 3:
					{
						format(param, sizeof(param),"/rz %d",strval(inputtext));
						RotZ+=strval(inputtext);
					}
				}
				#if defined TEXTURE_STUDIO
				CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);		
				#else				
				SetDynamicObjectRot(EDIT_OBJECT_ID[playerid], RotX, RotY, RotZ);
				#endif
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_ROTATION);
	}
	if(dialogid == DIALOG_ROTATION)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: AutoRotateObject(playerid, EDIT_OBJECT_ID[playerid]);
				case 1: 
				{
					SetPVarInt(playerid, "RotAxis",1);
					ShowPlayerMenu(playerid, DIALOG_ROTSET);
				}
				case 2:
				{
					SetPVarInt(playerid, "RotAxis",2);
					ShowPlayerMenu(playerid, DIALOG_ROTSET);
				}
				case 3:
				{
					SetPVarInt(playerid, "RotAxis",3);
					ShowPlayerMenu(playerid, DIALOG_ROTSET);
				}
				case 4:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/pivot");
					#endif
				}
				case 5:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/togpivot");
					#endif
				}
				case 6:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/rotreset");
					#else
					SetDynamicObjectRot(EDIT_OBJECT_ID[playerid], 0,0,0);
					#endif
				}
				case 7:
				{
					SendClientMessageEx(playerid, COLOR_LIME,
					"/editobject - Режим редактирования объекта",
					"/editobject - Edit object mode");
					
					SendClientMessageEx(playerid, COLOR_LIME,
					"/ox - /oy - /oz - Стандартные команды перемещения",
					"/ox - /oy - /oz - Standard movement commands");
					
					SendClientMessageEx(playerid, COLOR_LIME,
					"/rx - ry - /rz - Стандартные команды поворота",
					"/rx - ry - /rz - Standard rotation commands");
					
					SendClientMessageEx(playerid, COLOR_LIME,
					"/dox - /doy - /doz - Дельта перемещение",
					"/dox - /doy - /doz - Delta move map");
					
					SendClientMessageEx(playerid, COLOR_LIME,
					"/drx - /dry - /drz - повернуть карту вокруг центра карты",
					"/drx - /dry - /drz - Rotate map around map center");
				}
			}
		}
		//else ShowPlayerMenu(playerid,DIALOG_EDITMENU);
	}
	if(dialogid == DIALOG_CAMINTERPOLATE)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					new tbtext[300];
					
					format(tbtext, sizeof tbtext,
					"Starting position\t %.2f %.2f %.2f\n"\
					"End position\t %.2f %.2f %.2f\n"\
					"{FF0000}Reset positions\t\n",
					CamData[playerid][Cam_StartX], CamData[playerid][Cam_StartY], CamData[playerid][Cam_StartZ],
					CamData[playerid][Cam_EndX], CamData[playerid][Cam_EndY], CamData[playerid][Cam_EndZ]);
					
					ShowPlayerDialog(playerid, DIALOG_CAMPOINT, DIALOG_STYLE_TABLIST,
					"[CAM] - Point", tbtext, "Select", "Cancel");
				}
				case 1:
				{
					if (GetPVarInt(playerid, "lang") == 0)
					{
						ShowPlayerDialog(playerid, DIALOG_CAMDELAY, DIALOG_STYLE_INPUT,
						"[CAM] - MoveSpeed",
						 "Введите время в миллисекундах до завершения перемещения:", "Select", "Cancel");
					} else {
						ShowPlayerDialog(playerid, DIALOG_CAMDELAY, DIALOG_STYLE_INPUT,
						"[CAM] - MoveSpeed",
						 "Input the time in milliseconds before the move is complete:", "Select", "Cancel");
					}
				}
				case 2:
				{
					if (CamData[playerid][Cam_StartX] == 0) {
						return SendClientMessageEx(playerid, -1,
						"Сперва установите начальную позицию","Set the starting position first");
					}
					if (CamData[playerid][Cam_EndX] == 0) {
						return SendClientMessageEx(playerid, -1,
						"Установите конечную позицию","Set end position");
					}
					if (CamData[playerid][Cam_MoveSpeed] < 1000) {
						CamData[playerid][Cam_MoveSpeed] = 1000;
						CamData[playerid][Cam_RotSpeed] = 1000;
					}
 					SetCameraBehindPlayer(playerid);
					// Point to point cam movement
					InterpolateCameraPos(playerid,
					CamData[playerid][Cam_StartX], CamData[playerid][Cam_StartY], CamData[playerid][Cam_StartZ],
					CamData[playerid][Cam_EndX], CamData[playerid][Cam_EndY], CamData[playerid][Cam_EndZ],
					CamData[playerid][Cam_MoveSpeed]);
					InterpolateCameraLookAt(playerid, 
					CamData[playerid][Cam_StartLookX],CamData[playerid][Cam_StartLookY],CamData[playerid][Cam_StartLookZ],
					CamData[playerid][Cam_EndLookX],CamData[playerid][Cam_EndLookY],CamData[playerid][Cam_EndLookZ],
					CamData[playerid][Cam_RotSpeed]);
				}
				case 3:
				{
					if (GetPVarInt(playerid, "lang") == 0){
						ShowPlayerDialog(playerid, DIALOG_CAMDESCRIPTION, DIALOG_STYLE_INPUT,
						"[CAM] - Description", "Введите описание для этой камеры", "Save", "Cancel");
					} else {
						ShowPlayerDialog(playerid, DIALOG_CAMDESCRIPTION, DIALOG_STYLE_INPUT,
						"[CAM] - Description", "Enter description to current cam", "Save", "Cancel");
					}
				}
				case 4:
				{
					
					if (CamData[playerid][Cam_StartX] == 0.0) {
						return SendClientMessageEx(playerid, -1,
						"Сперва установите начальную позицию","Set the starting position first");
					}
					if (CamData[playerid][Cam_EndX] == 0.0) {
						return SendClientMessageEx(playerid, -1,
						"Установите конечную позицию","Set end position");
					}
					new File: file = fopen("mtools/camdata.txt", io_append);
					new tmpbuffer[200];

					format(tmpbuffer, 200,
					"\r\nInterpolateCameraPos(playerid, %f, %f, %f, %f, %f, %f, %i, CAMERA_MOVE);", 
					CamData[playerid][Cam_StartX], CamData[playerid][Cam_StartY], CamData[playerid][Cam_StartZ],
					CamData[playerid][Cam_EndX], CamData[playerid][Cam_EndY], CamData[playerid][Cam_EndZ],
					CamData[playerid][Cam_MoveSpeed]);
					fwrite(file, tmpbuffer);
					format(tmpbuffer, 200,
					"\r\nInterpolateCameraLookAt(playerid, %f, %f, %f, %f, %f, %f, %i);",
					CamData[playerid][Cam_StartLookX],CamData[playerid][Cam_StartLookY],CamData[playerid][Cam_StartLookZ],
					CamData[playerid][Cam_EndLookX],CamData[playerid][Cam_EndLookY],CamData[playerid][Cam_EndLookZ],
					CamData[playerid][Cam_RotSpeed]);
					fwrite(file, tmpbuffer);
					fclose(file);

					ShowPlayerMenu(playerid, DIALOG_CAMINTERPOLATE);
					return SendClientMessageEx(playerid, -1, "Cохранено в \"camdata.txt\".",
					"Saved to \"camdata.txt\".");
				}
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_CAMSET);
	}
	if(dialogid == DIALOG_CAMPOINT)
	{
		if(response)
		{
			if(GetPlayerState(playerid) != PLAYER_STATE_SPECTATING) {
				#if defined TEXTURE_STUDIO
				CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/flymode");
				#else
				SendClientMessageEx(playerid, COLOR_GREY,
				"Вы должны быть в режиме наблюдения!", "You should be in spectator mode");
				#endif
			}

			switch(listitem)
			{
				case 0:
				{
					GetPlayerCameraPos(playerid, fPX, fPY, fPZ);
					GetPlayerCameraFrontVector(playerid, fVX, fVY, fVZ);
					object_x = fPX + floatmul(fVX, fScale);
					object_y = fPY + floatmul(fVY, fScale);
					object_z = fPZ + floatmul(fVZ, fScale);
					CamData[playerid][Cam_StartX] 		= fPX;
					CamData[playerid][Cam_StartY] 		= fPY;
					CamData[playerid][Cam_StartZ] 		= fPZ;
					CamData[playerid][Cam_StartLookX] 	= object_x;
					CamData[playerid][Cam_StartLookY] 	= object_y;
					CamData[playerid][Cam_StartLookZ] 	= object_z;

					SendClientMessageEx(playerid, -1,
					"Начальная точка установлена","Start point set");
				}
				case 1:
				{
					GetPlayerCameraPos(playerid, fPX, fPY, fPZ);
					GetPlayerCameraFrontVector(playerid, fVX, fVY, fVZ);
	
					object_x = fPX + floatmul(fVX, fScale);
					object_y = fPY + floatmul(fVY, fScale);
					object_z = fPZ + floatmul(fVZ, fScale);
					CamData[playerid][Cam_EndX] 		= fPX;
					CamData[playerid][Cam_EndY] 		= fPY;
					CamData[playerid][Cam_EndZ] 		= fPZ;
					CamData[playerid][Cam_EndLookX] 	= object_x;
					CamData[playerid][Cam_EndLookY] 	= object_y;
					CamData[playerid][Cam_EndLookZ] 	= object_z;

					SendClientMessageEx(playerid, -1,
					 "Конечная точка установлена","End point set");
				}
				case 2:
				{
					CamData[playerid][Cam_StartX] 		= 0.0;
					CamData[playerid][Cam_StartY] 		= 0.0;
					CamData[playerid][Cam_StartZ] 		= 0.0;
					CamData[playerid][Cam_StartLookX] 	= 0.0;
					CamData[playerid][Cam_StartLookY] 	= 0.0;
					CamData[playerid][Cam_StartLookZ] 	= 0.0;
					CamData[playerid][Cam_EndX] 		= 0.0;
					CamData[playerid][Cam_EndY] 		= 0.0;
					CamData[playerid][Cam_EndZ] 		= 0.0;
					CamData[playerid][Cam_EndLookX] 	= 0.0;
					CamData[playerid][Cam_EndLookY] 	= 0.0;
					CamData[playerid][Cam_EndLookZ] 	= 0.0;

					SendClientMessageEx(playerid, -1,
					"Начальная и конечная точки сброшены","Start and End point drop");
				}
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_CAMSET);
	}
	if(dialogid == DIALOG_CAMDESCRIPTION)
	{
		if(response)
		{
			if(!isnull(inputtext))
			{
				new File: file = fopen("mtools/camdata.txt", io_append);
				
				new tmpbuffer[200];
				format(tmpbuffer, 200, "// %s \r\n", inputtext);
				fwrite(file, tmpbuffer);
				fclose(file);

				return SendClientMessageEx(playerid, -1,
				"Cохранено в \"camdata.txt\".",
				"Saved to \"camdata.txt\".");
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_CAMINTERPOLATE);
	}
	if(dialogid == DIALOG_CAMFIX)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					new Float:X, Float:Y, Float:Z, Float:Angle;
					GetPlayerPos(playerid,X,Y,Z);
					GetPlayerFacingAngle(playerid, Angle);
					SetPlayerCameraPos(playerid,X,Y,Z+50);
					SetPlayerCameraLookAt(playerid,X,Y,Z);
					SetPlayerFacingAngle(playerid,Angle-180.0);
					SendClientMessageEx(playerid, -1,
					"Введите /retcam для того чтобы вернуть камеру",
					"Enter /retcam to return the camera");
				}
				case 1: 
				{
					if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
					{
						new Float:x1,Float:y1,Float:z1;
						GetPlayerCameraPos(playerid,x1,y1,z1);
						SetPlayerCameraPos(playerid, x1,y1,z1);
						GetPlayerCameraLookAt(playerid, x1,y1,z1);
						SetPlayerCameraLookAt(playerid, x1,y1,z1);
					} else {
						new Float:X, Float:Y, Float:Z, Float:Angle;
						GetPlayerPos(playerid, X , Y , Z);
						GetPlayerFacingAngle(playerid, Angle);
						SetPlayerCameraPos(playerid, X , Y , Z); 
						SetPlayerCameraLookAt(playerid, X , Y , Z);
						GetPlayerFacingAngle(playerid, Angle);
					}
					SendClientMessageEx(playerid, -1,
					"Введите /retcam для того чтобы вернуть камеру",
					"Enter /retcam to return the camera");
				}
				case 2:
				{
					SetCameraBehindPlayer(playerid);
					if(Vehcam[playerid] == 0)
					{
						if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
						{
							return SendClientMessageEx(playerid, -1,
							"Выйдите из режима наблюдения",
							"Stop spectating mode before using this function");
						}
						if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
						{
							new vehicleid = GetPlayerVehicleID(playerid);
							Vehcam[playerid] = CreateObject(19300, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
							AttachObjectToVehicle(Vehcam[playerid], vehicleid,
							0.0, 0.0, 1.0, 0.0, 0.0, 0.0); // hood view
							AttachCameraToObject(playerid, Vehcam[playerid]);
						} else {
							return SendClientMessageEx(playerid, -1,
							"Вы должны быть в машине", "You must be in the car");
						}
					}
					else
					{
						SetCameraBehindPlayer(playerid);
						DestroyObject(Vehcam[playerid]);
						Vehcam[playerid] = 0;
					}
				}
				case 3:
				{
					SetCameraBehindPlayer(playerid);
					if(Vehcam[playerid] == 0)
					{
						if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
						{
							return SendClientMessageEx(playerid, -1,
							"Выйдите из режима наблюдения",
							"Stop spectating mode before using this function");
						}
						if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
						{
							new vehicleid = GetPlayerVehicleID(playerid);
							Vehcam[playerid] = CreateObject(19300, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
							AttachObjectToVehicle(Vehcam[playerid], vehicleid,
							-2.0, -3.0, 1, 0.0, 0.0, 0.0); // hood view
							AttachCameraToObject(playerid, Vehcam[playerid]);
						} else {
							return SendClientMessageEx(playerid, -1,
							"Вы должны быть в машине", "You must be in the car");
						}
					}
					else
					{
						SetCameraBehindPlayer(playerid);
						DestroyObject(Vehcam[playerid]);
						Vehcam[playerid] = 0;
					}
					/*
					//Attach camera to side vehicle
					if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
					{
						new vehicleid = GetPlayerVehicleID(playerid);
						new Float:x, Float:y, Float:z;
						GetVehiclePos(vehicleid, x,y,z);
						SetPlayerCameraPos(playerid, x,y,z);
						//TogglePlayerSpectating (playerid, 1);
						PlayerSpectateVehicle (playerid, vehicleid, SPECTATE_MODE_SIDE);
					}*/
				}
				case 4:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/ogoto");
					#endif
				}
				case 5:
				{
					//Attach camera to vehicle
					if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
					{
						new vehicleid = GetPlayerVehicleID(playerid);
						TogglePlayerSpectating (playerid, 1);
						PlayerSpectateVehicle (playerid, vehicleid);
					} else {
						if (PlayerVehicle[playerid] != 0)
						{
							TogglePlayerSpectating (playerid, 1);
							PlayerSpectateVehicle (playerid, PlayerVehicle[playerid]);
							//AttachCameraToObject
						} else {
							SendClientMessageEx(playerid, -1,
							"Вы должны быть в транспорте или заспавнить транспорт через /v",
							"You must be in a transport or spawn a transport via /v");
						}
					}
				}
				case 6:
				{
					GetPlayerCameraPos(playerid, fPX, fPY, fPZ);
					GetPlayerCameraFrontVector(playerid, fVX, fVY, fVZ);
					object_x = fPX + floatmul(fVX, fScale);
					object_y = fPY + floatmul(fVY, fScale);
					object_z = fPZ + floatmul(fVZ, fScale);
					format(string, sizeof(string),
					"CameraPos: %f,%f,%f | LookAt: %f,%f,%f",fPX,fPY,fPZ,object_x,object_y,object_z);
					SendClientMessage(playerid, -1, string);
				}
				case 7:
				{
					Vehcam[playerid] = 0; // Fix vehcam
					if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
					{
						#if defined TEXTURE_STUDIO
						CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/flymode");
						#endif
					} else {
						if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)	{
							TogglePlayerSpectating (playerid, 0);
						}
						SetCameraBehindPlayer(playerid);
					}
				}
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_CAMSET);
	}
	if(dialogid == DIALOG_FLYMODESETTINGS)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					if(aimPoint) 
					{
						PlayerTextDrawHide(playerid, TDAIM[playerid]);
						aimPoint = false;
					} else { 
						aimPoint = true;
					}
					new query[128];
					format(query,sizeof(query),
					"UPDATE `Settings` SET Value=%d WHERE Option='aimPoint'",
					aimPoint);
					db_query(mtoolsDB,query);
					ShowPlayerMenu(playerid, DIALOG_INTERFACE_SETTINGS);
				}
				case 1:
				{
					if(targetInfo) 
					{
						targetInfo = false;
					} else { 
						targetInfo = true;
					}
					new query[128];
					format(query,sizeof(query),
					"UPDATE `Settings` SET Value=%d WHERE Option='targetInfo'",
					targetInfo);
					db_query(mtoolsDB,query);
					ShowPlayerMenu(playerid, DIALOG_INTERFACE_SETTINGS);
				}
				case 2:
				{
					ShowPlayerDialog(playerid, DIALOG_FMSPEED, DIALOG_STYLE_INPUT,
					"/fmspeed","{FFFFFF}Enter flight speed in flymode [5-500]", "OK","Cancel");
				}
				case 3:
				{
					ShowPlayerDialog(playerid, DIALOG_FMACCEL, DIALOG_STYLE_INPUT,
					"/fmaccel","{FFFFFF}Enter acceleration in flymode [0.005-0.5]", "OK","Cancel");
				}
				case 4:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/fmtoggle");
					#endif
				}
			}
		} else {
			if(LAST_DIALOG[playerid] == DIALOG_CAMSET) {
				ShowPlayerMenu(playerid, DIALOG_CAMSET);
			} else if(LAST_DIALOG[playerid] == DIALOG_SETTINGS) {
				ShowPlayerMenu(playerid, DIALOG_SETTINGS);
			}
		}
	}
	if(dialogid == DIALOG_FMACCEL)
	{
		if (!isnull(inputtext))
		{
			new param[64];
			format(param, sizeof(param), "/fmaccel %s", inputtext);
			#if defined TEXTURE_STUDIO
			CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);		
			#endif
		}
	}
	if(dialogid == DIALOG_FMSPEED)
	{
		if (!isnull(inputtext))
		{
			//if(strval(inputtext) <= 5 && strval(inputtext) >= 500)
			new param[64];
			format(param, sizeof(param), "/fmspeed %s", inputtext);
			#if defined TEXTURE_STUDIO
			CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);		
			#endif
		}
	}
	if(dialogid == DIALOG_CAMSET)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/flymode");
					#endif
				}
				case 1: FirstPersonMode(playerid);
				case 2: GivePlayerWeapon(playerid, 43, 100);
				case 3: 
				{
					MtoolsHudToggle(playerid);
					SelectTextDraw(playerid, 0xFFFFFF);
				}
				case 4:
				{
					if(GetPVarInt(playerid, "DashCam") > 0)
					{
						SetPVarInt(playerid, "DashCam", 0);
						SendClientMessageEx(playerid, -1,
						"Полицейская камера - [отключена]", "Dash cam - [disabled]");
						PlayerTextDrawHide(playerid, DashCam[playerid]);
						PlayerTextDrawHide(playerid, DashCam2[playerid]);
					} else {
						SetPVarInt(playerid, "DashCam", 1);
						SendClientMessageEx(playerid, -1,
						"Полицейская камера - [включена]", "Dash cam - [enabled]");
						SendClientMessageEx(playerid, -1,
						"Информация с камеры отбражается только в машине",
						"Infotmation from the camera is displayed only in the car");
						PlayerTextDrawShow(playerid, DashCam[playerid]);
						PlayerTextDrawShow(playerid, DashCam2[playerid]);
					}
				}
				case 5:
				{
					new tbtext[450];
					
					if(GetPVarInt(playerid, "lang") == 1)
					{		
						format(tbtext, sizeof(tbtext),
						"View from above (2D Like)\n"\
						"Hold camera position\n"\
						"Сamera on the hood of the car\n"\
						"Сamera on the side of the vehicle\n"\
						"Camera to the current object\n"\
						"Camera to the current vehicle\n"\
						"Get the current position and direction of the camera\n"\
						"{00FF00}Restore camera\n");
					} else {
						format(tbtext, sizeof(tbtext),
						"Вид сверху (2D стиль)\n"\
						"Закрепить камеру\n"\
						"Закрепить камеру на капоте машины\n"\
						"Закрепить камеру сбоку на транспорт\n"\
						"Камеру к текущему объекту\n"\
						"Камеру к текущему транспорту\n"\
						"Вывести текущую позицию и направление камеры\n"\
						"{00FF00}Вернуть камеру\n");
					}
					
					ShowPlayerDialog(playerid, DIALOG_CAMFIX, DIALOG_STYLE_LIST,
					"[CAM] camfix",tbtext, "OK","Cancel");
				}
				case 6: ShowPlayerMenu(playerid, DIALOG_FLYMODESETTINGS);
				case 7: ShowPlayerMenu(playerid, DIALOG_CAMINTERPOLATE);
				//case 8: ShowPlayerMenu(playerid, DIALOG_ENVIRONMENT);
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_MAIN);
	}
	if (dialogid == DIALOG_AUTOTIME)
	{
		if(response)
		{
			if(isnull(inputtext) || !isNumeric(inputtext))
			{
				return SendClientMessageEx(playerid, COLOR_GREY,
				"Неверное значение", "Incorrect value");
			}
			if(strval(inputtext) > 7200 || strval(inputtext) < 1)
			{
				return SendClientMessageEx(playerid, COLOR_GREY,
				"Неверное значение! минимальное 1, максимальное 7200",
				"Incorrect value! min 1 , max 7200");
			}
			new tmpstr[128];
			format(tmpstr, sizeof(tmpstr), "In-game time change every %d seconds", strval(inputtext));
			SendClientMessage(playerid, COLOR_LIME, tmpstr);
			
			SendClientMessageEx(playerid, -1,
			"Чтобы остановить автосмену, введите /autotime",
			"To stop auto change, enter /autotime");

			AutoTimeTimer = SetTimerEx("AutoTimeChange", strval(inputtext)*1000, true, "i", playerid);
			SetPVarInt(playerid, "AutoTime", 1);
		}		
	}
	if (dialogid == DIALOG_MOVINGOBJ)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					#if defined TEXTURE_STUDIO
					CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/csel");		
					#else 
					SelectObject(playerid);
					#endif
				}
				case 1:
				{
					new Float: x, Float: y, Float: z;
					if(EDIT_OBJECT_ID[playerid] != 0){
						GetDynamicObjectPos(EDIT_OBJECT_ID[playerid], x, y, z);
					} else {
						GetPlayerPos(playerid, x,y,z);
						SendClientMessageEx(playerid, -1,
						"Объект не был выбран, в качестве координат взяты координаты игрока",
						"The object was not selected, set player coordinates as object coords");
					}
					ObjectsMoveData[playerid][X1] = x;
					ObjectsMoveData[playerid][Y1] = y;
					ObjectsMoveData[playerid][Z1] = z;
					SendClientMessageEx(playerid, -1, "Стартовая точка установлена","Start point set");
				}
				case 2:
				{
					new Float: x, Float: y, Float: z;
					if(EDIT_OBJECT_ID[playerid] != 0){
						GetDynamicObjectPos(EDIT_OBJECT_ID[playerid], x, y, z);
					} else {
						GetPlayerPos(playerid, x,y,z);
						SendClientMessageEx(playerid, -1,
						"Объект не был выбран, в качестве координат взяты координаты игрока",
						"The object was not selected, set player coordinates as object coords");
					}
					ObjectsMoveData[playerid][X2] = x;
					ObjectsMoveData[playerid][Y2] = y;
					ObjectsMoveData[playerid][Z2] = z;
					SendClientMessageEx(playerid, -1, "Финальная точка установлена","End point set");
				}
				case 3:
				{
					ShowPlayerDialog(playerid, DIALOG_DYNOBJSPEED, DIALOG_STYLE_INPUT,
					"Move speed",
					"{FFFFFF}Enter movement speed in ms:",
					"OK", "Cancel");
				}
				case 4:
				{
					if(EDIT_OBJECT_ID[playerid] != 0){
						ObjectsMoveData[playerid][movobject] = EDIT_OBJECT_ID[playerid];
					} else {
						return SendClientMessageEx(playerid, -1,
						"Объект не был выбран!","The object was not selected!");
					}
					if(ObjectsMoveData[playerid][MoveSpeed] <= 0){
						ObjectsMoveData[playerid][MoveSpeed] = 20000;
					}
					if(ObjectsMoveData[playerid][X1] == 0){
						return SendClientMessageEx(playerid, -1,
						"Начальная позиция не установлена","Set start point!");
					}
					/*if(ObjectsMoveData[playerid][X2] == 0){
						return SendClientMessageEx(playerid, -1,
						"Финальная позиция не установлена","Set end point!");
					}*/
					new Float: rx, Float: ry, Float: rz;
					GetDynamicObjectRot(ObjectsMoveData[playerid][movobject], rx, ry, rz);
					MoveDynamicObject(ObjectsMoveData[playerid][movobject],
					ObjectsMoveData[playerid][X2],
					ObjectsMoveData[playerid][Y2],
					ObjectsMoveData[playerid][Z2],
					ObjectsMoveData[playerid][MoveSpeed],
					rx, ry, rz);
					// back to start pos
					/*MoveDynamicObject(ObjectsMoveData[playerid][movobject],
					ObjectsMoveData[playerid][X1],
					ObjectsMoveData[playerid][Y1],
					ObjectsMoveData[playerid][Z1],
					ObjectsMoveData[playerid][MoveSpeed],
					rx, ry, rz);*/
				}
				case 5:
				{
					StopDynamicObject(EDIT_OBJECT_ID[playerid]);
				}
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_OBJECTSMENU);
	}
	if (dialogid == DIALOG_ENVIRONMENT)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					GivePlayerWeapon(playerid, 44, 1);
					SendClientMessageEx(playerid, COLOR_LIME,
					"Режим ночного видения",
					"Night vision mode");
				}
				case 1:
				{
					GivePlayerWeapon(playerid, 45, 1);
					SendClientMessageEx(playerid, COLOR_LIME,
					"Режим тепловизора",
					"Thermal vision mode");
				}
				case 2:
				{
					SetGravity(0.005);
					SetPlayerWeather(playerid, 20);
					SetPlayerTime(playerid, 0, 0);
					SetPlayerSkin(playerid, 294);
					superJump = true;
					GameTextForPlayer(playerid, "~g~Enter the Matrix", 1000, 5);
					SendClientMessageEx(playerid, COLOR_LIME,
					"В этом режиме изменена гравитация и включен супер прыжок",
					"In this mode, the gravity is changed and the super jump is enabled");
				}
				case 3:
				{
					SetGravity(0.013);
					SendClientMessageEx(playerid, COLOR_LIME,
					"В этом режиме изменена физика на более реалистичную",
					"In this mode, physics has been changed to more realistic");
				}
				case 4:
				{
					SendClientMessageEx(playerid, COLOR_LIME,
					"В этом режиме полностью отключена гравитация",
					"In this mode, gravity is disabled.");
					SetGravity(0.000);
					SetPlayerWeather(playerid, 21);
					SetPlayerTime(playerid, 5, 0);
				}
				case 5:
				{
					SendClientMessageEx(playerid, COLOR_LIME,
					"Включен режим слоумо",
					"Slow motion mode enabled");
					SetGravity(0.001); 
				}
				case 6:
				{
					if(GetPVarInt(playerid, "AutoTime") > 0)
					{
						KillTimer(AutoTimeTimer);
						SetPVarInt(playerid, "AutoTime", 0);
						SendClientMessageEx(playerid, -1,
						"Функция автоматической смены времени остановлена",
						"Automatic time change function stopped");
					} else {
						ShowPlayerMenu(playerid, DIALOG_AUTOTIME);
					}
				}
				case 7:
				{
					ShowPlayerDialog(playerid, DIALOG_ENVPRESETS, DIALOG_STYLE_TABLIST,
					"[CAM] - Environment presets", 
					"Welcome2Hell\tRed hell desert\n\
					Monochrome\tAbsolutely dark skin\n\
					Very dark night\t\n\
					Desert Storm\t\n\
					LA sunny\tOrange lighting\n\
					Silent hill\tExtra Foggy\n\
					90's retrowave\tPurple night\n",
					"Select", "Cancel");
				}
				case 8:
				{
					SetGravity(0.008);
					SetPlayerWeather(playerid,2);
					SetPlayerTime(playerid, 12, 0);
					superJump = false;
					SendClientMessageEx(playerid, COLOR_LIME,
					"Физика и окружение восстановлены на стандартные",
					"Physics and environment restored to standard");
				}
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_CAMSET);
	}
	if (dialogid == DIALOG_ENVPRESETS)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					new Float:x, Float:y, Float:z;
					GetPlayerPos(playerid, x, y, z);
					SetPlayerInterior(playerid, 0);
					SetPlayerWeather(playerid,42);
					SetPlayerTime(playerid, 23, 0);
					SetPlayerSkin(playerid, 162);
					//new explode_object = CreateDynamicObject(18682,
					//x, y, z, 0.0,0.0,0.0, -1,-1,-1, 300); 
					//DestroyDynamicObject(explode_object);	
					CreateExplosion(x, y, z, 12, 7);
					SendClientMessageEx(playerid, COLOR_RED,
					"В аду нет света, воды, и прощения. Welcome to hell!",
					"No light, no water. no mercy. Welcome to hell!");
				}
				case 1:
				{
					SetPlayerTime(playerid, 2, 0);
					SetPlayerWeather(playerid,22);
				}
				case 2:
				{
					SetPlayerTime(playerid, 22, 0);
					SetPlayerWeather(playerid,22);
				}
				case 3:
				{
					SetPlayerTime(playerid, 12, 0);
					SetPlayerWeather(playerid,19);
					SetPlayerSkin(playerid, 287);
				}
				case 4:
				{
					SetPlayerTime(playerid, 21, 0);
					SetPlayerWeather(playerid,3);
				}
				case 5:
				{
					SetPlayerTime(playerid, 18, 0);
					SetPlayerWeather(playerid,9);
				}
				case 6:
				{
					SetPlayerTime(playerid, 3, 0);
					SetPlayerWeather(playerid,10);
				}
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_ENVIRONMENT);
	}
	if (dialogid == DIALOG_CAMDELAY)
	{
		if(response)
		{
			if (isnull(inputtext) || !isNumeric(inputtext))
			{
				return SendClientMessageEx(playerid, COLOR_GREY,
				"Неверное значение", "Incorrect value");
			}
			if (strval(inputtext) < 1000)
			{
				SendClientMessageEx(playerid, COLOR_GREY, 
				"Введите значение не меньше 1000мс (1сек)",
				"Enter a value not less than 1000ms (1sec)");
			} else {
				CamData[playerid][Cam_MoveSpeed] = strval(inputtext);
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_CAMINTERPOLATE);
	}
	if (dialogid == DIALOG_OBJSEARCH)
	{
		if(response)
		{
			if (!isnull(inputtext))
			{
				new param[64];
				format(param, sizeof(param), "/osearch %s", inputtext);
				#if defined TEXTURE_STUDIO
				CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);		
				#endif
			} else {
				SendClientMessageEx(playerid, COLOR_GREY,
				"Неверное значение", "Incorrect value");
			}
		}
	}
	if (dialogid == DIALOG_MODELSIZEINFO)
	{
		if(response)
		{
			if (!isnull(inputtext))
			{
				new param[64];
				format(param, sizeof(param), "/minfo %s", inputtext);
				#if defined TEXTURE_STUDIO
				CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);		
				#endif
			} else {
				SendClientMessageEx(playerid, COLOR_GREY,
				"Неверное значение", "Incorrect value");
			}
		}
	}
	if (dialogid == DIALOG_TEXTURESEARCH)
	{
		if(response)
		{
			if (!isnull(inputtext))
			{
				new param[64];
				format(param, sizeof(param), "/tsearch %s", inputtext);
				#if defined TEXTURE_STUDIO
				CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);		
				#endif
			} else {
				SendClientMessageEx(playerid, COLOR_GREY,
				"Неверное значение", "Incorrect value");
			}
		}
	}
	if (dialogid == DIALOG_OBJDISTANCE)
	{
		if(response)
		{
			if (!isnull(inputtext))
			{
				new objectid = strval(inputtext);
				if(IsValidDynamicObject(objectid))
				{
					SetPVarInt(playerid, "d_objectid",objectid);
					ShowPlayerDialog(playerid, DIALOG_OBJDISTANCE2, DIALOG_STYLE_INPUT,
					"Distance [object #2]",
					"{FFFFFF}Enter 2 objectid:",
					"OK", "Cancel");
				} else {
					SendClientMessageEx(playerid, COLOR_GREY,
					"Не найден объект с таким id", "No object with this id found");
				}
			} else {
				SendClientMessageEx(playerid, COLOR_GREY,
				"Неверное значение", "Incorrect value");
			}
		}
	}
	if (dialogid == DIALOG_OBJDISTANCE2)
	{
		if(response)
		{
			if (!isnull(inputtext))
			{
				new objectid2 = strval(inputtext);
				if(IsValidDynamicObject(objectid2))
				{
					new
						Float:x, Float:y, Float:z,
						Float:x2, Float:y2, Float:z2,
						Float: distance, tmpstr[128]
					;
					GetDynamicObjectPos(GetPVarInt(playerid, "d_objectid"), x, y, z);
					GetDynamicObjectPos(objectid2, x2, y2, z2);
					distance = GetDistanceBetweenPoints(x, y, z, x2, y2, z2);
					//GetDistanceBetweenObjects(GetPVarInt(playerid, "d_objectid"),
					format(tmpstr, sizeof(tmpstr),
					"distance %.3f between id:%i and id2:%i",
					distance, GetPVarInt(playerid, "d_objectid"), objectid2);
					SendClientMessage(playerid, -1, tmpstr);
					DeletePVar(playerid, "d_objectid");
				} else {
					SendClientMessageEx(playerid, COLOR_GREY,
					"Не найден объект с таким id", "No object with this id found");
				}
			} else {
				SendClientMessageEx(playerid, COLOR_GREY,
				"Неверное значение", "Incorrect value");
			}
		}
	}
	if (dialogid == DIALOG_DYNOBJSPEED)
	{
		if(response)
		{
			if (!isnull(inputtext))
			{
				ObjectsMoveData[playerid][MoveSpeed] = strval(inputtext);
			}
		}
	}
	if (dialogid == DIALOG_DUPLICATESEARCH)
	{
		if(response)
		{
			if (!isnull(inputtext))
			{
				new modelid = strval(inputtext);
				if(IsValidObjectModel(modelid))	{
					FindDuplicateObjects(playerid, modelid);
				}
			}
		}
	}
	if(dialogid == DIALOG_SKIN)// /skin
    {
        if(response)
        {
            new skinid = strval(inputtext);
            if(skinid < 0 || skinid > 301 || skinid == 74)
            {
                SendClientMessageEx(playerid, COLOR_GREY,
				"Ошибка: Выберите скин в диапазоне 0-301", "Error: Choose a skin ID between 0 and 301.");
            }
            else
            {
				if (IsPlayerInAnyVehicle(playerid)) {
					return SendClientMessage(playerid, COLOR_GREY, "Exit from vehicle!");
				}
				new oldskinid = GetPlayerSkin(playerid);
				if (GetPVarInt(playerid, "lang") == 1) {
					format(string, sizeof(string), "New skin id: %i, old skin id: %i",
					skinid, oldskinid);
				} else {
					format(string, sizeof(string), "№ нового скина: %i, № предыдущего скина: %i",
					skinid, oldskinid);
				}
				SendClientMessage(playerid, COLOR_LIME, string);
                SetPlayerSkin(playerid, skinid);
            }
        }
		else ShowPlayerMenu(playerid, DIALOG_SETTINGS);
    }
	if (dialogid == DIALOG_WEATHER) //weather set
	{
		if(response)
		{
			if (strval(inputtext) > 255 || strval(inputtext) < 1)
			{
				SendClientMessageEx(playerid, COLOR_GREY,
				"Неверный № погоды, доступные значения [1-255]", "Incorrect weather ID, available values [1-255]");
			} else {
				SetPlayerWeather(playerid, strval(inputtext)); 
				SetPVarInt(playerid,"Weather",strval(inputtext));
			}
			ShowPlayerDialog(playerid, DIALOG_WEATHER, DIALOG_STYLE_INPUT, "Set weather",
			"{FFFFFF}Weather IDs 1-22 appear to work correctly but other IDs may result in strange effects (max 255)\n\n"\
			"1 = SUNNY_LA (DEFAULT)\t11 = EXTRASUNNY_VEGAS (heat waves)\n"\
			"2 = EXTRASUNNY_SMOG_LA\t12 = CLOUDY_VEGAS\n"\
			"3 = SUNNY_SMOG_LA\t13 = EXTRASUNNY_COUNTRYSIDE\n"\
			"4 = CLOUDY_LA\t\t14 = SUNNY_COUNTRYSIDE\n"\
			"5 = SUNNY_SF\t\t15 = CLOUDY_COUNTRYSIDE\n"\
			"6 = EXTRASUNNY_SF\t\t16 = RAINY_COUNTRYSIDE\n"\
			"7 = CLOUDY_SF\t\t17 = EXTRASUNNY_DESERT\n"\
			"8 = RAINY_SF\t\t18 = SUNNY_DESERT\n"\
			"9 = FOGGY_SF\t\t19 = SANDSTORM_DESERT\n"\
			"10 = SUNNY_VEGAS\t20 = UNDERWATER (greenish, foggy)\n\n"\
			"Enter weather id\n",
			"Ok", "Cancel");
		}
	}
	if (dialogid == DIALOG_TIME) //time set
	{
		if(response)
		{
			if (strval(inputtext) > 23 || strval(inputtext) < 0)
			{
				SendClientMessageEx(playerid, COLOR_GREY,
				"Доступное время 0-23 часов", "Incorrect [hour], available values [0-23]");
			} else {
				SetPlayerTime(playerid,strval(inputtext),0); 
				SetPVarInt(playerid,"Hour",strval(inputtext)); 
			}
		}
	}
	if (dialogid == DIALOG_GRAVITY) 
	{
		if(response)
		{
			if (!isnull(inputtext))
			{
				SetGravity(floatstr(inputtext)); 
			} else {
				SendClientMessageEx(playerid, COLOR_GREY, "Неверное значение", "Incorrect value");
			}
		}
	}
	if (dialogid == DIALOG_SETINTERIOR) 
	{
		if(response)
		{
			if (!isnull(inputtext))
			{
				SetPlayerInterior(playerid, strval(inputtext));
			} else {
				SendClientMessageEx(playerid, COLOR_GREY, "Неверное значение", "Incorrect value");
			}
		}
	}
	if (dialogid == DIALOG_SETWORLD) 
	{
		if(response)
		{
			if (!isnull(inputtext))
			{
				SetPlayerVirtualWorld(playerid, strval(inputtext)); 
			} else {
				SendClientMessageEx(playerid, COLOR_GREY, "Неверное значение", "Incorrect value");
			}
		}
	}
	if (dialogid == DIALOG_CLEARTEMPFILES)
	{
		if(response) RemoveTempMapEditorFiles(playerid);
	}
	if(dialogid == DIALOG_SOUNDTEST)
	{
		if(response)
		{
			new Value = strval(inputtext);
			format(string, sizeof(string), "Sound id: %d", Value);
			SendClientMessage(playerid, -1, string);
			PlayerPlaySound(playerid,Value,0,0,0);
			ShowPlayerMenu(playerid, DIALOG_SOUNDTEST);
		} else {
			PlayerPlaySound(playerid,strval(inputtext)+1,0,0,0);
			PlayerPlaySound(playerid,0,0,0,0);
			StopAudioStreamForPlayer(playerid);
		}
	}
	if(dialogid == DIALOG_SOUNDPOINT)
	{
		if(response)
		{
			if(!isnull(inputtext))
			{
				new Value = strval(inputtext);
				format(string, sizeof(string), "Sound id: %d", Value);
				SendClientMessage(playerid, -1, string);
				new Float:pos[3];
				GetPlayerPos(playerid, pos[0],pos[1],pos[2]);
				PlayerPlaySound(playerid, Value, pos[0], pos[1], pos[2]);
			}
			#if defined TEXTURE_STUDIO
			CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/cobject 2226");
			#endif
		}
	}
	if(dialogid == DIALOG_3DTEXTMENU)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:	
				{
					if (GetPVarInt(playerid, "lang") == 0) {
						ShowPlayerDialog(playerid, DIALOG_CREATE3DTEXT, DIALOG_STYLE_INPUT,
						"3D Text","{FFFFFF}Введите текст\n",
						"Create","Cancel");
					} else {
						ShowPlayerDialog(playerid, DIALOG_CREATE3DTEXT, DIALOG_STYLE_INPUT,
						"3D Text","{FFFFFF}Enter text\n",
						"Create","Cancel");
					}
				}
				case 1:
				{
					if (GetPVarInt(playerid, "lang") == 0) {
						ShowPlayerDialog(playerid, DIALOG_INDEX3DTEXT, DIALOG_STYLE_INPUT,
						"3D Text - Index","{FFFFFF}Введите index для редактирования\n",
						"Select","Cancel");
					} else {
						ShowPlayerDialog(playerid, DIALOG_INDEX3DTEXT, DIALOG_STYLE_INPUT,
						"3D Text - Index","{FFFFFF}Enter index to edit\n",
						"Select","Cancel");
					}
				}
				case 2:
				{
					if (GetPVarInt(playerid, "lang") == 0) {
						ShowPlayerDialog(playerid, DIALOG_UPDATE3DTEXT, DIALOG_STYLE_INPUT,
						"3D Text - Edit text","{FFFFFF}Введите новый текст\n",
						"Select","Cancel");
					} else {
						ShowPlayerDialog(playerid, DIALOG_UPDATE3DTEXT, DIALOG_STYLE_INPUT,
						"3D Text - Edit text","{FFFFFF}Enter new text\n",
						"Select","Cancel");
					}
				}
				case 3:
				{
					if (GetPVarInt(playerid, "lang") == 0) {
						ShowPlayerDialog(playerid, DIALOG_COLOR3DTEXT, DIALOG_STYLE_INPUT,
						"3D Text - Color","{FFFFFF}Введите новый цвет в формате (0xAFAFAFAA)\n",
						"Select","Cancel");
					} else {
						ShowPlayerDialog(playerid, DIALOG_COLOR3DTEXT, DIALOG_STYLE_INPUT,
						"3D Text - Color","{FFFFFF}Enter new color. format(0xAFAFAFAA)\n",
						"Select","Cancel");
					}
				}
				case 4:
				{
					if (GetPVarInt(playerid, "lang") == 0) {
						ShowPlayerDialog(playerid, DIALOG_DISTANCE3DTEXT, DIALOG_STYLE_INPUT,
						"3D Text - Color","{FFFFFF}Введите дистанцию\n",
						"Select","Cancel");
					} else {
						ShowPlayerDialog(playerid, DIALOG_DISTANCE3DTEXT, DIALOG_STYLE_INPUT,
						"3D Text - Color","{FFFFFF}Enter new distance\n",
						"Select","Cancel");
					}
				}
				case 5:
				{
					new index =	CurrentIndex3dText;
					new tmpstr[128];
					GetPlayerPos(playerid,Text3dArray[index][tPosX],
					Text3dArray[index][tPosY],Text3dArray[index][tPosZ]);
					#if defined _streamer_included
					DestroyDynamic3DTextLabel(Text3dArray[index][index3d]);
					Text3dArray[index][index3d]= CreateDynamic3DTextLabel(Text3dArray[index][Text3Dvalue],
					Text3dArray[index][Text3Dcolor], Text3dArray[index][tPosX], Text3dArray[index][tPosY],
					Text3dArray[index][tPosZ], Text3dArray[index][Text3Ddistance],
					INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 100.0);
					#else
					Delete3DTextLabel(Text3dArray[index][index3d]);
					Text3dArray[index][index3d] = Create3DTextLabel(Text3dArray[index][Text3Dvalue],
					Text3dArray[index][Text3Dcolor],Text3dArray[index][tPosX],Text3dArray[index][tPosY],
					Text3dArray[index][tPosZ],Text3dArray[index][Text3Ddistance],0);
					#endif
					format(tmpstr, sizeof(tmpstr), "3Dtext:%i position %.2f,%.2f,%.2f",
					index, Text3dArray[index][tPosX],
					Text3dArray[index][tPosY],Text3dArray[index][tPosZ]);
					SendClientMessage(playerid, -1, tmpstr);
					//Streamer_Update(playerid);
				}
				case 6:
				{
					new index =	CurrentIndex3dText;
					Text3dArray[index][Text3Dvalue] = EOS;
					Text3dArray[index][Text3Dcolor] = TEXT3D_DEFAULT_COLOR;
					Text3dArray[index][Text3Ddistance] = TEXT3D_DEFAULT_DISTANCE;
					Text3dArray[index][tPosX] = 0.0;
					Text3dArray[index][tPosY] = 0.0;
					Text3dArray[index][tPosY] = 0.0;
					DestroyDynamic3DTextLabel(Text3dArray[index][index3d]);
				}
				case 7:
				{
					new buffer[450];
					new File:pos = fopen("mtools/3DText.txt", io_append);
					new index =	CurrentIndex3dText;
					
					#if defined _streamer_included
					format(buffer, sizeof buffer, 
					"CreateDynamic3DTextLabel(\"%s\", %s, %.2f, %.2f, %.2f, %.1f, 0,\
					INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, %.1f);\r\n",
					Text3dArray[index][Text3Dvalue], Text3dArray[index][Text3Dcolor],
					Text3dArray[index][tPosX],Text3dArray[index][tPosY],
					Text3dArray[index][tPosZ],Text3dArray[index][Text3Ddistance],
					Text3dArray[index][Text3Ddistance]);
					#else
					format(buffer, sizeof buffer, 
					"Create3DTextLabel(\"%s\", %s, %.2f, %.2f, %.2f, %.1f, 0);\r\n",
					Text3dArray[index][Text3Dvalue], Text3dArray[index][Text3Dcolor], 
					Text3dArray[index][tPosX],Text3dArray[index][tPosY],
					Text3dArray[index][tPosZ],Text3dArray[index][Text3Ddistance]);
					#endif
					fwrite(pos, buffer);
					fclose(pos);
					SendClientMessage(playerid, -1,
					"3D Text export to {FFD700}scriptfiles > mtools > 3DText.txt");
				}
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_CREATEMENU);
	}
	if(dialogid == DIALOG_ACTORS)
	{
		if(response)
		{
			switch(listitem)
			{
				// ApplyDynamicActorAnimation(playerid, "VENDING", "VEND_EAT1_P", 4.1, 0, 0, 0, 0, 0);
				case 0:	
				{
					if (GetPVarInt(playerid, "lang") == 0) {
						ShowPlayerDialog(playerid, DIALOG_ACTORCREATE, DIALOG_STYLE_INPUT,
						"Create actor", "{FFFFFF}Введите ид скина актера","OK"," < ");
					} else {
						ShowPlayerDialog(playerid, DIALOG_ACTORCREATE, DIALOG_STYLE_INPUT,
						"Create actor", "{FFFFFF}Enter the actor's skin id","OK"," < ");
					}
				}
				case 1:
				{
					if (GetPVarInt(playerid, "lang") == 0) 
					{
						ShowPlayerDialog(playerid, DIALOG_ACTORINDEX, DIALOG_STYLE_INPUT,
						"ACTORS manager", "Выберите индекс актера (0-10):", "OK"," < ");
					} else {
						ShowPlayerDialog(playerid, DIALOG_ACTORINDEX, DIALOG_STYLE_INPUT,
						"ACTORS manager", "Select actor index (0-10):", "OK"," < ");
					}
				}
				case 2:
				{
					if (GetPVarInt(playerid, "lang") == 0)
					{
						ShowPlayerDialog(playerid, DIALOG_ACTORANIMLIB, DIALOG_STYLE_INPUT,
						"Animlib",
						"{FFFFFF}Введите название библиотеки анимаций (animlib[]) например PED",
						"OK"," < ");
					} else {
						ShowPlayerDialog(playerid, DIALOG_ACTORANIMLIB, DIALOG_STYLE_INPUT,
						"Animlib",
						"{FFFFFF}Enter the name of the animation lib (animlib[]) example PED",
						"OK"," < ");
					}
				}
				case 3: 
				{
					#if defined _new_streamer_included
					if(IsDynamicActorInvulnerable(Actors[indexActor])){
						SetDynamicActorInvulnerable(Actors[indexActor], false);
					}
					else SetDynamicActorInvulnerable(Actors[indexActor], true);
					#else
					if(IsActorInvulnerable(Actors[indexActor])) SetActorInvulnerable(Actors[indexActor], false);
					else SetActorInvulnerable(Actors[indexActor], true);
					#endif
				}
				case 4:
				{
					new Float: x, Float: y, Float: z, Float:ang;  
					GetPlayerPos(playerid, x, y, z);
					GetPlayerFacingAngle(playerid, ang);
					#if defined _new_streamer_included
					SetDynamicActorPos(Actors[indexActor], x, y, z);
					#else
					SetActorFacingAngle(Actors[indexActor], ang-180.0);
					SetActorPos(Actors[indexActor], x+1, y, z);
					#endif
				}
				case 5:
				{
					new Float:ang, Float:actor_ang;
					GetPlayerFacingAngle(playerid, ang);
					#if defined _new_streamer_included
					GetDynamicActorFacingAngle(Actors[indexActor], actor_ang);
					SetDynamicActorFacingAngle(Actors[indexActor], ang -180.0);
					#else
					GetActorFacingAngle(Actors[indexActor], actor_ang);
					SetActorFacingAngle(Actors[indexActor], ang-180.0);
					#endif
				}
				case 6: 
				{
					#if defined _new_streamer_included
					DestroyDynamicActor(Actors[indexActor]);
					#else
					DestroyActor(Actors[indexActor]);
					#endif
				}
				case 7: 
				{
					ShowPlayerDialog(playerid, DIALOG_ACTORSMASSMENU, DIALOG_STYLE_LIST,
					"Создать массовку",
					"{FFFFFF}Создать массовку\n"\
					"Кол-во актеров\n"\
					"Назначить анимации\n"\
					"Расположение массовки\n"\
					"Тематическая постановка\n"\
					"{FF0000}Распустить массовку\n",
					"OK","Cancel");
				}
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_CREATEMENU);
	}
	if(dialogid == DIALOG_ACTORINDEX)
	{
		if(response)
		{
			if(!isnull(inputtext) && isNumeric(inputtext))
			{
				if(strval(inputtext) > 0 && strval(inputtext) <= 10){
					indexActor = strval(inputtext);
				} 
				else SendClientMessageEx(playerid, -1, "Некорректное значение","Incorrect value");
			}
		}
	}
	if(dialogid == DIALOG_ACTORCREATE)
	{
		if(response)
		{
			if(!isnull(inputtext) && isNumeric(inputtext))
			{
				new skinid = strval(inputtext);
				if(skinid >= 1 && skinid < 305 && skinid != 74)
				{
					new Float:pos[4];
					GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
					GetPlayerFacingAngle(playerid, pos[3]);
					// Create test actor
					#if defined _new_streamer_included
					DestroyDynamicActor(Actors[indexActor]);
					Actors[indexActor] = CreateDynamicActor(skinid, pos[0]+1, pos[1]+1, pos[2], pos[3],
					0, 100.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), -1, STREAMER_ACTOR_SD, -1, 0);
					#else
					DestroyActor(Actors[indexActor]);
					Actors[indexActor] = CreateActor(skinid, pos[0]+1, pos[1]+1, pos[2], pos[3]);
					SetActorVirtualWorld(Actors[indexActor], GetPlayerVirtualWorld(playerid));
					#endif
				}
				else SendClientMessageEx(playerid, -1, "Нужно ввести ид скина от 0 до 305","Need to enter the skin id (0 to 305)");
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_ACTORS);
	}
	if(dialogid == DIALOG_ACTORANIMLIB)
	{
		if(response)
		{
			if(isnull(inputtext)) return SendClientMessage(playerid, -1, "Вы оставили поле ввода пустым");
			format(animactordatalib, sizeof animactordatalib, "%s", inputtext);
			ShowPlayerDialog(playerid, DIALOG_ACTORANIMNAME, DIALOG_STYLE_INPUT, "Animlib",
			"{FFFFFF}Полный список анимаций на сайте {00BFFF}http://wiki.pro-pawn.ru/wiki/Анимации\n\
			 {FFFFFF}Введите название анимации. (animname[]) например IDLE_tired\n","Ok"," X ");
		}
		else ShowPlayerMenu(playerid, DIALOG_ACTORS);
	}
	if(dialogid == DIALOG_ACTORANIMNAME)
	{
		if(response)
		{
			if(isnull(inputtext)) return SendClientMessage(playerid, -1, "Вы оставили поле ввода пустым");
			format(animactordataname, sizeof animactordataname, "%s", inputtext);
			#if defined _new_streamer_included
			ApplyDynamicActorAnimation(Actors[indexActor],animactordatalib,animactordataname, 4.1, 1, 0, 0, 0, 0);
			#else 
			ApplyActorAnimation(Actors[indexActor],animactordatalib,animactordataname, 4.1, 1, 0, 0, 0, 0); 
			#endif
			
			#if defined _YSF_included
			SendClientMessagef(playerid, -1, "animation %s - %s", animactordatalib, animactordataname);
			#endif
		}
		else ShowPlayerMenu(playerid, DIALOG_ACTORS);
	}
	if(dialogid == DIALOG_PLAYERATTACHMAIN)
	{
		if(response)
		{
			switch(listitem)
			{
				case 00:ShowIndexList(playerid);
				case 01:ShowModelInput(playerid);
				case 02:ShowBoneList(playerid);
				case 03:EditAttachCoord(playerid, ATPPOS_OFFSET_X);
				case 04:EditAttachCoord(playerid, ATPPOS_OFFSET_Y);
				case 05:EditAttachCoord(playerid, ATPPOS_OFFSET_Z);
				case 06:EditAttachCoord(playerid, ROT_OFFSET_X);
				case 07:EditAttachCoord(playerid, ROT_OFFSET_Y);
				case 08:EditAttachCoord(playerid, ROT_OFFSET_Z);
				case 09:EditAttachCoord(playerid, ATPSCALE_X);
				case 10:EditAttachCoord(playerid, ATPSCALE_Y);
				case 11:EditAttachCoord(playerid, ATPSCALE_Z);
				case 12:EditAttachment(playerid);
				case 13:ClearCurrentIndex(playerid);
				case 14:SaveAttachedObjects(playerid);
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_CREATEMENU);
	}
	if(dialogid == DIALOG_ATPINDEX_SELECT)
	{
		if(response)
		{
			gCurrentAttachIndex[playerid] = listitem;
			ShowMainAttachEditMenu(playerid);
		}
		else ShowMainAttachEditMenu(playerid);

		return 1;
	}
	if(dialogid == DIALOG_ATPMODEL_SELECT)
	{
		if(response)
		{
			gIndexModel[playerid][gCurrentAttachIndex[playerid]] = strval(inputtext);
			ShowMainAttachEditMenu(playerid);
		}
		else ShowMainAttachEditMenu(playerid);
	}

	if(dialogid == DIALOG_ATPBONE_SELECT)
	{
		if(response)
		{
			gIndexBone[playerid][gCurrentAttachIndex[playerid]] = listitem + 1;
			ShowMainAttachEditMenu(playerid);
		}
		else ShowMainAttachEditMenu(playerid);
	}
	if(dialogid == DIALOG_ATPCOORD_INPUT)
	{
		if(response)
		{
			new Float:value = floatstr(inputtext);

			switch(gCurrentAxisEdit[playerid])
			{
				case ATPPOS_OFFSET_X:  gIndexPos[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_X] = value;
				case ATPPOS_OFFSET_Y:  gIndexPos[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Y] = value;
				case ATPPOS_OFFSET_Z:  gIndexPos[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Z] = value;
				case ROT_OFFSET_X:  gIndexRot[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_X] = value;
				case ROT_OFFSET_Y:  gIndexRot[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Y] = value;
				case ROT_OFFSET_Z:  gIndexRot[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Z] = value;
				case ATPSCALE_X:       gIndexSca[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_X] = value;
				case ATPSCALE_Y:       gIndexSca[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Y] = value;
				case ATPSCALE_Z:       gIndexSca[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Z] = value;
			}

			SetPlayerAttachedObject(playerid,
			gCurrentAttachIndex[playerid],
			gIndexModel[playerid][gCurrentAttachIndex[playerid]],
			gIndexBone[playerid][gCurrentAttachIndex[playerid]],
			gIndexPos[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_X],
			gIndexPos[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Y],
			gIndexPos[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Z],
			gIndexRot[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_X],
			gIndexRot[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Y],
			gIndexRot[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Z],
			gIndexSca[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_X],
			gIndexSca[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Y],
			gIndexSca[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Z]);
		}
		ShowMainAttachEditMenu(playerid);
	}
	if(dialogid == DIALOG_WEAPONS)
	{	
		if(response)
		{
			switch(listitem)
			{
				case 0: 
				{
					ShowPlayerDialog(playerid, DIALOG_WEAPONS_MELEE, DIALOG_STYLE_LIST,
					"Melee",
					"Brass knuckles\nGolf club\nNite stick\nKnife\n\
					Baseball bat\nShovel\nPool cue\nKatana\nChainsaw\n\
					Purple dildo\nShort dildo\nLong vibrator\n\
					Long vibrator\nFlowers\nCane",
					"Select", "Cancel");
				}
				case 1: 
				{
					ShowPlayerDialog(playerid, DIALOG_WEAPONS_PISTOLS, DIALOG_STYLE_LIST,
					"Pistols", "9mm Pistol\nSilenced pistol\nDesert eagle",
					"Select", "Cancel");
				}
				case 2:
				{
					ShowPlayerDialog(playerid, DIALOG_WEAPONS_SHOTGUNS, DIALOG_STYLE_LIST,
					"Shotguns", "Shotgun\nSawn-off shotgun\nCombat shotgun",
					"Select", "Cancel");
				}
				case 3:
				{
					ShowPlayerDialog(playerid, DIALOG_WEAPONS_SUBMACHINE, DIALOG_STYLE_LIST,
					"Sub-machine guns", "Micro Uzi\nMP5\nTEC9",
					"Select", "Cancel");
				}
				case 4:
				{
					ShowPlayerDialog(playerid, DIALOG_WEAPONS_ASSAULT, DIALOG_STYLE_LIST,
					"Assault", "AK47\nM4",
					"Select", "Cancel");
				}
				case 5:
				{
					ShowPlayerDialog(playerid, DIALOG_WEAPONS_RIFLES, DIALOG_STYLE_LIST,
					"Rifles", "Country rifle\nSniper rifle",
					"Select", "Cancel");
				}
				case 6:
				{
					ShowPlayerDialog(playerid, DIALOG_WEAPONS_HEAVY, DIALOG_STYLE_LIST,
					"Heavy weapons","Rocket Launcher\nHS-Rocket Launcher\nFlame thrower\nMinigun",
					"Select", "Cancel");
				}
				case 7: 
				{
					ShowPlayerDialog(playerid, DIALOG_WEAPONS_GRENADES, DIALOG_STYLE_LIST,
					"Grenades", "Grenades\nTear Gas\nMolotov cocktail",
					"Select", "Cancel");
				}
				case 8: 
				{
					ShowPlayerDialog(playerid, DIALOG_WEAPONS_HANDHELD, DIALOG_STYLE_LIST,
					"Hand held", "Spray can\nFire extinguisher\nCamera",
					"Select", "Cancel");
				}
				case 9:
				{
					new i;
					for(i = 0; i < sizeof(weapon); i++)
					{
						weapon[i] = 0;
					}
					
					i = 0; //drop counter
					for(i = 0; i < MAX_PLAYERS; i++)
					{
						ResetPlayerWeapons(i);
					}
				}
			}
		}
	}
	if(dialogid == DIALOG_WEAPONS_MELEE)
	{
		if(response)
		{
			new weapons[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
			GiveWeaponsToAllPlayers(1, weapons[listitem], 9999);
		}
		else ShowPlayerMenu(playerid, DIALOG_WEAPONS);
	}
	if(dialogid == DIALOG_WEAPONS_PISTOLS)
	{
		if(response)
		{
			new weapons[] = {22,23,24};
			GiveWeaponsToAllPlayers(2, weapons[listitem], 9999);
		}
		else ShowPlayerMenu(playerid, DIALOG_WEAPONS);
	}
	if(dialogid == DIALOG_WEAPONS_SHOTGUNS)
	{
		if(response)
		{
			new weapons[] = {25,26,27};
			GiveWeaponsToAllPlayers(3, weapons[listitem], 9999);
		}
		else ShowPlayerMenu(playerid, DIALOG_WEAPONS);
	}
	if(dialogid == DIALOG_WEAPONS_SUBMACHINE)
	{
		if(response)
		{
			new weapons[] = {28,29,32};
			GiveWeaponsToAllPlayers(4, weapons[listitem], 9999);
		}
		else ShowPlayerMenu(playerid, DIALOG_WEAPONS);
	}
	if(dialogid == DIALOG_WEAPONS_ASSAULT)
	{
		if(response)
		{
			new weapons[] = {30,31};
			GiveWeaponsToAllPlayers(5, weapons[listitem], 9999);
		}
		else ShowPlayerMenu(playerid, DIALOG_WEAPONS);
	}
	if(dialogid == DIALOG_WEAPONS_RIFLES)
	{
		if(response)
		{
			new weapons[] = {33,34};
			GiveWeaponsToAllPlayers(6, weapons[listitem], 9999);
		}
		else ShowPlayerMenu(playerid, DIALOG_WEAPONS);
	}
	if(dialogid == DIALOG_WEAPONS_HEAVY)
	{
		if(response)
		{
			new weapons[] = {35,36,37,38};
			GiveWeaponsToAllPlayers(7, weapons[listitem], 9999);
		}
		else ShowPlayerMenu(playerid, DIALOG_WEAPONS);
	}
	if(dialogid == DIALOG_WEAPONS_GRENADES)
	{
		if(response)
		{
			new weapons[] = {16,17,18};
			GiveWeaponsToAllPlayers(8, weapons[listitem], 9999);
		}
		else ShowPlayerMenu(playerid, DIALOG_WEAPONS);
	}
	if(dialogid == DIALOG_WEAPONS_HANDHELD)
	{
		if(response)
		{
			new weapons[] = {41,42,43,44};
			GiveWeaponsToAllPlayers(9, weapons[listitem], 9999);
		}
		else ShowPlayerMenu(playerid, DIALOG_WEAPONS);
	}
	if(dialogid == DIALOG_VAE)
	{	
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					//VaeData[playerid][EditStatus] = vaeModel;
					if (GetPVarInt(playerid, "lang") == 0)
					{
						ShowPlayerDialog(playerid, DIALOG_VAENEW, DIALOG_STYLE_INPUT,
						"VAE New attach", "Введите ID модели объекта для прикрепления на транспорт.\
						(Например minigun: 362)\nВведите ID:",
						">>>","Cancel");
					} else {
						ShowPlayerDialog(playerid, DIALOG_VAENEW, DIALOG_STYLE_INPUT,
						"VAE New attach", "specify the object model to attach to the vehicle.\
						(For example minigun: 362)\nEnter model id:",
						">>>","Cancel");
					}
					//SendClientMessage(playerid, -1, "Editing Object Model.");
				}
				case 1:
				{
					VaeData[playerid][EditStatus] = vaeFloatX;
					SendClientMessageEx(playerid, -1,
					"Редактирование оси X.","X axis editing.");
				}
				case 2:
				{
					VaeData[playerid][EditStatus] = vaeFloatY;
					SendClientMessageEx(playerid, -1,
					"Редактирование оси Y.","Y axis editing.");
				}
				case 3:
				{
					VaeData[playerid][EditStatus] = vaeFloatZ;
					SendClientMessageEx(playerid, -1,
					"Редактирование оси Z.", "Z axis editing.");
				}
				case 4:
				{
					VaeData[playerid][EditStatus] = vaeFloatRX;
					SendClientMessageEx(playerid, -1,
					"Редактирование оси RX.", "RX axis editing.");
				}
				case 5:
				{
					VaeData[playerid][EditStatus] = vaeFloatRY;
					SendClientMessageEx(playerid, -1,
					 "Редактирование оси RY.", "RY axis editing.");
				}
				case 6:
				{
					VaeData[playerid][EditStatus] = vaeFloatRZ;
					SendClientMessageEx(playerid, -1,
					"Редактирование оси RZ.", "RZ axis editing.");
				}
				case 7:
				{
					VaeData[playerid][OffSetX]  = 0.0;
					VaeData[playerid][OffSetY]  = 0.0;
					VaeData[playerid][OffSetZ]  = 0.0;
					VaeData[playerid][OffSetRX] = 0.0;
					VaeData[playerid][OffSetRY] = 0.0;
					VaeData[playerid][OffSetRZ] = 0.0;
					SendClientMessageEx(playerid, -1,
					"Значения XYZ и осей сброшены", "Reset XYZ and adjustment");
					ShowPlayerMenu(playerid, DIALOG_VAE);
				}
				case 8:
				{
					if(GetPVarInt(playerid, "freezed") > 0)
					{
						TogglePlayerControllable(playerid, true);
						SetPVarInt(playerid,"freezed",0);
						SendClientMessageEx(playerid, -1, "Вы размороженны","You are unfreezed");
					} else {
						TogglePlayerControllable(playerid, false);
						SetPVarInt(playerid,"freezed",1);
						SendClientMessageEx(playerid, -1, "Вы замороженны","You are freezed");
					}
				}
				case 9:
				{
					KillTimer(VaeData[playerid][timer]);
					TogglePlayerControllable(playerid, true);
					SetPVarInt(playerid,"freezed",0);
					DeletePVar(playerid, "VaeEdit");
					SendClientMessageEx(playerid, -1,
					"Редактирование закончено.", "Finish vae edit");
				}
				case 10:
				{
					new File: file = fopen("mtools/Vaeditions.txt", io_append);
					new str[200];
					format(str, 200, "\r\nAttachObjectToVehicle(objectid, vehicleid, %f, %f, %f, %f, %f, %f); //Object Model: %d | %s",
					VaeData[playerid][OffSetX], VaeData[playerid][OffSetY], VaeData[playerid][OffSetZ],
					VaeData[playerid][OffSetRX], VaeData[playerid][OffSetRY], VaeData[playerid][OffSetRZ], VaeData[playerid][objmodel]);
					fwrite(file, str);
					fclose(file);
					return SendClientMessageEx(playerid, -1,
					"Всё сохранено в \"vaeditions.txt\".", "Saved to \"vaeditions.txt\".");
				}
			}
		}
		else ShowPlayerMenu(playerid, DIALOG_CREATEMENU);
	}
	if(dialogid == DIALOG_VAENEW)
	{
		if(response)
		{
			if(!isnull(inputtext) && strval(inputtext) != INVALID_OBJECT_ID)
			{
				if(!IsPlayerInAnyVehicle(playerid)) {
					 return SendClientMessageEx(playerid, -1,
					"Вы не в машине.","You are not in the car.");
				}
				if(VaeData[playerid][timer] != -1) KillTimer(VaeData[playerid][timer]);
				if(IsValidObject(VaeData[playerid][obj])) DestroyObject(VaeData[playerid][obj]);
				
				if(VaeData[playerid][obj] == -1)
				{
					SendClientMessageEx(playerid, -1, 
					"Используйте клавиши {FF0000}ВЛЕВО-ВПРАВО{FFFFFF} для перемещения аттача",
					"Use keys {FF0000}LEFT - RIGHT{FFFFFF} to move attach");
					SendClientMessageEx(playerid, -1, 
					"Удерживайте {FF0000}F / ENTER{FFFFFF} для того чтобы показать меню редактирования",
					"Hold {FF0000}F / ENTER{FFFFFF} to show the edit menu");
				}
			
				if(VaeData[playerid][timer] != -1) KillTimer(VaeData[playerid][timer]);
				if(IsValidObject(VaeData[playerid][obj])) DestroyObject(VaeData[playerid][obj]);	
				new Obj = CreateObject(strval(inputtext), 0.0, 0.0, -10.0, -50.0, 0, 0, 0);
				new vId = GetPlayerVehicleID(playerid);
				AttachObjectToVehicle(Obj, vId, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
				VaeData[playerid][timer] = SetTimerEx("VaeGetKeys", 30, true, "i", playerid);
				VaeData[playerid][EditStatus] = vaeFloatX;
				VaeData[playerid][VehicleID] = vId;		
				VaeData[playerid][objmodel] = strval(inputtext);
				if(Obj != VaeData[playerid][obj])
				{
					VaeData[playerid][OffSetX]  = 0.0;
					VaeData[playerid][OffSetY]  = 0.0;
					VaeData[playerid][OffSetZ]  = 0.0;
					VaeData[playerid][OffSetRX] = 0.0;
					VaeData[playerid][OffSetRY] = 0.0;
					VaeData[playerid][OffSetRZ] = 0.0;
				}	
				VaeData[playerid][obj] = Obj;
				TogglePlayerControllable(playerid, false);
				SetPVarInt(playerid,"freezed",1);
				SetPVarInt(playerid, "VaeEdit",1);
				ShowPlayerMenu(playerid, DIALOG_VAE);
				GameTextForPlayer(playerid,"~w~HOLD ENTER~n~to open edit menu",5000,1);
			}
		} 
	}
	if(dialogid == DIALOG_GAMETEXTSTYLE)
	{
		if(response)
		{
			if(listitem == 2)
			{
				SendClientMessageEx(playerid, -1,
				"текст исчезнет после смерти", "the text will disappear after death");
			}
			SetSVarInt("gametextstyle", listitem);
			ShowPlayerDialog(playerid, DIALOG_GAMETEXTTEST, DIALOG_STYLE_INPUT,
			"Gametext",
			"{FFFFFF}~n~New line -k- Keycode\n"\
			"{FF0000}~r~Red {008000}~g~Green {000080}~b~Blue \
			{FFFFFF}~w~White {FFFF00}~y~Yellow {262626}~l~black\n"\
			"{FFFFFF}Enter text to test", "OK","Cancel");
		}
	}
	if(dialogid == DIALOG_GAMETEXTTEST)
	{
		if(response)
		{
			if(!isnull(inputtext))
			{
				GameTextForPlayer(playerid, inputtext, 5000, GetSVarInt("gametextstyle"));
			}
		}
	}
	// lastdialog last dialog
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	// show aim pointer on flymode
	if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_SPECTATING)
	{
		if(aimPoint && GetPVarInt(playerid,"hud") != 0) 
		{
			PlayerTextDrawShow(playerid, TDAIM[playerid]);
		}
	}
	// hide aim pointer on flymode
	if(oldstate == PLAYER_STATE_SPECTATING)
	{
		PlayerTextDrawHide(playerid, TDAIM[playerid]);
	}
	// By analogy with the Texture studio, it removes transport on player exit
	if(oldstate == PLAYER_STATE_DRIVER && newstate == PLAYER_STATE_ONFOOT)
	{
		if(removePlayerVehicleOnExit){
			if(PlayerVehicle[playerid] != 0) DestroyVehicle(PlayerVehicle[playerid]);
		}
		if(Vehcam[playerid] != 0) { 
			DestroyObject(Vehcam[playerid]);
			SetCameraBehindPlayer(playerid);
		}
		if(GetPVarInt(playerid, "DashCam") > 0)
		{
			PlayerTextDrawHide(playerid, DashCam[playerid]);
			PlayerTextDrawHide(playerid, DashCam2[playerid]);
		}
	}
	if(newstate == PLAYER_STATE_DRIVER)
	{
		if(GetPVarInt(playerid, "DashCam") > 0)
		{
			PlayerTextDrawShow(playerid, DashCam[playerid]);
			PlayerTextDrawShow(playerid, DashCam2[playerid]);
		}
	}
	#if defined UGMP_POSTFX_INCLUDED
	if (dialogid == DIALOG_UGMP_FEATURES)
	{
		if (response)
		{
			switch(listitem)
			{
				case 0:
				{
					if (GetPVarInt(playerid, "TogglePlayerGrass") > 0)
					{
						TogglePlayerGrass(playerid, false);
						SetPVarInt(playerid, "TogglePlayerGrass", false);
					} else {
						TogglePlayerGrass(playerid, true);
						SetPVarInt(playerid, "TogglePlayerGrass", true);
					}
				}
				case 1: 
				{
					if (IsRubbishVisibleForPlayer(playerid)) {
						TogglePlayerRubbish(playerid, false);
					} else {
						TogglePlayerRubbish(playerid, true);
					}
				}
				case 2:
				{
					if (GetPVarInt(playerid, "TogglePlayerSun") > 0)
					{
						TogglePlayerSun(playerid, false);
						SetPVarInt(playerid, "TogglePlayerSun", false);
					} else {
						TogglePlayerSun(playerid, true);
						SetPVarInt(playerid, "TogglePlayerSun", true);
					}
				}
				case 3:
				{
					if (GetPVarInt(playerid, "TogglePlayerNightVision") > 0)
					{
						TogglePlayerNightVision(playerid, false);
						SetPVarInt(playerid, "TogglePlayerNightVision", false);
					} else {
						TogglePlayerNightVision(playerid, true);
						SetPVarInt(playerid, "TogglePlayerNightVision", true);
					}
				}
				case 4:
				{
					if (GetPVarInt(playerid, "TogglePlayerInfraRed") > 0)
					{
						TogglePlayerInfraRed(playerid, false);
						SetPVarInt(playerid, "TogglePlayerInfraRed", false);
					} else {
						TogglePlayerInfraRed(playerid, true);
						SetPVarInt(playerid, "TogglePlayerInfraRed", true);
					}
				}
				case 5:
				{
					if (GetPVarInt(playerid, "TogglePlayerCCTV") > 0)
					{
						TogglePlayerCCTV(playerid, false);
						SetPVarInt(playerid, "TogglePlayerCCTV", false);
					} else {
						TogglePlayerCCTV(playerid, true);
						SetPVarInt(playerid, "TogglePlayerCCTV", true);
					}
				}
				case 6:
				{
					if (GetPVarInt(playerid, "TogglePlayerFogOverlay") > 0)
					{
						TogglePlayerFogOverlay(playerid, false);
						SetPVarInt(playerid, "TogglePlayerFogOverlay", false);
					} else {
						TogglePlayerFogOverlay(playerid, true);
						SetPVarInt(playerid, "TogglePlayerFogOverlay", true);
					}
				}
				case 7:
				{
					if (GetPVarInt(playerid, "TogglePlayerVideoCameraOverlay") > 0)
					{
						TogglePlayerVideoCameraOverlay(playerid, false);
						SetPVarInt(playerid, "TogglePlayerVideoCameraOverlay", false);
					} else {
						TogglePlayerVideoCameraOverlay(playerid, true);
						SetPVarInt(playerid, "TogglePlayerVideoCameraOverlay", true);
					}
				}
				case 8:
				{
					if (GetPVarInt(playerid, "TogglePlayerRealTimeShadows") > 0)
					{
						TogglePlayerRealTimeShadows(playerid, false);
						SetPVarInt(playerid, "TogglePlayerRealTimeShadows", false);
					} else {
						TogglePlayerRealTimeShadows(playerid, true);
						SetPVarInt(playerid, "TogglePlayerRealTimeShadows", true);
					}
				}
			}
		}
	}
	#endif
	// lastdialogid | lastdialog
	return 1;
}

public OnScriptUpdate()
{
	// used to optimize some functions instead of  OnPlayerUpdate
	// OnScriptUpdate - interval: 500 ms

	SendRconCommand("gamemodetext mtools  "#BUILD_DATE" ");

	foreach(new i : Player)
	{
		if(useAutoFixveh)
		{
			RepairVehicle(GetPlayerVehicleID(i));
		}
		// Show streamed objects
		if (streamedObjectsTD && IsPlayerSpawned(i) && GetPVarInt(i,"hud") != 0)
		{
			new streamedObjects[30];
			format(streamedObjects,sizeof(streamedObjects),"streamed objects: %i/1000",
			Streamer_CountVisibleItems(i, STREAMER_OBJECT_TYPE_GLOBAL, 1));
			PlayerTextDrawSetString(i, Objrate[i], streamedObjects);
		}
		// Drunk mode
		if(GetPVarInt(i, "drunk") > 0)
		{
			SetPlayerDrunkLevel(i, GetPVarInt(i, "drunk"));
		}
		
		if (fpsBarTD)
		{
			GetPlayerFPS(i);
			new fpsbardata[256];
			//PlayerTextDrawColor(i, FPSBAR[i], 0xFFFFFFFF);
			if(GetPVarInt(i, "fps") < 550 && GetPVarInt(i, "fps") > 10)
			{
				if(GetPVarInt(i, "fps") > 10 && GetPVarInt(i, "fps") <= 45)
				{
					format(fpsbardata,sizeof(fpsbardata),
					"FPS: ~r~%.0f",floatabs(GetPVarInt(i, "fps")));
					PlayerTextDrawSetString(i, FPSBAR[i], fpsbardata);
				} else {
					format(fpsbardata,sizeof(fpsbardata),
					"FPS: %.0f",floatabs(GetPVarInt(i, "fps")));
					PlayerTextDrawSetString(i, FPSBAR[i], fpsbardata);
				}
			} 
		}
		if(GetPVarInt(i, "DashCam") > 0 && GetPlayerState(i) == PLAYER_STATE_DRIVER)
		{
			new dashcam_data[64], dashcam_data2[64];
			new year,month,day,hour,minute,second;
			getdate(year, month, day);
			gettime(hour, minute, second);
			new copunit[12];
			switch(GetVehicleModel(GetPlayerVehicleID(i)))
			{
				case 497, 523, 430: format(copunit, sizeof(copunit), "PD");
				case 596: format(copunit, sizeof(copunit), "LSPD");
				case 597: format(copunit, sizeof(copunit), "SFPD");
				case 598: format(copunit, sizeof(copunit), "LVPD");
				case 599: format(copunit, sizeof(copunit), "RANGER");
				case 601, 427: format(copunit, sizeof(copunit), "S.W.A.T");
				case 490, 528: format(copunit, sizeof(copunit), "F.B.I");
				default: format(copunit, sizeof(copunit), "CAM");
			}
			if(hour < 12)
			{
				format(dashcam_data, sizeof(dashcam_data),
				"AM %d:%d:%d ~n~%s %d~n~%d kph", hour, minute, second, copunit,
				GetVehicleModel(GetPlayerVehicleID(i)), GetPlayerSpeed(i));
			} else {
				format(dashcam_data, sizeof(dashcam_data),
				"PM %d:%d:%d ~n~%s %d~n~%d kph", hour, minute, second, copunit,
				GetVehicleModel(GetPlayerVehicleID(i)), GetPlayerSpeed(i));
			}
			new rectimestr[48];
			new rectime = NetStats_GetConnectedTime(i)/60000; 
			if(rectime > 60)
			{
				format(rectimestr, sizeof(rectimestr), "%d:%d",
				floatround(rectime / 60), rectime % 60);
			} else {
				format(rectimestr, sizeof(rectimestr), "0:%d", rectime);
			}
			PlayerTextDrawSetString(i, DashCam[i], dashcam_data);
			format(dashcam_data2,sizeof(dashcam_data2),
			"%d %d   %d~n~~r~.~w~REC %s", day, month, year, rectimestr);
			PlayerTextDrawSetString(i, DashCam2[i], dashcam_data2);
		}
	}
	return 1;
}	

public OnPlayerUpdate(playerid)
{
	new tdtext[500], string[128];
	
	if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING && targetInfo) 
	{
		new objectid = GetPlayerCameraTargetObject(playerid);
		if(IsValidDynamicObject(objectid))
		{
			new 
				Float: x, Float: y, Float: z,
				Float: ox, Float: oy, Float: oz,
				Float: rx, Float: ry, Float: rz,
				Float: distance, objinfo[200]
			;
			GetDynamicObjectPos(objectid, ox, oy, oz);
			GetDynamicObjectRot(objectid, rx, ry, rz);
			GetPlayerPos(playerid, x,y,z);
			#if defined _new_streamer_included
			Streamer_GetDistanceToItem(x,y,z,STREAMER_TYPE_OBJECT,objectid,distance,3);
			#else
			Streamer_GetDistanceToItem(x,y,z,STREAMER_TYPE_OBJECT,objectid,distance);	
			#endif
			format(objinfo, sizeof(objinfo), "~n~~n~~w~modelid: %i distance: %.2f~n~\
			x:%.3f y:%.3f z:%.3f~n~rx:%.3f ry:%.3f rz:%.3f",
			GetDynamicObjectModel(objectid),distance, ox, oy, oz, rx, ry, rz);
			//GameTextForPlayer(playerid,objinfo,10000,5);
			SendTexdrawMessage(playerid, 2000, objinfo);
		}
		new vehicleid = GetPlayerCameraTargetVehicle(playerid);
		if(vehicleid != INVALID_VEHICLE_ID)
		{
			new 
				Float: x, Float: y, Float: z,
				Float: rx, Float:ry, Float: rz,
				vehinfo[200]
			;
			GetVehiclePos(vehicleid, x, y, z);
			GetVehicleRotation(vehicleid, rx, ry, rz);
			format(vehinfo, sizeof(vehinfo), "~n~~n~~w~modelid: %i~n~\
			x:%.3f y:%.3f z:%.3f~n~rx:%.3f ry:%.3f rz:%.3f",
			GetVehicleModel(vehicleid), x, y, z, rx, ry, rz);
			//GameTextForPlayer(playerid,vehinfo,10000,5);
			SendTexdrawMessage(playerid, 2000, vehinfo);
		}
	}
	
	if (GetPVarInt(playerid, "specbar") != -1 && IsPlayerConnected(GetPVarInt(playerid,"specbar")))
	{
		new specid = GetPVarInt(playerid, "specbar");
		format(string, sizeof(string), "[~w~DEBUG] ~r~M~w~tools v~r~%s~n~", VERSION);
		strcat(tdtext, string);	
		
		new Float: health, Float: armour;
		GetPlayerHealth(specid, health);
		GetPlayerArmour(specid, armour);
		//format(string, sizeof(string), "~r~HP = %.1f ~h~~b~Armour = %.1f~n~", health, armour);
		format(string, sizeof(string), "~w~FPS:~r~%.0f ~w~Ping:~r~%d ~w~P.Loss:~r~%.1f~n~",
		floatabs(GetPVarInt(specid, "fps")),GetPlayerPing(specid),GetPVarFloat(specid, "ploss"));
		strcat(tdtext, string);			

		new newstate[36];
		switch(GetPlayerState(specid))
		{
			case 0: format(newstate, sizeof(newstate), "NONE");
			case 1:	format(newstate, sizeof(newstate), "ONFOOT");
			case 2:	format(newstate, sizeof(newstate), "DRIVER");
			case 3:	format(newstate, sizeof(newstate), "PASSENGER");
			case 4:	format(newstate, sizeof(newstate), "EXIT_VEHICLE");
			case 5:	format(newstate, sizeof(newstate), "ENTER_VEHICLE_DRIVER");
			case 6:	format(newstate, sizeof(newstate), "ENTER_VEHICLE_PASSENGER");	
			case 7:	format(newstate, sizeof(newstate), "WASTED");
			case 8:	format(newstate, sizeof(newstate), "SPAWNED");
			case 9:	format(newstate, sizeof(newstate), "SPECTATING");
			default: format(newstate, sizeof(newstate), "NONE");
		}
		
		format(string, sizeof(string), "~w~Skin ~r~%d~w~ ~w~AnimIndex ~r~%d~w~ %s ~n~", 
		GetPlayerSkin(specid),GetPlayerAnimationIndex(specid), newstate);
		strcat(tdtext, string);
		
		format(string, sizeof(string), "~w~Freezed ~r~%d ~w~world ~r~%d~w~ interior ~r~%d~n~",
		GetPVarInt(specid, "frz"),GetPlayerVirtualWorld(specid), GetPlayerInterior(specid));
		strcat(tdtext, string);	
					
		format(string, sizeof(string), "~w~FlyMode ~r~%d ~w~Specing ~r~%d ~w~Player speed ~r~%d~n~",
		GetPVarInt(specid, "FlyMode"), GetPVarInt(specid, "Specing"), GetPlayerSpeed(specid));
		strcat(tdtext, string);			
		
		format(string, sizeof(string), "~w~PlayerCameraMode ~r~%i~w~ ~n~", 
		GetPlayerCameraMode(playerid));
		strcat(tdtext, string);
		
		PlayerTextDrawSetString(playerid, TDspecbar[playerid],tdtext);
	}
}

public OnFilterScriptExit()
{
	/*new query[128];
	format(query,sizeof(query),
	"UPDATE `Settings` SET Value=%d, WHERE Option='Language'", LangSet);
	db_query(mtoolsDB,query);*/
	db_close(mtoolsDB);
	// vae
	for(new i = 0; i < MAX_PLAYERS; ++i) DestroyObject(VaeData[i][obj]);
	return 1;
}

//================================== [MENU] ====================================
public ShowPlayerMenu(playerid, dialogid)
{
	// Used for frequently called dialogues
	// dialogid == dialogid from function OnDialogResponse
	switch(dialogid)
	{
		case DIALOG_MAIN:
		{
			new tbtext[350];
			if(GetPVarInt(playerid, "lang") == 1)
			{		
				format(tbtext, sizeof(tbtext),
				"[>] Edit\n"\
				"{A9A9A9}[>] Create\n"\
				"[>] Remove\n"\
				"{A9A9A9}[>] Textures\n"\
				"[>] Map manage\n"\
				"{A9A9A9}[>] Vehicles\n"\
				"[>] Cam mode\n"\
				"{A9A9A9}[>] Etc\n"\
				"[>] Settings\n"\
				"{A9A9A9}[>] Information\n");
			} else {
				format(tbtext, sizeof(tbtext),
				"[>] Редактировать\n"\
				"{A9A9A9}[>] Создать\n"\
				"[>] Удалить\n"\
				"{A9A9A9}[>] Текстуры\n"\
				"[>] Управление картой\n"\
				"{A9A9A9}[>] Транспорт\n"\
				"[>] Режим съемки\n"\
				"{A9A9A9}[>] Разное\n"\
				"[>] Настройки\n"\
				"{A9A9A9}[>] Информация\n");
			}
			ShowPlayerDialog(playerid, DIALOG_MAIN, DIALOG_STYLE_LIST,
			"{FF0000}M{FFFFFF}TOOLS",tbtext,">>>","");
		}
		case DIALOG_INFOMENU:
		{
			new tbtext[250];
			if(GetPVarInt(playerid, "lang") == 0)
			{		
				format(tbtext, sizeof(tbtext),
				"Команды {FF0000}m{FFFFFF}tools\n"\
				"Команды {00FF00}TextureStudio\n"\
				"Управление и горячие клавиши\n"\
				"Цветовая палитра\n"\
				"Credits\n"\
				"О {FF0000}m{FFFFFF}tools\n");
			} else {
				format(tbtext, sizeof(tbtext),
				"Commands {FF0000}m{FFFFFF}tools\n"\
				"Commands {00FF00}TextureStudio\n"\
				"Controls and hotkeys\n"\
				"Color codes\n"\
				"Credits\n"\
				"About {FF0000}m{FFFFFF}tools\n");
			}
			
			ShowPlayerDialog(playerid, DIALOG_INFOMENU, DIALOG_STYLE_LIST,
			"[INFO]",tbtext, "OK","Cancel");
		}
		case DIALOG_ETC:
		{
			// todo "Проверить карту на наличие дубликатов объектов\t\n"
			new tbtext[550];
			
			if(GetPVarInt(playerid, "lang") == 0)
			{		
				format(tbtext, sizeof(tbtext),
				"Прыгнуть вперед\t{00FF00}/jump\n"\
				"Surfly mode\t{00FF00}/surfly\n"\
				"Взять джетпак\t{FFFF00}/jetpack\n"\
				"Телепортироваться в стандартный интерьер\t{FFFF00}/gotoint\n"\
				"Телепортироваться в город\t{FFFF00}/tplist\n"\
				"Обновить все динамические элементы\t\n"\
				"Протестировать ID звука из игры\t\n"\
				"Вывести Gametext\t\n"\
				"Оружие\t{FFFF00}/w\n");
			} else {
				format(tbtext, sizeof(tbtext),
				"Jump forward\t{00FF00}/jump\n"\
				"Surfly mode\t{00FF00}/surfly\n"\
				"Take a jetpack\t{FFFF00}/jetpack\n"\
				"Teleport to standard interior\t{FFFF00}/gotoint\n"\
				"Teleport to city\t{FFFF00}/tplist\n"\
				"Update All Dynamic Elements\t\n"\
				"Test sound ID from game\t\n"\
				"Gametext\t\n"\
				"Weapons\t{FFFF00}/w\n");
			}
			
			ShowPlayerDialog(playerid, DIALOG_ETC, DIALOG_STYLE_TABLIST,
			"[ETC]",tbtext,"OK","Close");
		}
		case DIALOG_CREATEMENU:
		{
			new tbtext[400];
			
			if(GetPVarInt(playerid, "lang") == 0)
			{		
				format(tbtext, sizeof(tbtext),
				"{A9A9A9}[>] Объект\n"\
				"[>] 3D текст\n"\
				"{A9A9A9}[>] Текст\n"\
				"[>] Pickup\n"\
				"{A9A9A9}[>] Attach к игроку\n"\
				"[>] Attach на транспорт\n"\
				"{A9A9A9}[>] Актера\n"\
				"[>] Карту\n");
			} else {
				format(tbtext, sizeof(tbtext),
				"{A9A9A9}[>] Object\n"\
				"[>] 3D text\n"\
				"{A9A9A9}[>]  Text object\n"\
				"[>] Pickup\n"\
				"{A9A9A9}[>] Attach to Player\n"\
				"[>] Attach to Vehicle\n"\
				"{A9A9A9}[>] Actor\n"\
				"[>] New map\n");
			}
			
			ShowPlayerDialog(playerid, DIALOG_CREATEMENU, DIALOG_STYLE_LIST,
			"[CREATE]",tbtext, "OK","Cancel");
		}
		case DIALOG_OBJECTSCAT:
		{
			new tbtext[300];
			if(GetPVarInt(playerid, "lang") == 0)
			{		
				format(tbtext, sizeof(tbtext),
				"Избранные\n\
				[>] SA-MP объекты\n\
				[>] Освещение\n\
				[>] Природа\n\
				[>] Стены\n\
				[>] Компоненты дома\n\
				[>] Интерьер\n\
				[>] Уличные\n\
				[>] Ландшафт\n\
				[>] Дороги\n\
				[>] Мусор\n\
				Поиск объектов");
			} else {
				format(tbtext, sizeof(tbtext),
				"Favorites\n\
				[>] SA-MP objects\n\
				[>] Lighting\n\
				[>] Nature\n\
				[>] Walls\n\
				[>] House components\n\
				[>] Interior\n\
				[>] Street\n\
				[>] Landscape\n\
				[>] Roads\n\
				[>] Trash\n\
				Search objects");
			}
			ShowPlayerDialog(playerid, DIALOG_OBJECTSCAT, DIALOG_STYLE_LIST, 
			"[OBJECTS - CATEGORY]",tbtext,"OK","Cancel");
		}
		case DIALOG_EDITMENU:
		{
			new header[64];
			if(EDIT_OBJECT_MODELID[playerid] > 0)
			{
				format(header, sizeof header, "[EDIT] iternalid:%i model:%i",
				EDIT_OBJECT_ID[playerid], EDIT_OBJECT_MODELID[playerid]);
			} else {
				format(header, sizeof header, "[EDIT]");
			}
			
			new tbtext[500];
			
			if(GetPVarInt(playerid, "lang") == 0)
			{		
				format(tbtext, sizeof(tbtext),
				"Выбрать объект\t{00FF00}/csel\n"\
				"Переместить объект\t{00FF00}/editobject\n"\
				"Повернуть объект\t{00FF00}/rot\n"\
				"Выбрать объект стоящий рядом\t{00FF00}/scsel\n"\
				"Копировать объект\t{00FF00}/clone\n"\
				"Удалить объект\t{FF0000}/dobject\n"\
				"[>] Ретекстур\t\n"\
				"[>] Редактирование группы\t\n"\
				"{00FF00}<<<{FFFFFF} Отмена последнего действия\t{00FF00}/undo\n"\
				"Информация о текущем объектe\t{00FF00}/oprop\n");
			} else {
				format(tbtext, sizeof(tbtext),
				"Select object\t{00FF00}/csel\n"\
				"Move object\t{00FF00}/editobject\n"\
				"Rotate object\t{00FF00}/rot\n"\ 
				"Select a nearby object\t{00FF00}/scsel\n"\
				"Copy object\t{00FF00}/clone\n"\
				"Delete object\t{FF0000}/dobject\n"\
				"[>] Textures edit\t\n"\
				"[>] Groups edit\t\n"\
				"{00FF00}<<<{FFFFFF} Undo the last action\t{00FF00}/undo\n"\
				"Information about the current object\t{00FF00}/oprop\n");
			}
			
			ShowPlayerDialog(playerid, DIALOG_EDITMENU, DIALOG_STYLE_TABLIST, 
			header ,tbtext, "OK","Cancel");
		}
		case DIALOG_OBJECTSMENU:
		{
			if (GetPVarInt(playerid, "lang") == 0)
			{
				ShowPlayerDialog(playerid, DIALOG_OBJECTSMENU, DIALOG_STYLE_TABLIST, 
				"[CREATE - Objects]",
				"[>] Создать объект по номеру\t{00FF00}/oadd\n"\
				"{A9A9A9}[>] Список загруженных объектов\t{00FF00}/lsel\n"\
				"[>] Категории объектов\t\n"\
				"{A9A9A9}[>] Поиск\t\n"\
				"Информация о модели объекта\t{00FF00}/minfo\n"\
				"{A9A9A9}Показать скрытые объекты\t\n",
				//"[>] Движение объектов\t\n",
				"Select","Cancel");
			} else {
				ShowPlayerDialog(playerid, DIALOG_OBJECTSMENU, DIALOG_STYLE_TABLIST, 
				"[CREATE - Objects]",
				"[>] Create object by number\t{00FF00}/oadd\n"\
				"{A9A9A9}[>] List of loaded objects\t{00FF00}/lsel\n"\
				"[>] Object categories\t\n"\
				"{A9A9A9}[>] Search\t\n"\
				"Object model information\t{00FF00}/minfo\n"\	
				"{A9A9A9}Show hidden objects\t\n",
				//"[>] Object movement\t\n",
				"Select","Cancel");
			}
		}
		case DIALOG_OBJECTSSEARCH:
		{
			if (GetPVarInt(playerid, "lang") == 0)
			{
				ShowPlayerDialog(playerid, DIALOG_OBJECTSSEARCH, DIALOG_STYLE_TABLIST, 
				"[CREATE - Objects]",
				"{A9A9A9}Поиск объектов по слову\t{00FF00}/osearch\n"\
				"Поиск дубликатов объектов\t\n"\
				"{A9A9A9}Определить расстояние между двумя объектами\t\n"\
				"Ближайший объект\t{00FF00}/nearest\n",
				"Select","Cancel");
			} else {
				ShowPlayerDialog(playerid, DIALOG_OBJECTSSEARCH, DIALOG_STYLE_TABLIST, 
				"[CREATE - Objects]",
				"{A9A9A9}Search objects\t{00FF00}/osearch\n"\
				"Finding duplicate objects\t\n"\
				"{A9A9A9}Determine the distance between two objects\t\n"\
				"Nearest object info\t{00FF00}/nearest\n",
				"Select","Cancel");
			}
		}
		case DIALOG_GROUPEDIT:
		{
			new tbtext[450];
			
			if(GetPVarInt(playerid, "lang") == 0)
			{		
				format(tbtext, sizeof(tbtext),
				"Добавление/удаление объекта из группы\t{00FF00}/gsel\n"\
				"Установить идентификатор группы\t{00FF00}/setgroup\n"\
				"Выбрать группу\t{00FF00}/selectgroup\n"\
				"Редактировать группу\t{00FF00}/editgroup\n"\
				"Копировать объекты которые находятся в группе\t{00FF00}/gclone\n"\
				"Удалить все объекты из группы\t{00FF00}/gclear\n"\
				"Удалить объекты которые находятся в группе\t{00FF00}/gdelete\n"\
				"Создание objectmetry фигуры\t{00FF00}/obmedit\n");
			} else {
				format(tbtext, sizeof(tbtext),
				"Adding/removing an object from the group\t{00FF00}/gsel\n"\
				"Set group id \t{00FF00}/setgroup\n"\
				"Select a group of objects to edit\t{00FF00}/selectgroup\n"\
				"Start editing a group\t{00FF00}/editgroup\n"\
				"Copy objects that are in the group\t{00FF00}/gclone\n"\
				"Remove all objects from the group\t{00FF00}/gclear\n"\
				"Delete objects that are in the group\t{00FF00}/gdelete\n"\
				"Creating an objectmetry figure\t{00FF00}/obmedit\n");
			}
			
			ShowPlayerDialog(playerid, DIALOG_GROUPEDIT, DIALOG_STYLE_TABLIST,
			"[GROUP]",tbtext, "OK","Cancel");
		}
		case DIALOG_REMMENU:
		{
			new tbtext[350];
			
			if(GetPVarInt(playerid, "lang") == 0)
			{		
				format(tbtext, sizeof(tbtext),
				"Удалить текущий объект\t{FF0000}/dobject\n"\
				"Удалить ближайший объект\t{FF0000}/dcsel\n"\
				"Удалить объекты в радиусе\t{FF0000}/rangedel\n"\
				"Удалить стандартный объект\t{FF0000}/remobject\n"\
				"Скрыть объект\t\n"\
				"<<< Вернуть удаленный объект\t{FFFF00}/undo\n"\
				"Удалить временные файлы mtools\n");
			} else {
				format(tbtext, sizeof(tbtext),
				"Delete current object\t{FF0000}/dobject\n"\
				"Delete nearest object\t{FF0000}/dcsel\n"\
				"Remove objects in radius\t{FF0000}/rangedel\n"\
				"Delete default SA object\t{FF0000}/remobject\n"\
				"Hide object\t\n"\
				"<<< Restore deleted object\t{FFFF00}/undo\n"\
				"Delete temporary files mtools\n");
			}
			
			ShowPlayerDialog(playerid, DIALOG_REMMENU, DIALOG_STYLE_TABLIST,
			"[REMOVE]",tbtext, "OK","Cancel");
		}
		case DIALOG_TEXTUREMENU:
		{
			new tbtext[450];
			if(GetPVarInt(playerid, "lang") == 0)
			{		
				format(tbtext, sizeof(tbtext),	
				"Менеджер текстур\t{00FF00}/mtextures\n"\
				"Редактор текстур\t{00FF00}/stexture\n"\
				"Добавить текст на объект\t{00FF00}/text\n"\
				"Показать индексы\t{00FF00}/sindex\n"\
				"Сохраненные текстуры\t{00FF00}/ttextures\n"\
				"Найти текстуру по части имени\t{00FF00}/tsearch\n"\
				"{FF0000}Сброс материала и цвета объекта\t{FF0000}/mtreset\n"\
				"Буффер текстур\t{00FF00}/tbuffer\n");
			} else {
				format(tbtext, sizeof(tbtext),	
				"Texture manager\t{00FF00}/mtextures\n"\
				"Texture editor\t{00FF00}/stexture\n"\
				"Add text to object\t{00FF00}/text\n"\
				"Show index\t{00FF00}/sindex\n"\
				"Saved textures\t{00FF00}/ttextures\n"\
				"Find texture by part of name\t{00FF00}/tsearch\n"\
				"{FF0000}Reset object material and color\t{FF0000}/mtreset\n"\
				"Texture buffer\t{00FF00}/tbuffer\n");
			}
			
			ShowPlayerDialog(playerid, DIALOG_TEXTUREMENU, DIALOG_STYLE_TABLIST,
			"[TEXTURE]",tbtext, "OK","Cancel");
		}
		case DIALOG_TEXTUREBUFFER:
		{
			new tbtext[250];
			if(GetPVarInt(playerid, "lang") == 0)
			{		
				format(tbtext, sizeof(tbtext),	
				"Копировать свойства объекта (текстура/цвет/текст) в буфер\t{00FF00}/copy\n"\
				"Вставить свойства на выбранный объект из буфера\t{00FF00}/paste\n"\
				"{FF0000}Очистить свойства объекта из буфера\t{FF0000}/clear\n");
			} else {
				format(tbtext, sizeof(tbtext),	
				"Copy object properties (texture/color/text) to buffer\t{00FF00}/copy\n"\
				"Paste properties on the selected object from the buffer\t{00FF00}/paste\n"\
				"{FF0000}Clear object properties from buffer \t{FF0000}/clear\n");
			}
			
			ShowPlayerDialog(playerid, DIALOG_TEXTUREBUFFER, DIALOG_STYLE_TABLIST,
			"[TEXTURE]",tbtext, "OK","Cancel");
		}
		case DIALOG_CREATEOBJ:
		{
			new header[64];
			if (GetPVarInt(playerid, "lang") == 0){
				format(header, sizeof(header), "Создать объект. Последний объект: %d",
				EDIT_OBJECT_MODELID[playerid]);
				ShowPlayerDialog(playerid,DIALOG_CREATEOBJ,DIALOG_STYLE_INPUT, header,
				"{FFFFFF}Введите ID модели объекта для того чтобы его создать\n"\
				"Объект появится перед вами, далее вы будете изменять его\n\n"\
				"{FFD700}615-18300 [GTASA], 18632-19521 [SAMP], 11754-11880 [UGMP]\n"\
				"{FFFFFF}Список объектов по категориям можно посмотреть:\n"\
				"на сайте {00BFFF}https://dev.prineside.com/ru",
				"Create","Close");
			} else {
				format(header, sizeof(header), "Create object. Last object modelid: %d",
				EDIT_OBJECT_MODELID[playerid]);
				ShowPlayerDialog(playerid,DIALOG_CREATEOBJ,DIALOG_STYLE_INPUT, header,
				"{FFFFFF} Enter the model ID of the object to create it \n"\
				"The object will appear in front of you, then you will modify it\n\n"\
				"{FFD700}615-18300 [GTASA], 18632-19521 [SAMP], 11754-11880 [UGMP]\n"\
				"{FFFFFF} The list of objects by category can be viewed:\n"\
				"on the site {00BFFF} https://dev.prineside.com/ru",
				"Create","Close");
				
			}
		}
		case DIALOG_SOUNDTEST:
		{
			new tbtext[500] =
			"{FFFFFF}SOUND_BONNET_DENT 1009 \t\t SOUND_WHEEL_OF_FORTUNE_CLACKER 1027 \n"\
			"SOUND_AMMUNATION_BUY_WEAPON 1052 \t SOUND_AMMUNATION_BUY_WEAPON_DENIED 1053\n" \
			"SOUND_SHOP_BUY 1054 \t\t SOUND_SHOP_BUY_DENIED 1055\n"\
			"SOUND_RACE_321 1056 \t\t SOUND_RACE_GO 1057\n"\ 
			"SOUND_PART_MISSION_COMPLETE 1058 \t SOUND_PUNCH_PED 1130\n"\ 
			"SOUND_CAMERA_SHOT 1132 \t\t SOUND_BUY_CAR_MOD 1133 \n"\
			"SOUND_BUY_CAR_RESPRAY 1134 \t SOUND_CHECKPOINT_AMBER 1137 \n"\
			"SOUND_PROPERTY_PURCHASED 1149 \t SOUND_PICKUP_STANDARD 1150\n"\
			"\nEnter sound ID:\n";
			
			ShowPlayerDialog(playerid, DIALOG_SOUNDTEST, DIALOG_STYLE_INPUT, "Soundtest",
			tbtext, "Play", "Stop");
		}
		case DIALOG_CREATEPICKUP:
		{
			if (GetPVarInt(playerid, "lang") == 0)
			{
				ShowPlayerDialog(playerid, DIALOG_CREATEPICKUP, DIALOG_STYLE_LIST, 
				"Создание pickup",
				"{FFFFFF}Создать pickup по ID\n"\
				"{AFDAFC}броня\n"\
				"{FF0000}пополнение здоровья\n"\
				"{191970}jetpack\n"\
				"{008000}иконка бизнеса\n"\
				"{ffff00}инфо\n"\
				"{A9A9A9}вход в интерьер\n"\
				"{00ffff}починка транспорта\n"\
				"{008000}иконка дома\n"\
				"{FFFFFF}Обновить все пикапы\n",
				"Select","Cancel");
			} else {
				ShowPlayerDialog(playerid, DIALOG_CREATEPICKUP, DIALOG_STYLE_LIST, 
				"Create pickup",
				"{FFFFFF}Create pickup by ID \n"\
				"{AFDAFC}armour\n"\
				"{FF0000}health refill\n"\
				"{191970}jetpack\n"\
				"{008000}dollar icon\n"\
				"{ffff00}info icon\n"\
				"{A9A9A9}interior entrance\n"\
				"{00ffff}vehicle fix\n"\
				"{008000}house\n"\
				"{ffffff}Update all pickups\n",
				"Select","Cancel");
			}	
		}
		case DIALOG_ACTORS:
		{
			new tbtext[300];
			
			new header[64];
			if(indexActor > -1)
			{
				format(header, sizeof header, "[ACTORS] actorindex: %i", indexActor);
			} else {
				format(header, sizeof header, "[ACTORS]");
			}
			
			if(GetPVarInt(playerid, "lang") == 0)
			{		
				format(tbtext, sizeof(tbtext),
				"{FFFFFF}Создать актера и указать скин\n"\
				"Сменить индекс\n"\
				"Назначить анимацию\n"\
				"Сделать актера бессмертным\n"\
				"Переместить актера\n"\
				"Повернуть актера лицом к игроку\n"\
				"{FF0000}Удалить актера\n");
				//"{FFFFFF}[>] Создать массовку\n");
			} else {
				format(tbtext, sizeof(tbtext),
				"{FFFFFF}Create actor and set skin\n"\
				"Change actor index\n"\
				"Set animation\n"\
				"Set actor invulnerable\n"\
				"Move actor\n"\
				"Rotate the actor to face the player\n"\
				"{FF0000}Remove actor\n");
				//"{FFFFFF}[>] Create crowd\n");
			}
			
			ShowPlayerDialog(playerid, DIALOG_ACTORS, DIALOG_STYLE_LIST,
			header, tbtext, "OK","Cancel");
		}
		case DIALOG_3DTEXTMENU:
		{
			new tbtext[450];
			if(GetPVarInt(playerid, "lang") == 0)
			{	
				format(tbtext, sizeof(tbtext),
				"Создать 3DText\t\n"\
				"Индекс\t%i\n"\
				"Изменить текст\t%s\n"\
				"Изменить цвет\t\n"\
				"Изменить дистанцию\t%.1f\n"\
				"Изменить позицию\t\n"\
				"{FF0000}Удалить 3Dtext\t\n"\
				"Экспортировать в filterscript\t\n",
				CurrentIndex3dText, 
				Text3dArray[CurrentIndex3dText][Text3Dvalue],
				Text3dArray[CurrentIndex3dText][Text3Dcolor],
				Text3dArray[CurrentIndex3dText][Text3Ddistance]
				);
			} else {
				format(tbtext, sizeof(tbtext),
				"Create 3DText\t\n"\
				"Index\t%i\n"\
				"Change text\t%s\n"\
				"Change color\t\n"\
				"Change distance\t%.1f\n"\
				"Change Position\t\n"\
				"{FF0000}Delete 3Dtext\t\n"\
				"Export to filterscript\t\n",
				CurrentIndex3dText, 
				Text3dArray[CurrentIndex3dText][Text3Dvalue],
				Text3dArray[CurrentIndex3dText][Text3Dcolor],
				Text3dArray[CurrentIndex3dText][Text3Ddistance]);
			}
			ShowPlayerDialog(playerid, DIALOG_3DTEXTMENU, DIALOG_STYLE_TABLIST,
			"[3D TEXT]",tbtext, "OK","Cancel");
		}
		case DIALOG_VEHICLE:
		{
			new tbtext[450];
			new header[64];
			
			if(EDIT_VEHICLE_ID[playerid] > -1)
			{
				format(header, sizeof header, "[VEHICLE] vehicleid:%i model:%i",
				EDIT_VEHICLE_ID[playerid], GetVehicleModel(EDIT_VEHICLE_ID[playerid]));
			} else {
				format(header, sizeof header, "[VEHICLE]");
			}
			
			if(GetPVarInt(playerid, "lang") == 0)
			{		
				format(tbtext, sizeof(tbtext),
				"Выбрать машину для редактирования\t{00FF00}/avsel\n"\
				"Тестовый автомобиль\t{00FF00}/v\n"\
				"Создать новую машину\t{00FF00}/avnewcar\n"\
				"Копировать машину\t{00FF00}/avclonecar\n"\
				"{FF0000}Удалить машину\t{FF0000}/avdeletecar\n"\
				"Установить точку спавна\t{00FF00}/avsetspawn\n"\
				"Экспорт выбранной машины\t{00FF00}/avexport\n"\
				"Зареспавнить весь транспорт\t\n"\
				"[>] Тюнинг\t\n"\
				"[>] Специальные возможности\t\n"\
				"[>] Настройки\t\n");
			} else {
				format(tbtext, sizeof(tbtext),
				"Select vehicle\t{00FF00}/avsel\n"\
				"Test vehicle\t{00FF00}/v\n"\
				"Create new vehicle\t{00FF00}/avnewcar\n"\
				"Clone vehicle\t{00FF00}/avclonecar\n"\
				"{FF0000}Delete vehicle\t{FF0000}/avdeletecar\n"\
				"Set spawn place\t{00FF00}/avsetspawn\n"\
				"Export selected vehicle\t{00FF00}/avexport\n"\
				"Respawn all vehicles\t\n"\
				"[>] Tuning\t\n"\
				"[>] Special abilities\t\n"\
				"[>] Settings\t\n");
			}

			ShowPlayerDialog(playerid, DIALOG_VEHICLE, DIALOG_STYLE_TABLIST,
			header, tbtext, "OK","Cancel");
		}
		case DIALOG_MAPMENU:
		{
			new tbtext[500];
			
			if(GetPVarInt(playerid, "lang") == 0)
			{		
				format(tbtext, sizeof(tbtext),	
				"Загрузить карту\t{00FF00}/loadmap\n"\
				"Создать карту\t{00FF00}/newmap\n"\
				"Переименовать карту\t{00FF00}/renamemap\n"\
				"Импортировать объекты из файла\t{00FF00}/importmap\n"\
				"Экспортировать карту\t{00FF00}/export\n"\
				"Экспортировать весь транспорт\t{00FF00}/avexportall\n"\
				"Показать стандартные объекты на карте\t{800080}/gtaobjects\n"\
				"Управление prefab\t{00FF00}/prefab\n"\
				"Добавить все объекты в группу\t{00FF00}/gall\n"\
				"Добавить mapicon на карту\t\n"\
				"Сохранить координаты\t\n"\
				"Лимиты\t\n"\
				"{FF0000}Удалить карту\t{FF0000}/deletemap\n");
			} else {
				format(tbtext, sizeof(tbtext),	
				"Load map\t{00FF00}/loadmap\n"\
				"New map\t{00FF00}/newmap\n"\
				"Rename map\t{00FF00}/renamemap\n"\
				"Import object from file\t{00FF00}/importmap\n"\
				"Export map\t{00FF00}/export\n"\
				"Export all vehicles\t{00FF00}/avexportall\n"\
				"Show default objects on map\t{800080}/gtaobjects\n"\
				"Manage prefab\t{00FF00}/prefab\n"\
				"Add all objects to group\t{00FF00}/gall\n"\
				"Add mapicon\t\n"\
				"Save coords\t\n"\
				"Limits\t\n"\
				"{FF0000}Delete map\t{FF0000}/deletemap\n");
			}
			
			ShowPlayerDialog(playerid, DIALOG_MAPMENU, DIALOG_STYLE_TABLIST,
			"[MAP]",tbtext, "OK","Cancel");
		}
		case DIALOG_PREFABMENU:
		{
			new tbtext[250];
	
			if(GetPVarInt(playerid, "lang") == 0)
			{		
				format(tbtext, sizeof(tbtext),	
				"Экспорт группы объектов в загружаемый файл префаба \t{00FF00}/gprefab\n"\
				"Установить смещение загрузки файла префаба \t{00FF00}/prefabsetz\n"\
				"Показать все префабы \t{00FF00}/prefab\n");
			} else {
				format(tbtext, sizeof(tbtext),	
				"Export a group of objects to a loadable prefab file\t{00FF00}/gprefab\n"\
				"Set the load offset of a prefab file\t{00FF00}/prefabsetz\n"\
				"Show all prefabs\t{00FF00}/prefab\n");
			}
			
			ShowPlayerDialog(playerid, DIALOG_PREFABMENU, DIALOG_STYLE_TABLIST,
			"[PREFAB]",tbtext, "OK","Cancel");
		}
		case DIALOG_MAPINFO:
		{
			#if defined FM_DIR
			new dir:dHandle = dir_open("./scriptfiles/tstudio/SavedMaps/");
			new tbtext[450], buf[20], item[40], type;
			format(tbtext, sizeof tbtext, "{FFFFFF}");
			
			while(dir_list(dHandle, item, type))
			{
				if(type == FM_FILE) 
				{
					format(buf, sizeof buf, "%s\n", item);
					strcat(tbtext, buf);
				}
			}
			dir_close(dHandle);
			
			ShowPlayerDialog(playerid, DIALOG_MAPINFO, DIALOG_STYLE_LIST,
			"[MAP INFO]", tbtext, "Select","Cancel");
			#else
			ShowPlayerDialog(playerid, DIALOG_MAPINFO, DIALOG_STYLE_MSGBOX,
			"[MAP INFO]", "Error: Need filemanager plugin to run this func",
			"Select","Cancel");
			#endif
		}
		case DIALOG_CAMSET:
		{
			new tbtext[500];
			new Firstperson_st[16], dashcam_st[16];
			
			if(GetPVarInt(playerid,"Firstperson") == 1)
			Firstperson_st = "{00FF00}[ON]"; else Firstperson_st = "{FF0000}[OFF]";
			if(GetPVarInt(playerid,"DashCam") == 1)
			dashcam_st = "{00FF00}[ON]"; else dashcam_st = "{FF0000}[OFF]";
			
			if(GetPVarInt(playerid, "lang") == 1)
			{		
				format(tbtext, sizeof(tbtext),
				"Flycam\t{FFFF00}/flymode\n"\
				"First person cam\t%s\n"\
				"Take a photocamera\t{FFFF00}/camera\n"\
				"Hide all textdraws\t{FFFF00}/hud\n"\
				"Police dash cam\t%s\n"\
				"[>] Camera position\t\n"\
				"[>] Camera speed\t\n"\
				"[>] Interpolate camera\t\n",
				Firstperson_st, dashcam_st);
			} else {
				format(tbtext, sizeof(tbtext),
				"Полет камерой\t{FFFF00}/flymode\n"\
				"Вид от первого лица\t%s\n"\
				"Взять фотоаппарат\t{FFFF00}/camera\n"\
				"Спрятать все текстдравы\t{FFFF00}/hud\n"\
				"Режим полицейской камеры\t%s\n"\
				"[>] Позиция камеры\t\n"\
				"[>] Скорость перемещения камеры\t\n"\
				"[>] Интерполяция камеры\t\n",
				Firstperson_st, dashcam_st);
			}
			
			ShowPlayerDialog(playerid, DIALOG_CAMSET, DIALOG_STYLE_TABLIST,
			"[CAMSET]",tbtext, "OK","Cancel");
		}
		case DIALOG_CAMINTERPOLATE:
		{
			#if defined TEXTURE_STUDIO
			if(GetPlayerState(playerid) != PLAYER_STATE_SPECTATING)
			{
				CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/flymode");
			}
			#endif
			if (GetPVarInt(playerid, "lang") == 0)
			{
				ShowPlayerDialog(playerid, DIALOG_CAMINTERPOLATE, DIALOG_STYLE_LIST,
				"[CAM] - Interpolate", 
				"Установить точку\nСкорость перемещения\nПредпросмотр\n\
				Добавить описание\nЭкспорт в filterscript",
				"Select", "Cancel");
			} else {
				ShowPlayerDialog(playerid, DIALOG_CAMINTERPOLATE, DIALOG_STYLE_LIST,
				"[CAM] - Interpolate", 
				"Set cam point\nMove speed\nPreview\n\
				Add description\nExport to filterscript",
				"Select", "Cancel");
			}
		}
		case DIALOG_SETTINGS:
		{
			new tbtext[420];
			new 
				Lang_st[48]
			;
			
			if(GetPVarInt(playerid,"lang") == 1) 
			Lang_st = "{ffffff}[English]"; else Lang_st = "{ffffff}[Ru{3A5FCD}ssi{ff0000}an]";

			if(GetPVarInt(playerid, "lang") == 1)
			{		
				format(tbtext, sizeof(tbtext),
				"[>] Interface\t\n"\
				"{A9A9A9}[>] HotKeys\t\n"\
				"[>] Vehicles settings\t\n"\
				"{A9A9A9}[>] Bindeditor\t\n"\
				"[>] Flymode settings\t\n"\
				"Language\t%s\n"\
				"Change skin\t{00FF00}%i\n"\
				"Weather\t{00FF00}%i\n"\
				"Time\t{00FF00}%i\n"\
				"Gravity\t{00FF00}%.3f\n"\
				"Interior\t{00FF00}%i\n"\
				"World\t{00FF00}%i\n",
				Lang_st, GetPlayerSkin(playerid), GetPVarInt(playerid,"Weather"),
				GetPVarInt(playerid,"Hour"), GetGravity(),
				 GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid));
			} else {
				format(tbtext, sizeof(tbtext),
				"[>] Интерфейс\t\n"\
				"{A9A9A9}[>] Горячие клавиши\t\n"\
				"[>] Настройки транспорта\t\n"\
				"{A9A9A9}[>] Bind редактор\t\n"\
				"[>] Настройки режима полета\t\n"\
				"Язык\t%s\n"\
				"Сменить скин\t{00FF00}%i\n"\
				"Погода\t{00FF00}%i\n"\
				"Время\t{00FF00}%i\n"\
				"Гравитация\t{00FF00}%.3f\n"\
				"Интерьер\t{00FF00}%i\n"\
				"Виртуальный мир\t{00FF00}%i\n",
				Lang_st, GetPlayerSkin(playerid), GetPVarInt(playerid,"Weather"),
				GetPVarInt(playerid,"Hour"), GetGravity(),
				GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid));
			}
			ShowPlayerDialog(playerid, DIALOG_SETTINGS, DIALOG_STYLE_TABLIST,
			"[SETTINGS]",tbtext, "Select","Cancel");
		}
		case DIALOG_FLYMODESETTINGS:
		{
			new tbtext[300];
			new AIMTD_st[16], TargetInfo_st[16];
			
			if(aimPoint) 
			AIMTD_st = "{00FF00}[ON]"; else AIMTD_st = "{FF0000}[OFF]";
			if(targetInfo) 
			TargetInfo_st = "{00FF00}[ON]"; else TargetInfo_st = "{FF0000}[OFF]";

			if (GetPVarInt(playerid, "lang") == 0)
			{
				format(tbtext, sizeof(tbtext),
				"Точка по центру экрана в полете\t%s\n\
				Информация о объектах и транспорте в режиме полета\t%s\n\
				установить максимальную скорость в режиме полета\t{00FF00}/fmspeed\n\
				установить ускорение в режиме полета\t{00FF00}/fmaccel\n\
				вкл-откл ускорение в режиме полета\t{00FF00}/fmtoggle\n",
				AIMTD_st,TargetInfo_st);
			} else {
				format(tbtext, sizeof(tbtext),
				"Point in the center of the screen in flight\t%s\n\
				Information about objects and vehicles in flymode\t%s\n\
				set max speed in flymode\t{00FF00}/fmspeed\n\
				set acceleration in flymode\t{00FF00}/fmaccel\n\
				toggle acceleration in flymode\t{00FF00}/fmtoggle\n",
				AIMTD_st,TargetInfo_st);
			}
			
			ShowPlayerDialog(playerid, DIALOG_FLYMODESETTINGS, DIALOG_STYLE_TABLIST,
			"[CAM] - Flymode settings",tbtext, "Select","Cancel");
		}
		case DIALOG_KEYBINDS:
		{
			new tbtext[400];
			new 
				SuperJump_st[16], FastMove_st[16],
				bindFkeyToFlymode_st[16], mainMenuKeyCode_st[16],
				cSelector_st[16]
			;
			
			if(superJump) 
			SuperJump_st = "{00FF00}[ON]"; else SuperJump_st = "{FF0000}[OFF]";
			if(useFastMove) 
			FastMove_st = "{00FF00}[ON]"; else FastMove_st = "{FF0000}[OFF]";
			if(bindFkeyToFlymode)
			bindFkeyToFlymode_st = "{00FF00}[ON]"; else bindFkeyToFlymode_st = "{FF0000}[OFF]";
			if(cSelector) 
			cSelector_st = "{00FF00}[ON]"; else cSelector_st = "{FF0000}[OFF]";
			switch(mainMenuKeyCode)
			{
				case 1024: mainMenuKeyCode_st = "{00FF00}< ALT >";
				case 65536: mainMenuKeyCode_st = "{00FF00}< Y >";
				case 131072: mainMenuKeyCode_st = "{00FF00}< N >";
				case 262144: mainMenuKeyCode_st = "{00FF00}< H >";
				case 320: mainMenuKeyCode_st = "{00FF00}< MMB >";
			}
			
			if(GetPVarInt(playerid, "lang") == 1)
			{		
				format(tbtext, sizeof(tbtext),
				"Flymode mode at <F>\t%s\n\
				Main menu hotkey\t%s\n\
				SuperJump\t%s\n\
				Fast move\t%s\n\
				Select object at <C>\t%s\n",
				bindFkeyToFlymode_st, mainMenuKeyCode_st,
				SuperJump_st, FastMove_st, cSelector_st);
			} else {
				format(tbtext, sizeof(tbtext),
				"Режим полета на <F>\t%s\n\
				Вызов главного меню на клавишу\t%s\n\
				Cупер прыжок\t%s\n\
				Быстрое перемещение\t%s\n\
				Выбор объекта на <C>\t%s\n",
				bindFkeyToFlymode_st, mainMenuKeyCode_st,
				SuperJump_st, FastMove_st, cSelector_st);
			}
			
			ShowPlayerDialog(playerid, DIALOG_KEYBINDS, DIALOG_STYLE_TABLIST,
			"Keybinds",tbtext, "Select","Cancel");
		}
		case DIALOG_INTERFACE_SETTINGS:
		{
			new tbtext[650];
			new 
				StreamedObjectsTD_st[16], fpsBarTD_st[16],
				autoLoadMap_st[16], showEditMenu_st[16]
			;
			
			if(streamedObjectsTD) 
			StreamedObjectsTD_st = "{00FF00}[ON]"; else StreamedObjectsTD_st = "{FF0000}[OFF]";
			if(fpsBarTD) 
			fpsBarTD_st = "{00FF00}[ON]"; else fpsBarTD_st = "{FF0000}[OFF]";
			if(autoLoadMap)
			autoLoadMap_st = "{00FF00}[ON]"; else autoLoadMap_st = "{FF0000}[OFF]";
			if(showEditMenu)
			showEditMenu_st = "{00FF00}[ON]"; else showEditMenu_st = "{FF0000}[OFF]";
		
			if(GetPVarInt(playerid, "lang") == 1)
			{		
				format(tbtext, sizeof(tbtext),
				"Streamed objects counter TD\t%s\n"\
				"Information about the current position\t(/position)\n"\
				"Editor 3dtext settings\t(/edittext3d)\n"\
				"Show 3d text on objects\t/objtext3d\n"\
				"Show FPS under the radar\t%s\n"\
				"Show map loading window at login\t%s\n"\
				"Show EditMenu when editing object\t%s\n",
				StreamedObjectsTD_st, fpsBarTD_st,
				 autoLoadMap_st, showEditMenu_st);
			} else {
				format(tbtext, sizeof(tbtext),
				"TD подсчета объектов в области стрима\t%s\n"\
				"Информация о текущей позиции\t/position\n"\
				"Настройки 3d текста на объектах\t/edittext3d\n"\
				"Показывать 3d текст на объектах\t/objtext3d\n"\
				"Показывать FPS под радаром\t%s\n"\
				"Показывать окно загрузки карты при входе\t%s\n"\
				"Показывать EditMenu при редактировании объекта\t%s\n",
				StreamedObjectsTD_st, fpsBarTD_st,
				autoLoadMap_st, showEditMenu_st);
			}
			
			ShowPlayerDialog(playerid, DIALOG_INTERFACE_SETTINGS, DIALOG_STYLE_TABLIST,
			"[SETTINGS - Interface]",tbtext, "Select","Cancel");
		}
		case DIALOG_VEHSETTINGS:
		{
			new //menu states
				tbtext[550], useNOS_st[18], useAutoFixveh_st[18],
				useBoost_st[18], vecol_st[18], useAutoTune_st[18],
				useFlip_st[18], autoremveh_st[18]
			;
			
			if(useBoost) useBoost_st = "{00FF00}[ON]";
			else useBoost_st = "{FF0000}[OFF]";
			
			if(useNOS) useNOS_st = "{00FF00}[ON]";
			else useNOS_st = "{FF0000}[OFF]";
			
			if(useAutoFixveh) useAutoFixveh_st = "{00FF00}[ON]";
			else useAutoFixveh_st = "{FF0000}[OFF]";
			
			if(useAutoTune) useAutoTune_st = "{00FF00}[ON]";
			else useAutoTune_st = "{FF0000}[OFF]";
			
			if(useFlip) useFlip_st = "{00FF00}[ON]";
			else useFlip_st = "{FF0000}[OFF]";
			
			if(removePlayerVehicleOnExit) autoremveh_st = "{00FF00}[ON]";
			else autoremveh_st = "{FF0000}[OFF]";
			
			if(vehCollision) 
			vecol_st = "{00FF00}[ON]"; else vecol_st = "{FF0000}[OFF]";
			
			if(GetPVarInt(playerid, "lang") == 0)
			{		
				format(tbtext, sizeof(tbtext),
				"Speed Boost\t%s\n"\
				"Автопополение Nos\t%s\n"\
				"Автопочинка\t%s\n"\
				"Автотюнинг (Клавиша 2)\t%s\n"\
				"Поставить транспорт на колеса (Клавиша H)\t%s\n"\
				"Коллизия транспорта\t%s\n"\
				"Удалять транспорт игрока при выходе из машины\t%s\n",
				useBoost_st, useNOS_st, useAutoFixveh_st, useAutoTune_st,
				useFlip_st, vecol_st, autoremveh_st);
			} else {
				format(tbtext, sizeof(tbtext),
				"Speed Boost\t%s\n"\
				"Autorefill Nos\t%s\n"\
				"Autofix\t%s\n"\
				"Auto Tuning (Key 2)\t%s\n"\
				"Put transport on wheels (Key H)\t%s\n"\
				"Vehicle Collision\t%s\n"\
				"Remove player vehice on exit\t%s\n",
				useBoost_st, useNOS_st, useAutoFixveh_st, useAutoTune_st,
				useFlip_st, vecol_st, autoremveh_st);
			}
			
			ShowPlayerDialog(playerid, DIALOG_VEHSETTINGS, DIALOG_STYLE_TABLIST, 
			"[VEHICLE - Settings]",tbtext, "OK","Cancel");
		}
		case DIALOG_ROTATION:
		{
			new tbtext[300];
			new Float:RotX,Float:RotY,Float:RotZ;
			GetDynamicObjectRot(EDIT_OBJECT_ID[playerid], RotX, RotY, RotZ);
			
			format(tbtext, sizeof(tbtext),
			"Auto rotation\t/arot\n\
			{3f70d6}/Rx \t %.2f\n\
			{e0364e}/Ry \t %.2f\n\
			{26b85d}/Rz \t %.2f\n\
			Set anchor point\t{00FF00}/pivot\n\
			Turn on/off pivot rotation\t{00FF00}/togpivot\n\
			Reset object rotation\t{FF0000}/rotreset\n\
			Basic movement commands\n", RotX, RotY, RotZ);
			
			ShowPlayerDialog(playerid, DIALOG_ROTATION, DIALOG_STYLE_TABLIST,
			"[EDIT - Rotate]",tbtext, "OK","Cancel");
		}
		case DIALOG_ROTSET:
		{
			ShowPlayerDialog(playerid, DIALOG_ROTSET, DIALOG_STYLE_INPUT,
			"[EDIT - Rotate]",
			"Enter a value by how many degrees to rotate the object:",
			"OK","Cancel");
		}
		case DIALOG_WEAPONS:
		{
			new tbtext[300];
			if(GetPVarInt(playerid, "lang") == 0)
			{		
				format(tbtext, sizeof(tbtext),
				"Холодное\n\
				Пистолеты\n\
				Дробовики\n\
				Пулеметы\n\
				Штурмовые\n\
				Винтовки\n\
				Тяжелое\n\
				Гранаты\n\
				Ручное\n\
				{FF0000}Сбросить все{FFFFFF}");
			} else {
				format(tbtext, sizeof(tbtext),
				"Melee\n\
				Pistols\n\
				Shotguns\n\
				Sub-machine guns\n\
				Assault\n\
				Rifles\n\
				Heavy weapons\n\
				Grenades\n\
				Hand held\n\
				{FF0000}Reset weapons{FFFFFF}");
			}
			ShowPlayerDialog(playerid, DIALOG_WEAPONS, DIALOG_STYLE_LIST,
			"Weapons list", tbtext, "Select", "Cancel");
		}
		case DIALOG_ENVIRONMENT:
		{
			ShowPlayerDialog(playerid, DIALOG_ENVIRONMENT, DIALOG_STYLE_TABLIST,
			"[CAM] - Environment", 
			"Night vision\tNight vision toggles\n\
			Thermal vision\tThermal vision like Predator\n\
			Matrix\tAltered gravity and green weather\n\
			Realistic physic\tVery plausible gravity\n\
			Open space\tDarkness and no gravity\n\
			Slow-Mo\tSlow moving\n\
			Autotime\tAuto change ingame time\n\
			[>] Weather presets\tWeather and time presets for photo\n\
			{ff0000}Default",
			"Select", "Cancel");
		}
		case DIALOG_AUTOTIME:
		{
			if(GetPVarInt(playerid, "lang") == 0)
			{
				ShowPlayerDialog(playerid, DIALOG_AUTOTIME, DIALOG_STYLE_INPUT,
				"Autotime /autotime",
				"Функция автоматической смены игрового времени.\n\
				Укажите промежток через который игровое время будет сдвигаться на 1 час.\n\
				Введите время в секундах:",
				"Select", "Cancel");
			} else {
				ShowPlayerDialog(playerid, DIALOG_AUTOTIME, DIALOG_STYLE_INPUT,
				"Autotime /autotime",
				"Function to automatically change game time.\n\
				Specify the interval through which the game time will be shifted by 1 hour.\n\
				Enter the time in seconds:",
				"Select", "Cancel");
			}
		}
		case DIALOG_VAE:
		{
			new tbtext[500];
			new header[64];
			
			if(VaeData[playerid][objmodel] != -1)
			{
				format(header, sizeof(header),"[VAE] - Vehicle Attachments Editor - modelid: %i",
				VaeData[playerid][objmodel]);
			}
			else format(header, sizeof(header),"[VAE] - Vehicle Attachments Editor");
			
			if(GetPVarInt(playerid, "lang") == 1)
			{		
				format(tbtext, sizeof(tbtext),
				"Change model\t{00FF00}/vaemodel\n"\
				"adjustment X\t%.2f\n"\
				"adjustment Y\t%.2f\n"\
				"adjustment Z\t%.2f\n"\
				"adjustment RX\t%.2f\n"\
				"adjustment RY\t%.2f\n"\
				"adjustment RZ\t%.2f\n"\
				"Reset XYZ and adjustment\t\n"\
				"Freeze-Unfreeze\t{00FF00}/freeze\n"\
				"Stop edit\t{00FF00}/vaestop\n"\
				"Save\t{00FF00}/vaesave\n",
				VaeData[playerid][OffSetX], VaeData[playerid][OffSetY], VaeData[playerid][OffSetZ],
				VaeData[playerid][OffSetRX], VaeData[playerid][OffSetRY], VaeData[playerid][OffSetRZ]);
			} else {
				format(tbtext, sizeof(tbtext),
				"Изменить модель\t{00FF00}/vaemodel\n"\
				"Регулировка оси X\t%.2f\n"\
				"Регулировка оси Y\t%.2f\n"\
				"Регулировка оси Z\t%.2f\n"\
				"Регулировка оси RX\t%.2f\n"\
				"Регулировка оси RY\t%.2f\n"\
				"Регулировка оси RZ\t%.2f\n"\
				"Сбросить XYZ и Оси\t\n"\
				"Заморозить-Разморозить\t{00FF00}/freeze\n"\
				"Закончить редактирование\t{00FF00}/vaestop\n"\
				"Сохранить\t{00FF00}/vaesave\n",
				VaeData[playerid][OffSetX], VaeData[playerid][OffSetY], VaeData[playerid][OffSetZ],
				VaeData[playerid][OffSetRX], VaeData[playerid][OffSetRY], VaeData[playerid][OffSetRZ]);
			}
			
			ShowPlayerDialog(playerid, DIALOG_VAE, DIALOG_STYLE_TABLIST, 
			header,tbtext, "Select","Cancel");
		}
		case DIALOG_CMDS:
		{
			ShowPlayerDialog(playerid, DIALOG_CMDS, DIALOG_STYLE_MSGBOX, "CMDS", 
			"{FFD700}Basic commands:\n"\
			"{FFFFFF}/time, /weather, /day, /night, /hud\n"\
			"{FFD700}Position commands:\n"\
			"{FFFFFF}/respawn, /freeze, /unfreeze, /cpos, /spos, /lpos\n"\
			"{FFD700}Editor commands:\n"\
			"{FFFFFF}/map, /oadd, /rot [rx] [ry] [rz], /pos [ox] [oy] [oz]\n"\
			"{FFD700}Special commands:\n"\
			"{FFFFFF}/jetpack, fly, /jump, /dive, /unbug\n"\
			"{FFD700}Vehicle commands:\n"\
			"{FFFFFF}/v, /veh, /vae, /flip, /fix\n"\
			"{FFD700}Camera commands:\n"\
			"{FFFFFF}/cam, /fixcam, /flymode, /slowmo\n"\
			"{FFFFFF}\nPress Y to open Main menu or use: /mtools\n",
			"OK","Cancel");
		}
		case DIALOG_TPLIST:
		{
			#if defined UGMP_INCLUDED
			ShowPlayerDialog(playerid, DIALOG_TPLIST, DIALOG_STYLE_LIST,
			"Teleports", 
			"{FFD700}Los-Santos\n\
			{FFD700}San Fierro\n\
			{FFD700}Las-Venturas\n\
			{FFD700}Vice City\n\
			{FFD700}Liberty City\n\
			{FFD700}Bullworth\n",
			"OK","Cancel");
			#else 
			ShowPlayerDialog(playerid, DIALOG_TPLIST, DIALOG_STYLE_LIST,
			"Teleports", 
			"{F8F8FF}Los-Santos\n\
			{A9A9A9}San Fierro\n\
			{F8F8FF}Las-Venturas\n\
			{A9A9A9}Tierra Robada\n\
			{F8F8FF}Bone Country\n\
			{A9A9A9}Flint Country\n\
			{F8F8FF}Red Country\n\
			{A9A9A9}Whetstone\n",
			"OK","Cancel");
			#endif
		}
	}
	return 1;
}

//==================================[STOCKS]====================================
stock GetDirectionInWhichPlayerLooks(playerid, Float:facing_angle = -1.0)
{
    static const
        Float: side_of_the_world = 20.0,//(0.0 - 45.0)
        Float: coord_indent = 0.1;

    new const
        Float: north_coord_min = 360.0-side_of_the_world,
        Float: north_coord_max = 0.0+side_of_the_world,

        Float: west_coord_min = 90.0-side_of_the_world,
        Float: west_coord_max = 90.0+side_of_the_world,

        Float: south_coord_min = 180.0-side_of_the_world,
        Float: south_coord_max = 180.0+side_of_the_world,

        Float: east_coord_min = 280.0-side_of_the_world,
        Float: east_coord_max = 280.0+side_of_the_world;


    if(!floatcmp(facing_angle, -1.0))
        GetPlayerFacingAngle(playerid, facing_angle);
    else if(floatcmp(facing_angle, 0.0) == -1)
        facing_angle = 0.0;
    else if(floatcmp(facing_angle, 360.0) == 1)
        facing_angle = 360.0;

    if(north_coord_min <= facing_angle <= 360.0 || 0.0 <= facing_angle <= north_coord_max)
        return 0;
    else if(north_coord_max+coord_indent <= facing_angle <= west_coord_min-coord_indent)
        return 1;

    else if(west_coord_min <= facing_angle <= west_coord_max)
        return 2;
    else if(west_coord_max+coord_indent <= facing_angle <= south_coord_min-coord_indent)
        return 3;

    else if(south_coord_min <= facing_angle <= south_coord_max)
        return 4;
    else if(south_coord_max+coord_indent <= facing_angle <= east_coord_min-coord_indent)
        return 5;

    else if(east_coord_min <= facing_angle <= east_coord_max)
        return 6;
    else //if(east_coord_max+coord_indent <= facing_angle <= north_coord_min-coord_indent)
        return 7;
}

stock RotateAngle(Float: RotAngle)
{
	// Shit code. Modify later!!
	// an example of how you don't need to write code
	new a = floatround(RotAngle);
	if(a % 45 != 0)
	{
		if(a < 180)
		{
			if(a < 90) {
				if(a < 45) return 0;
				else return 45;
			} else {
				if(a < 135) return 90;
				else return 180;
			}
		} else {
			if(a < 270) {
				if(a < 225) return 180;
				else return 225;
			} else {
				if(a < 315) return 270;
				else return 0;
			}
		}
	}
	else return a;
}

stock AutoRotateObject(playerid, objectid)
{
	// Automatically selects an object rotation x/y/z angle multiple of 45
	new Float:RotX, Float:RotY, Float:RotZ, param[24];
	GetDynamicObjectRot(objectid, RotX, RotY, RotZ);
	RotX = RotateAngle(RotX);
	RotY = RotateAngle(RotY);
	RotZ = RotateAngle(RotZ);
	#if defined TEXTURE_STUDIO
	format(param, sizeof(param), "/ox %f", RotX);
	CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);
	format(param, sizeof(param), "/oy %f", RotY);
	CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);
	format(param, sizeof(param), "/oz %f", RotZ);
	CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);
	#else
	SetDynamicObjectRot(objectid, RotX, RotY, RotZ);
	#endif
}

stock GetClosestDynamicObject(playerid)
{
	new
		Float:px,
		Float:py,
		Float:pz,
		Float:ox,
		Float:oy,
		Float:oz,
		Float:dist,
		Float:check = 99999.9,
		result; 
	GetPlayerPos(playerid, px, py, pz); 
	for(new i; i < Streamer_GetUpperBound(STREAMER_TYPE_OBJECT); i++)
	{
		GetDynamicObjectPos(i, ox, oy, oz); 
		dist = floatsqroot(floatpower(floatabs(floatsub(px, ox)), 2) +
		floatpower(floatabs(floatsub(py, oy)), 2) + floatpower(floatabs(floatsub(pz, oz)), 2)); 
		if(dist < check)
		{
			check = dist;
			result = i;
		}
	}
	return result;
}

stock GetNearestVisibleItem(playerid,type)
{
	// 2019 Abyss Morgan. All rights reserved.
	// Website:  adm.ct8.pl
	// Download: adm.ct8.pl/r/download
	new Float:x, Float:y, Float:z, max_element, tmp_item, itemid = INVALID_STREAMER_ID,
		Float:min_radius = 20000.0, Float:distance, idx_max = 0, idx = 0;
	
	GetPlayerPos(playerid,x,y,z);
	idx_max = Streamer_CountVisibleItems(playerid,type,1);
	switch(type){
		case STREAMER_TYPE_OBJECT, STREAMER_TYPE_PICKUP, STREAMER_TYPE_MAP_ICON, STREAMER_TYPE_3D_TEXT_LABEL: {
			#if defined _new_streamer_included
			max_element = Streamer_GetVisibleItems(type,playerid);
			#else
			max_element = Streamer_GetVisibleItems(type);
			#endif
			while(idx <= max_element && idx_max > 0){
				if((tmp_item = Streamer_GetItemStreamerID(playerid,type,idx)) != INVALID_STREAMER_ID){
					idx_max--;
					Streamer_GetDistanceToItem(x,y,z,type,tmp_item,distance,3);
					if(distance < min_radius){
						itemid = tmp_item;
						min_radius = distance;
					}
				}
				idx++;
			}
		}
		
		default: return INVALID_STREAMER_ID;
	}
	return itemid;
}

//================================END STOCKS====================================

stock mCreatePickup(pickupid, playerid)
{
	// Custom pickup create function
	// Support legacy and streamer mode
	new nwPickup[126];
	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);

	#if defined _new_streamer_included
	// Example: CreateDynamicPickup(modelid, type, Float:x, Float:y, Float:z,
	//worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = 100.0);
	CreateDynamicPickup(pickupid, 1, X, Y, Z, -1, GetPlayerInterior(playerid), -1, STREAMER_PICKUP_SD);
	#else
	// Example: AddStaticPickup( 1242, 2, 1503.3359, 1432.3585, 10.1191, 0);
	AddStaticPickup(pickupid, 1, X, Y, Z, GetPlayerVirtualWorld(playerid));
	#endif

	new File:pickupstxt = fopen("mtools/Pickup.txt", io_append);
	format(nwPickup, sizeof nwPickup, "CreateDynamicPickup(%i, 2, %.2f, %.2f, %.2f, %i, %i, -1, 250, -1, 0);\r\n",
	pickupid, X, Y, Z, GetPlayerVirtualWorld(playerid),GetPlayerInterior(playerid));
	fwrite(pickupstxt, nwPickup);
	fclose(pickupstxt);

	SendClientMessageEx(playerid, -1,
	"Pickup был сохранен в папке {FFD700}scriptfiles > mtools > Pickups.txt",
	"Pickup saved at {FFD700}scriptfiles > mtools > Pickups.txt");
}

stock CreateDynamicObjectByModelid(playerid, modelid)
{
	new Float:playerpos[3];
	GetPlayerPos(playerid, playerpos[0], playerpos[1], playerpos[2]);
	new param[24];
	format(param, sizeof(param), "/cobject %d", modelid);
	#if defined TEXTURE_STUDIO
	CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);
	LAST_OBJECT_ID[playerid] = Streamer_GetUpperBound(STREAMER_TYPE_OBJECT) -1;
	#else
	new objectid = CreateDynamicObject(modelid, playerpos[0]+1, playerpos[1]+1, playerpos[2]+1,
	0.0, 0.0, 0.0, -1, -1, -1, 200.0);
	LAST_OBJECT_ID[playerid] = objectid;
	#endif
	/*
	if(originalcoords){
		id = CreateDynamicObject(modelid, playerpos[0]+1, playerpos[1]+1,
		playerpos[2]+1, 0.0,0.0,0.0, -1, -1, -1, 100.0);
	} else { 
		//id = CreateDynamicObject(modelid, playerpos[0]+1, playerpos[1]+1,
		playerpos[2]+3, 0.0,0.0,0.0, -1, -1, -1, 100.0);
		id = CreateDynamicObject(modelid, PX, PY, PZ, RX, RY, RZ, -1, -1, -1, 100.0);
	}
	if(reverse)	SetDynamicObjectRot(id, 0, 0, 180);
	
	if(id > DEF_MAX_OBJECTS){
		 return SendClientMessageToAll(COLOR_WHITE,"Ошибка при создании объекта, лимит объектов исчерпан!");
	}
	*/
	//EDIT_OBJECT_ID[playerid] = id;
	//LAST_OBJECT_ID[playerid] = id;
	
	//EditDynamicObject(playerid, id);
	//return EDIT_OBJECT_ID[playerid];
}

stock RemoveTempMapEditorFiles(playerid)
{
	// Remove Temp files from mtolls folder
	fremove("mtools/camdata.txt");
	fremove("mtools/Coords.txt");
	fremove("mtools/MapIcons.txt");
	fremove("mtools/3DText.txt");
	fremove("mtools/Pickup.txt");
	fremove("mtools/Attachments.txt");
	fremove("mtools/Vaeditions.txt");
	SendClientMessageEx(playerid, -1, "Временные файлы из {FFD700}scriptfiles/mtools{FFFFFF} очищены",
	"Temporary files from {FFD700}scriptfiles/mtools{FFFFFF} have been cleared");
}

stock GetPlayerCoords(playerid)
{
	// Send to chat current player position.
	new currentinterior = GetPlayerInterior(playerid);
	new currentworld = GetPlayerVirtualWorld(playerid);
	new coordinfo[144];
	new Float:x,Float:y,Float:z,Float:a;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, a);
	if (GetPVarInt(playerid, "lang") == 0) {
		format(coordinfo,sizeof(coordinfo),"Координаты: %f,%f,%f,%f", x, y, z, a);
	} else {
		format(coordinfo,sizeof(coordinfo),"OnFoot position: %f,%f,%f,%f", x, y, z, a);
	}
	SendClientMessage(playerid,-1,coordinfo);
	
	if (GetPVarInt(playerid, "lang") == 0) {
		format(coordinfo,sizeof(coordinfo),"Интерьер: %i, Виртуальный мир %i",
		currentinterior, currentworld);
	} else {
		format(coordinfo,sizeof(coordinfo),"Interior: %i, VirtualWorld %i",
		currentinterior, currentworld);
	}
	SendClientMessage(playerid,-1,coordinfo);
	
	if (GetPlayerVehicleID(playerid))
	{
		new currentveh;
		currentveh = GetPlayerVehicleID(playerid);
		new Float:vehx, Float:vehy, Float:vehz;
		GetVehiclePos(currentveh, vehx, vehy, vehz);
		new vehpostext[96];
		if (GetPVarInt(playerid, "lang") == 0) {
			format(vehpostext, sizeof(vehpostext),
			"Текущая позиция данного транспорта: %f, %f, %f", vehx, vehy, vehz);
		} else {
			format(vehpostext, sizeof(vehpostext),
			"The current position of this vehicle: %f, %f, %f", vehx, vehy, vehz);
		}
		SendClientMessage(playerid, -1, vehpostext);
	}
}

stock SaveCoords(playerid, wmode = 0)
{
	new Float:X,Float:Y,Float:Z,Float:ang;
	GetPlayerPos(playerid, X, Y, Z);
	GetPlayerFacingAngle(playerid, ang);
	new File:coord = fopen("mtools/Coords.txt", io_append);
	new nwCoords[126];
	if(wmode == 1) format(nwCoords, sizeof nwCoords, "( %f, %f, %f ),\r\n", X, Y, Z);
	else if(wmode == 2) format(nwCoords, sizeof nwCoords, "%f, %f, %f, %f\r\n", X, Y, Z, ang);
	else if(wmode == 3) format(nwCoords, sizeof nwCoords, "SetPlayerPosEx(playerid, %f, %f, %f, %f, %i, %i)\r\n",
	X, Y, Z, ang, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
	else if(wmode == 4){
		if(GetPVarFloat(playerid, "BoundsMaxX") == 0){
			SetPVarFloat(playerid, "BoundsMaxX", X);
			SetPVarFloat(playerid, "BoundsMaxY", Y);
			return SendClientMessage(playerid, -1, "Первая пара координат сохранена, переместитесь в противоположный угол");
		}
		if(GetPVarFloat(playerid, "BoundsMinX") == 0){
			SetPVarFloat(playerid, "BoundsMinX", X);
			SetPVarFloat(playerid, "BoundsMinY", Y);
			format(nwCoords, sizeof nwCoords, "SetPlayerWorldBounds(playerid, %f, %f, %f, %f);\r\n",
			GetPVarFloat(playerid, "BoundsMaxX"), GetPVarFloat(playerid, "BoundsMinX"),
			GetPVarFloat(playerid, "BoundsMaxY"), GetPVarFloat(playerid, "BoundsMinY"));
			SendClientMessage(playerid, -1, "Вторая пара координат сохранена.");
			DeletePVar(playerid, "BoundsMaxX");
			DeletePVar(playerid, "BoundsMinX");
			DeletePVar(playerid, "BoundsMaxY");
			DeletePVar(playerid, "BoundsMinY");
		} else {
			DeletePVar(playerid, "BoundsMaxX");
			DeletePVar(playerid, "BoundsMinX");
			DeletePVar(playerid, "BoundsMaxY");
			DeletePVar(playerid, "BoundsMinY");
		}
	}
	else format(nwCoords, sizeof nwCoords, "%f, %f, %f\r\n", X, Y, Z);
	fwrite(coord, nwCoords);
	fclose(coord);
	SendClientMessage(playerid, -1, "Координаты были сохранены в папке {FFD700}scriptfiles > mtools > Coords.txt");
	return 1;
}

stock IsPlayerInRangeOfObject(playerid, Float:range, objectid)
{
	if(IsValidObject(objectid) && IsPlayerConnected(playerid))
	{
		new Float:x, Float:y, Float:z; 
		GetDynamicObjectPos(objectid, x,y,z);
		if(IsPlayerInRangeOfPoint(playerid, range, x, y, z)) return 1;
		else return 0;
	}
}

stock IsPlayerInRangeOfAnyObject(playerid, Float:range)
{
	new tmpstr[64];
	for(new I = 0; I < MAX_OBJECTS; I++)
	{
		if(I != INVALID_OBJECT_ID){
			new Float:x, Float:y, Float:z; 
			GetDynamicObjectPos(I, x,y,z);
			format(tmpstr, sizeof tmpstr, "objectid: %i modelid: %i", I, GetDynamicObjectModel(I));
			if(IsPlayerInRangeOfPoint(playerid, range, x, y, z)) SendClientMessage(playerid, -1, tmpstr);
		}
	}
	return 0;
}

stock FindDuplicateObjects(playerid, modelid)
{
	// Find Duplicate Objects by modelid 
	MAX_VISIBLE_OBJECTS = Streamer_GetVisibleItems(STREAMER_TYPE_OBJECT);
	//printf("MAX_VISIBLE_OBJECTS: %i", MAX_VISIBLE_OBJECTS);
	
	enum tmpObjectsData
	{
		id, Float:ox, Float:oy, Float:oz
	}
	new objData[100][tmpObjectsData];
	new tmpstr[128];
	new FindedObjects = 1;
	// Collect data
	for(new i = 0; i < MAX_VISIBLE_OBJECTS; i++)
	{
		if(IsValidDynamicObject(i) && GetDynamicObjectModel(i) == modelid) 
		{
			objData[i][id] = i;
			GetDynamicObjectPos(i, objData[i][ox], objData[i][oy], objData[i][oz]);
			//printf("object: %i pos x:%f, y:%f, z:%f",i, objData[i][x], objData[i][y], objData[i][z]);
		}
	}
	for(new i = 0; i < sizeof(objData); i++)
	{
		for(new j = 1; j < sizeof(objData) && j !=i ; j++)
		{
			if(objData[i][ox] != 0.0 && objData[j][ox] != 0.0)
			{
				//if(objData[i][ox] == objData[j][ox] || objData[i][oy] == objData[j][oy])
				if(floatabs(objData[i][ox] - objData[j][ox]) <= 0.5 || 
				floatabs(objData[i][oy] - objData[j][oy]) <= 0.5)
				{
					format(tmpstr, sizeof(tmpstr), "duplicate object:%i pos x:%f, y:%f, z:%f",
					objData[i][id], objData[i][ox], objData[i][oy], objData[i][oz]);
					SendClientMessage(playerid, -1, tmpstr);
					format(tmpstr, sizeof(tmpstr), "duplicate object:%i pos x:%f, y:%f, z:%f",
					objData[j][id], objData[j][ox], objData[j][oy], objData[j][oz]);
					SendClientMessage(playerid, -1, tmpstr);
					FindedObjects++;
				}
			}
		}
	}
	format(tmpstr, sizeof(tmpstr), "find %i duplicate objects", FindedObjects);
	SendClientMessage(playerid, -1, tmpstr);
}

stock IsDuplicateObject(objectid, objectid2)
{
	if(IsValidDynamicObject(objectid) && IsValidDynamicObject(objectid2))
	{
		new 
			Float: x, Float: y, Float: z,
			//Float: rx, Float: ry, Float: rz,
			Float: x2, Float: y2, Float: z2,
			//Float: rx2, Float: ry2, Float: rz2
		;
		GetDynamicObjectPos(objectid, x, y, z);
		GetDynamicObjectPos(objectid2, x2, y2, z2);
		//GetDynamicObjectRot(objectid, rx, ry, rz);
		//GetDynamicObjectRot(objectid2, rx2, ry2, rz2);
		if(x == x2 && y == y2 && z == z2)
		{
			return 1;
		}
	}
	return 0;
}

stock LoadMapInfo(playerid, listitem)
{
	#if defined FM_DIR
	new dir:dHandle = dir_open("./scriptfiles/tstudio/SavedMaps/");
	new 
		version, lasttime, author[32], DB: mapDB,
		path[64], item[40], type, f_counter = -1,
		Float:spawnx, Float:spawny, Float:spawnz,
		interior, world, tbtext[300]
	;
	
	while(dir_list(dHandle, item, type))
	{
		if(type == FM_FILE) 
		{
			f_counter++;
			if(f_counter == listitem) {
				format(path, sizeof path, "tstudio/SavedMaps/%s", item);
				if(fexist(path)) 
				{
					mapDB = db_open(path);
					new DBResult:MapInfo;
					new field[64];
					MapInfo = db_query(mapDB, "SELECT * FROM Settings"); 
					db_get_field_assoc(MapInfo, "Version", field, 24);
					version = strval(field);
					db_get_field_assoc(MapInfo, "LastTime", field, 24);
					lasttime = strval(field);
					db_get_field_assoc(MapInfo, "Author", field, 24);
					format(author, sizeof author, "%s", field);
					db_get_field_assoc(MapInfo, "SpawnX", field, 24);
					spawnx = floatstr(field);
					db_get_field_assoc(MapInfo, "SpawnY", field, 24);
					spawny = floatstr(field);
					db_get_field_assoc(MapInfo, "SpawnZ", field, 24);
					spawnz = floatstr(field);
					db_get_field_assoc(MapInfo, "Interior", field, 24);
					interior = strval(field);
					db_get_field_assoc(MapInfo, "VirtualWorld", field, 24);
					world = strval(field);
					db_free_result(MapInfo);
					db_close(mapDB);
					
					format(tbtext, sizeof(tbtext),
					"{FFFFFF}Version: %i LastTime: %i\n\
					Author: %s Spawn:\n\
					x:%f, y:%f, z:%f\n\
					interior: %i, world: %i",
					version, lasttime, author, spawnx, spawny, spawnz, interior, world);
					ShowPlayerDialog(playerid, DIALOG_MAPINFO_RESULTS, DIALOG_STYLE_MSGBOX, 
					"Results", tbtext, "X","");
				} else {
					printf("path not found: %s", path);
				}
			}
		}
	}
	dir_close(dHandle);
	return f_counter;
	#else
	printf("Error: need filemanager plugin to run LoadMapInfo!  id:%d|listitem: %d",
	playerid, listitem);
	return 0;
	#endif	
}

public DeleteObjectsInRange(playerid, Float:range)
{
	for(new i = -1; i < MAX_OBJECTS; i++)
	{
		if(i != INVALID_OBJECT_ID)
		{
			new objectid = i-1;
			new Float:x, Float:y, Float:z; 
			GetDynamicObjectPos(objectid, x,y,z);
			if(IsPlayerInRangeOfPoint(playerid, range, x, y, z))
			{
				#if defined TEXTURE_STUDIO
				new param[24], param2[24];
				format(param, sizeof(param), "/sel %d", objectid);
				format(param2, sizeof(param2), "/dobject %d", objectid);
				CallRemoteFunction("OnPlayerCommandText", "is", playerid, param);	
				CallRemoteFunction("OnPlayerCommandText", "is", playerid, param2);	
				#else
				DestroyDynamicObject(objectid);
				#endif
			}
		}
	}
	return 0;
}

public SpawnNewVehicle(playerid, vehiclemodel) //spawn new veh by id
{
	// Spawn new vehicle for a player
	// Return: vehicleid
	//	if(IsApplyAnimation(playerid, "FALL_fall") return 0;
	if(vehiclemodel < 400 && vehiclemodel > 611) return 0;
	new Float:x,Float:y,Float:z,Float:ang;
	if(PlayerVehicle[playerid] != 0) DestroyVehicle(PlayerVehicle[playerid]);
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, ang);
	if (IsPlayerInAnyVehicle(playerid))
	{
		new CurrentVehID = GetPlayerVehicleID(playerid);
		DestroyVehicle(CurrentVehID);
	}
	PlayerVehicle[playerid] = CreateVehicle(vehiclemodel, x, y, z, ang, random(256), random(256), -1);
	new vehicleid = GetPlayerVehicleID(playerid);
	SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
	LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
	//if(GetPlayerInterior(playerid) != 0) SetVehicleToRespawn(vehicleid);
	PutPlayerInVehicle(playerid, PlayerVehicle[playerid], 0);
	SetVehicleZAngle(GetPlayerVehicleID(playerid),ang);
	return vehicleid;
}

public GetVehicleRotation(vehicleid,&Float:rx,&Float:ry,&Float:rz)
{
	//GetVehicleRotation Created by IllidanS4
	new Float:qw,Float:qx,Float:qy,Float:qz;
	GetVehicleRotationQuat(vehicleid,qw,qx,qy,qz);
	rx = asin(2*qy*qz-2*qx*qw);
	ry = -atan2(qx*qz+qy*qw,0.5-qx*qx-qy*qy);
	rz = -atan2(qx*qy+qz*qw,0.5-qx*qx-qz*qz);
}

public Surfly(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 1;
	new k, ud,lrk;
	GetPlayerKeys(playerid,k,ud,lrk);
	new Float:v_x,Float:v_y,Float:v_z,
		Float:x,Float:y,Float:z;
	if(ud < 0)	// forward
	{
		GetPlayerCameraFrontVector(playerid,x,y,z);
		v_x = x+0.1;
		v_y = y+0.1;
	}
	if(k & 128)	// down
		v_z = -0.4;
	else if(k & KEY_FIRE)	// up
		v_z = 0.2;
	if(k & KEY_WALK)	// slow
	{
		v_x /=5.0;
		v_y /=5.0;
		v_z /=5.0;
	}
	if(k & KEY_SPRINT)	// fast
	{
		v_x *=4.0;
		v_y *=4.0;
		v_z *=4.0;
	}
	if(v_z == 0.0) 
		v_z = 0.025;
	SetPlayerVelocity(playerid,v_x,v_y,v_z);
	if(v_x == 0 && v_y == 0)
	{	
		if(GetPlayerAnimationIndex(playerid) == 959)	
			ApplyAnimation(playerid,"PARACHUTE","PARA_steerR",6.1,1,1,1,1,0,1);
	}
	else 
	{
		GetPlayerCameraFrontVector(playerid,v_x,v_y,v_z);
		GetPlayerCameraPos(playerid,x,y,z);
		SetPlayerLookAt(playerid,v_x*500.0+x,v_y*500.0+y);
		if(GetPlayerAnimationIndex(playerid) != 959)
			ApplyAnimation(playerid,"PARACHUTE","FALL_SkyDive_Accel",6.1,1,1,1,1,0,1);
	}
	if(OnFly[playerid])
		SetTimerEx("Surfly",100,false,"i",playerid);
	return 1;
}

public SurflyMode(playerid)
{
	if(OnFly[playerid])
	{
		new Float:x,Float:y,Float:z;
		GetPlayerPos(playerid,x,y,z);
		SetPlayerPos(playerid,x,y,z);
		OnFly[playerid] = false;
	} else {
		OnFly[playerid] = true;
		new Float:x,Float:y,Float:z;
		GetPlayerPos(playerid,x,y,z);
		SetPlayerPos(playerid,x,y,z+5.0);
		ApplyAnimation(playerid,"PARACHUTE","PARA_steerR",6.1,1,1,1,1,0,1);
		Surfly(playerid);
		SendClientMessageEx(playerid, -1,
		"Вы перешли в режим полета (surfly). Управление:",
		"You have entered surfly mode. Controls:");
		SendClientMessageEx(playerid, -1,
		"{FF0000}Левая кнопка мыши (LMB){FFFFFF} - увеличить высоту",
		"{FF0000}Left Mouse Button (LMB){FFFFFF} - increase height");
		SendClientMessageEx(playerid, -1,
		"{FF0000}Правая кнопка мыши (RMB){FFFFFF} - уменьшить высоту",
		"{FF0000}Right Mouse Button (RMB){FFFFFF} - reduce height");
		SendClientMessageEx(playerid, -1,
		"{FF0000}Клавиша бега (KEY_SPRINT){FFFFFF} - ускорение",
		"{FF0000}Sprint key (KEY_SPRINT){FFFFFF} - accelerate");
		SendClientMessageEx(playerid, -1,
		"{FF0000}F / ЕNТЕR{FFFFFF} - выйти из режима полета",
		"{FF0000}F / ENTER{FFFFFF} - exit flight mode");
		/*GameTextForPlayer(playerid,
		"~r~~k~~PED_FIREWEAPON~~w~- increase height~n~\
		~r~RMB ~w~- reduce height~n~\
		~r~~k~~PED_SPRINT~ ~w~- increase speed~n~\
		~r~~k~~SNEAK_ABOUT~ ~w~- reduce speed",10000,3);*/
	}
	return 1;
}

public AutoTimeChange(playerid)
{
	// Steps forward one hour
	if(GetPVarInt(playerid,"Hour") < 23) {
		SetPVarInt(playerid,"Hour",GetPVarInt(playerid,"Hour")+1);
	} else {
		SetPVarInt(playerid,"Hour", 0);
	}
	SetPlayerTime(playerid,GetPVarInt(playerid,"Hour"),0); 
	return 1;
}

public FirstPersonMode(playerid)
{
	if(GetPVarInt(playerid, "Firstperson") == 0)
	{
		SendClientMessageEx(playerid, -1,
		"При движении в транспорте может неккоректно отображать окружение!",
		"When driving in transport, the environment may be displayed incorrectly!");
		firstperson[playerid] = CreateObject(19300, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
		AttachObjectToPlayer(firstperson[playerid],playerid, 0.0, 0.12, 0.7, 0.0, 0.0, 0.0);
		AttachCameraToObject(playerid, firstperson[playerid]);
		SetPVarInt(playerid, "Firstperson",1);
	} else {
		SendClientMessageEx(playerid, -1,
		"Вы отключили вид от 1-го лица", "You have disabled 1st person view");
		SetCameraBehindPlayer(playerid);
		DestroyObject(firstperson[playerid]);
		SetPVarInt(playerid, "Firstperson",0);
	}
	return 1;
}

public SetPlayerLookAt(playerid,Float:x,Float:y)
{
	new Float:Px, Float:Py, Float: Pa;
	GetPlayerPos(playerid, Px, Py, Pa);
	Pa = floatabs(atan((y-Py)/(x-Px)));
	if (x <= Px && y >= Py) 		Pa = floatsub(180.0, Pa);
	else if (x < Px && y < Py) 		Pa = floatadd(Pa, 180.0);
	else if (x >= Px && y <= Py)	Pa = floatsub(360.0, Pa);
	Pa = floatsub(Pa, 90.0);
	if (Pa >= 360.0) 
		Pa = floatsub(Pa, 360.0);
	SetPlayerFacingAngle(playerid, Pa);
	return;
}

public HideTexdrawMessage(playerid)
{
	SetSVarInt("ToggleTexdrawMessage", 0);
	PlayerTextDrawHide(playerid, TDmessage[playerid]);
	return 1;
}

public SendTexdrawMessage(playerid, hidedelay, text[])
{
	// Send textdraw message to Player
	// Autohide by HideTexdrawMessage
	if(GetSVarInt("ToggleTexdrawMessage") == 0)
	{
		SetSVarInt("ToggleTexdrawMessage", 1);
		PlayerTextDrawSetString(playerid, TDmessage[playerid], text);
		PlayerTextDrawShow(playerid, TDmessage[playerid]);
		SetTimerEx("HideTexdrawMessage", hidedelay, false, "d", playerid);
	}
	return 1;
}

stock Jump(playerid)
{
	// Jump forward
	new 
		Float:facing_angle,
		Float:adj = 4,
		Float:x, Float:y, Float:z,
		bool:useJetpack
	;
	if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USEJETPACK) useJetpack = true;
	GetPlayerFacingAngle(playerid, facing_angle);
	new LookAt = GetDirectionInWhichPlayerLooks(playerid, facing_angle);
	GetPlayerPos(playerid, x,y,z);
	switch(LookAt) 
	{
		case 0: SetPlayerPos(playerid,x,y+adj,z+1);
		case 1: SetPlayerPos(playerid,x-adj,y+adj,z+1);
		case 2: SetPlayerPos(playerid,x-adj,y,z+1);
		case 3: SetPlayerPos(playerid,x-adj,y-adj,z+1);
		case 4: SetPlayerPos(playerid,x,y-adj,z+1);
		case 5: SetPlayerPos(playerid,x+adj,y-adj,z+1);
		case 6: SetPlayerPos(playerid,x+adj,y,z+1);
		case 7: SetPlayerPos(playerid,x+adj,y+adj,z+1);
	}
	if(useJetpack) SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USEJETPACK);
}

stock PlayerName(playerid)
{
	// Return player login name
	new pName[MAX_PLAYER_NAME]; 
	GetPlayerName(playerid, pName, sizeof(pName));
	return pName;
}

stock GetPlayerSpeed(playerid, bool:kmh = true)
{
	// Return player move speed. This function using for anticheat system
	new Float:Vx,Float:Vy,Float:Vz,Float:rtn;
	if(IsPlayerInAnyVehicle(playerid)) GetVehicleVelocity(GetPlayerVehicleID(playerid),Vx,Vy,Vz);
	else GetPlayerVelocity(playerid,Vx,Vy,Vz);
	rtn = floatsqroot(floatabs(floatpower(Vx + Vy + Vz,2)));
	return kmh?floatround(rtn * 100 * 1.61):floatround(rtn * 100);
}

stock GetPlayerFPS(playerid)
{
	SetPVarInt(playerid, "DrunkL", GetPlayerDrunkLevel(playerid));
	if(GetPVarInt(playerid, "DrunkL") < 100){ 
		SetPlayerDrunkLevel(playerid, 2000);
	} else { 
		if(GetPVarInt(playerid, "LDrunkL") != GetPVarInt(playerid, "DrunkL")) 
		{
			SetPVarInt(playerid,"FPS",(GetPVarInt(playerid, "LDrunkL") - GetPVarInt(playerid, "DrunkL")));
			SetPVarInt(playerid, "LDrunkL", GetPVarInt(playerid, "DrunkL"));
			if((GetPVarInt(playerid, "FPS") > 0) && (GetPVarInt(playerid, "FPS") < 256)) {
				return GetPVarInt(playerid, "FPS") - 1;
			}
		}
	}
	return 0;
}

// Attach editor
ShowMainAttachEditMenu(playerid)
{
	new string[350];

	if (GetPVarInt(playerid, "lang") == 0)
	{
		format(string, sizeof(string),
		"Опция\tСтатус\n\
		Индекс \t(%d)\n\
		Объект \t(%d)\n\
		Кость \t(%d)\n\
		X-позиция \t(%.4f)\n\
		Y-позиция \t(%.4f)\n\
		Z-позиция \t(%.4f)\n\
		X-вращение \t(%.4f)\n\
		Y-вращение \t(%.4f)\n\
		Z-вращение \t(%.4f)\n\
		X-масштаб \t(%.4f)\n\
		Y-масштаб \t(%.4f)\n\
		Z-масштаб \t(%.4f)\n\
		Редактировать\t\n\
		{FF0000}Очистить{FFFFFF} этот индекс\t\n\
		Сохранить",
		gCurrentAttachIndex[playerid],
		gIndexModel[playerid][gCurrentAttachIndex[playerid]],
		gIndexBone[playerid][gCurrentAttachIndex[playerid]],
		gIndexPos[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_X],
		gIndexPos[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Y],
		gIndexPos[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Z],
		gIndexRot[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_X],
		gIndexRot[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Y],
		gIndexRot[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Z],
		gIndexSca[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_X],
		gIndexSca[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Y],
		gIndexSca[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Z]);
	} else {
		format(string, sizeof(string),
		"Index \t(%d) \n\
		Object \t(%d) \n\
		Bone \t(%d) \n\
		X position \t(%.4f) \n\
		Y position \t(%.4f) \n\
		Z position \t(%.4f) \n\
		X-rotation \t(%.4f) \n\
		Y-rotation \t(%.4f) \n\
		Z Rotation \t(%.4f) \n\
		X-scale \t(%.4f) \n\
		Y-scale \t(%.4f) \n\
		Z-scale \t(%.4f) \n\
		Edit \t\n\
		{FF0000}Clear{FFFFFF} this index \t\n\
		Save",
		gCurrentAttachIndex[playerid],
		gIndexModel[playerid][gCurrentAttachIndex[playerid]],
		gIndexBone[playerid][gCurrentAttachIndex[playerid]],
		gIndexPos[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_X],
		gIndexPos[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Y],
		gIndexPos[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Z],
		gIndexRot[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_X],
		gIndexRot[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Y],
		gIndexRot[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Z],
		gIndexSca[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_X],
		gIndexSca[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Y],
		gIndexSca[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Z]);
	}

	ShowPlayerDialog(playerid, DIALOG_PLAYERATTACHMAIN, DIALOG_STYLE_TABLIST,
	"Attachments editor", string, "OK", "Cancel");

	gEditingAttachments[playerid] = true;
}

ShowIndexList(playerid)
{
	new string[512];

	for(new i; i < MAX_PLAYER_ATTACHED_OBJECTS; i++)
	{
		if(IsPlayerAttachedObjectSlotUsed(playerid, i))
		{
			if (GetPVarInt(playerid, "lang") == 0)
			{
				if(gIndexUsed[playerid][i]) format(string, sizeof(string),"%sСлот %d (%s - %d)\n",
				string, i, AttachmentBones[gIndexBone[playerid][i]], gIndexModel[playerid][i]);
				else format(string, sizeof(string), "%sСлот %d (Внешний)\n", string, i);
			} else {
				if(gIndexUsed[playerid][i]) format(string, sizeof(string), "%sSlot %d (%s - %d)\n",
				string, i, AttachmentBonesEN[gIndexBone[playerid][i]], gIndexModel[playerid][i]);
				else format(string, sizeof(string), "%s Slot %d (External)\n", string, i);
			}
		}
		else format(string, sizeof(string), "%sSlot %d\n", string, i);
	}

	ShowPlayerDialog(playerid, DIALOG_ATPINDEX_SELECT, DIALOG_STYLE_LIST,
	"Attachments editor / Index", string, "OK", "Cancel");
}

ShowModelInput(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_ATPMODEL_SELECT, DIALOG_STYLE_INPUT,
	"Attachments editor / Object", "Введите объект для прикрепления", "OK", "Cancel");
}

ShowBoneList(playerid)
{
	new string[512];

	for(new i; i < sizeof(AttachmentBones); i++) 
	{
		if (GetPVarInt(playerid, "lang") == 0)
		{
			format(string, sizeof(string), "%s%s\n", string, AttachmentBones[i]);
		} else {
			format(string, sizeof(string), "%s%s\n", string, AttachmentBonesEN[i]);
		}
	}
	ShowPlayerDialog(playerid, DIALOG_ATPBONE_SELECT, DIALOG_STYLE_LIST,
	"Attachments editor / Bone", string, "OK", "Cancel");
}

EditAttachCoord(playerid, coord)
{
	gCurrentAxisEdit[playerid] = coord;
	ShowPlayerDialog(playerid, DIALOG_ATPCOORD_INPUT, DIALOG_STYLE_INPUT,
	"Attachments editor / Scale", "Введите float-точку для смещения:", "OK", "Cancel");
}

EditAttachment(playerid)
{
	SetPlayerAttachedObject(playerid,
	gCurrentAttachIndex[playerid],
	gIndexModel[playerid][gCurrentAttachIndex[playerid]],
	gIndexBone[playerid][gCurrentAttachIndex[playerid]],
	gIndexPos[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_X],
	gIndexPos[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Y],
	gIndexPos[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Z],
	gIndexRot[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_X],
	gIndexRot[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Y],
	gIndexRot[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Z],
	gIndexSca[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_X],
	gIndexSca[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Y],
	gIndexSca[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Z]);

	EditAttachedObject(playerid, gCurrentAttachIndex[playerid]);

	gIndexUsed[playerid][gCurrentAttachIndex[playerid]] = true;
}

ClearCurrentIndex(playerid)
{
	gIndexModel[playerid][gCurrentAttachIndex[playerid]] = 0;
	gIndexBone[playerid][gCurrentAttachIndex[playerid]] = 1;
	gIndexPos[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_X] = 0.0;
	gIndexPos[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Y] = 0.0;
	gIndexPos[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Z] = 0.0;
	gIndexRot[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_X] = 0.0;
	gIndexRot[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Y] = 0.0;
	gIndexRot[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Z] = 0.0;
	gIndexSca[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_X] = 0.0;
	gIndexSca[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Y] = 0.0;
	gIndexSca[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Z] = 0.0;
	gIndexUsed[playerid][gCurrentAttachIndex[playerid]] = false;

	RemovePlayerAttachedObject(playerid, gCurrentAttachIndex[playerid]);
	ShowMainAttachEditMenu(playerid);
}

SaveAttachedObjects(playerid)
{
	new str[256], File:file;
	if(!fexist("mtools/Attachments.txt")) file = fopen("mtools/Attachments.txt", io_write);
	else file = fopen("mtools/Attachments.txt", io_append);

	if(!file)
	{
		SendClientMessage(playerid, COLOR_GREY, "Error. Not found mtools/Attachments.txt");
		return 0;
	}

	format(str, 256,
	"SetPlayerAttachedObject(playerid, %d, %d, %d,  %f, %f, %f,  %f, %f, %f,  %f, %f, %f); // %d\r\n",
	gCurrentAttachIndex[playerid],
	gIndexModel[playerid][gCurrentAttachIndex[playerid]],
	gIndexBone[playerid][gCurrentAttachIndex[playerid]],
	gIndexPos[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_X],
	gIndexPos[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Y],
	gIndexPos[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Z],
	gIndexRot[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_X],
	gIndexRot[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Y],
	gIndexRot[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Z],
	gIndexSca[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_X],
	gIndexSca[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Y],
	gIndexSca[playerid][gCurrentAttachIndex[playerid]][ATPCOORD_Z],
	GetPlayerSkin(playerid));
	
	fwrite(file, str);
	fclose(file);

	ShowMainAttachEditMenu(playerid);

	return 1;
}
// END attach objects editor

stock GiveWeaponsToAllPlayers(slot, weaponid, ammo)
{
	weapon[slot] = weaponid;
	// SelectedWeapon = weapons[listitem];
	#if defined foreach
	foreach(new i : Player)
	#else
	for(new i = 0; i < MAX_PLAYERS; i++)
	#endif
	{
		GivePlayerWeapon(i, weaponid, ammo);
	}
}

stock GetPlayerCameraLookAt(playerid, &Float:rX, &Float:rY, &Float:rZ, Float:dist = 10.0) 
{
	new Float: locAt[6];
	GetPlayerCameraFrontVector(playerid, locAt[0], locAt[1], locAt[2]);
	GetPlayerCameraPos(playerid, locAt[3], locAt[4], locAt[5]);
	rX = locAt[0] * dist + locAt[3];
	rY = locAt[1] * dist + locAt[4];
	rZ = locAt[2] * dist + locAt[5]; 
}

stock FlipVehicle(vehicleid)
{
	new Float:a;
	GetVehicleZAngle(vehicleid, a);
	SetVehicleZAngle(vehicleid, a);
	return 1;
}

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

stock IsValidObjectModel(modelid)
{
	if(modelid >= 321 && modelid <= 328 || modelid >= 330 && modelid <= 331) return 1;
	else if(modelid >= 333 && modelid <= 339 || modelid >= 341 && modelid <= 373) return 1;
	else if(modelid >= 615 && modelid <= 661 || modelid == 664) return 1; 
	else if(modelid >= 669 && modelid <= 698 || modelid >= 700 && modelid <= 792)  return 1;
	else if(modelid >= 800 && modelid <= 906 || modelid >= 910 && modelid <= 964) return 1;
	else if(modelid >= 966 && modelid <= 998 || modelid >= 1000 && modelid <= 1193) return 1;
	else if(modelid >= 1207 && modelid <= 1325 || modelid >= 1327 && modelid <= 1572) return 1;
	else if(modelid >= 1574 && modelid <= 1698 || modelid >= 1700 && modelid <= 2882) return 1;
	else if(modelid >= 2885 && modelid <= 3135 || modelid >= 3167 && modelid <= 3175) return 1;
	else if(modelid == 3178 || modelid == 3187 || modelid == 3193 || modelid == 3214) return 1;
	else if(modelid == 3221 || modelid >= 3241 && modelid <= 3244) return 1;
	else if(modelid == 3246 || modelid >= 3249 && modelid <= 3250) return 1;
	else if(modelid >= 3252 && modelid <= 3253 || modelid >= 3255 && modelid <= 3265) return 1;
	else if(modelid >= 3267 && modelid <= 3347 || modelid >= 3350 && modelid <= 3415) return 1;
	else if(modelid >= 3417 && modelid <= 3428 || modelid >= 3430 && modelid <= 3609) return 1;
	else if(modelid >= 3612 && modelid <= 3783 || modelid >= 3785 && modelid <= 3869) return 1;
	else if(modelid >= 3872 && modelid <= 3882 || modelid >= 3884 && modelid <= 3888) return 1;
	else if(modelid >= 3890 && modelid <= 3973 || modelid >= 3975 && modelid <= 4541) return 1;
	else if(modelid >= 4550 && modelid <= 4762 || modelid >= 4806 && modelid <= 5084) return 1;
	else if(modelid >= 5086 && modelid <= 5089 || modelid >= 5105 && modelid <= 5375) return 1;
	else if(modelid >= 5390 && modelid <= 5682 || modelid >= 5703 && modelid <= 6010) return 1;
	else if(modelid >= 6035 && modelid <= 6253 || modelid >= 6255 && modelid <= 6257) return 1;
	else if(modelid >= 6280 && modelid <= 6347 || modelid >= 6349 && modelid <= 6525) return 1;
	else if(modelid >= 6863 && modelid <= 7392 || modelid >= 7415 && modelid <= 7973) return 1;
	else if(modelid >= 7978 && modelid <= 9193 || modelid >= 9205 && modelid <= 9267) return 1;
	else if(modelid >= 9269 && modelid <= 9478 || modelid >= 9482 && modelid <= 10310) return 1;
	else if(modelid >= 10315 && modelid <= 10744 || modelid >= 10750 && modelid <= 11417) return 1;
	else if(modelid >= 11420 && modelid <= 11753 || modelid >= 12800 && modelid <= 13563) return 1;
	else if(modelid >= 13590 && modelid <= 13667 || modelid >= 13672 && modelid <= 13890) return 1;
	else if(modelid >= 14383 && modelid <= 14528 || modelid >= 14530 && modelid <= 14554) return 1;
	else if(modelid == 14556 || modelid >= 14558 && modelid <= 14643) return 1;
	else if(modelid >= 14650 && modelid <= 14657 || modelid >= 14660 && modelid <= 14695) return 1;
	else if(modelid >= 14699 && modelid <= 14728 || modelid >= 14735 && modelid <= 14765) return 1;
	else if(modelid >= 14770 && modelid <= 14856 || modelid >= 14858 && modelid <= 14883) return 1;
	else if(modelid >= 14885 && modelid <= 14898 || modelid >= 14900 && modelid <= 14903) return 1;
	else if(modelid >= 15025 && modelid <= 15064 || modelid >= 16000 && modelid <= 16790) return 1;
	else if(modelid >= 17000 && modelid <= 17474 || modelid >= 17500 && modelid <= 17974) return 1;
	else if(modelid == 17976 || modelid == 17978 || modelid >= 18000 && modelid <= 18036) return 1;
	else if(modelid >= 18038 && modelid <= 18102 || modelid >= 18104 && modelid <= 18105) return 1;
	else if(modelid == 18109 || modelid == 18112 || modelid >= 18200 && modelid <= 18859) return 1;
	else if(modelid >= 18860 && modelid <= 19274 || modelid >= 19275 && modelid <= 19595) return 1;
	else if(modelid >= 19596 && modelid <= 19999) return 1; 
	//UG-MP Valid Object Models
	#if defined UGMP_INCLUDED
	if(modelid >= 11754 && modelid <= 11756) return 1;
	else if(modelid >= 11759 && modelid <= 11803) return 1;
	else if(modelid >= 11808 && modelid <= 11859) return 1;
	else if(modelid >= 11863 && modelid <= 11865) return 1;
	else if(modelid >= 11875 && modelid <= 11880) return 1;
	#endif
	else return 0;
}

stock RespawnAllVehicles()
{
    for (new i = GetVehiclePoolSize()+1; --i != 0;)
    SetVehicleToRespawn(i);
	SendClientMessageToAllEx(COLOR_GREY,
	"Весь транспорт был возвращен на точку появления",
	"All vehicles have been returned to the spawn point");
}  

public MtoolsHudToggle(playerid)
{
	//Toggle on-off mtools hud TD
	if(GetPVarInt(playerid,"hud") > 0)
	{
		SetPVarInt(playerid,"hud",0);
		SelectTextDraw(playerid, 0xFFFFFF);
		PlayerTextDrawHide(playerid, Objrate[playerid]);
		PlayerTextDrawHide(playerid, FPSBAR[playerid]);
		PlayerTextDrawHide(playerid, TDAIM[playerid]);
		PlayerTextDrawHide(playerid, Logo[playerid]);
		#if defined TEXTURE_STUDIO
		CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/logo");
		#endif
		SendClientMessageEx(playerid, -1, 
		"Все текстдравы и худ игрока были временно скрыты",
		"All textdraws and player hud have been temporarily hidden");
		return 0;
	} else {
		SetPVarInt(playerid,"hud",1);
		PlayerTextDrawShow(playerid, Objrate[playerid]);
		PlayerTextDrawShow(playerid, FPSBAR[playerid]);
		if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING){
			PlayerTextDrawShow(playerid, TDAIM[playerid]);
		}
		PlayerTextDrawShow(playerid, Logo[playerid]);
		#if defined TEXTURE_STUDIO
		CallRemoteFunction("OnPlayerCommandText", "is", playerid, "/logo");
		#endif
		SendClientMessageEx(playerid, -1, 
		"Все текстдравы и худ игрока были восстановлены",
		"All text and player skin have been restored");
		return 1;
	}
	// Hide all textdraws (Variant 2)
	// GameTextForPlayer(playerid, "~w~", 5000, 0);
}

stock IsABike(vehicleid)
{
	switch(GetVehicleModel(vehicleid))
	{
		case 461, 462, 463, 468, 471, 521, 522, 523, 581, 586, 448: return true;
	}
	return false;
}
stock IsAPlane(carid)
{
	switch(GetVehicleModel(carid))
	{
		case 592,577,511,512,593,520,553,476,519,460,513,548,417,487,488,497,563,447,469: return true;
	}
	return false;
}
stock IsANoSpeed(carid)
{
	switch(GetVehicleModel(carid))
	{
		case 441,448,449,450,464,462,465,481,501,509,510,537,538,564,569,570,590,591,594,606,607,608,610,611: return true;
	}
	return false;
}
stock IsABoat(carid)
{
	switch(GetVehicleModel(carid))
	{
		case 472,473,493,595,484,430,452..454,446: return true;
	}
	return false;
}
stock IsALowrider(vehicleid)
{
	switch(GetVehicleModel(vehicleid))
	{
		case 536, 575, 534, 567, 535, 566, 576, 412: return true;
	}
	return false;
}

// 2 lang chat func
stock GameTextForPlayerEx(playerid, const ru[], const en[], time, style)
{
	if (GetPVarInt(playerid, "lang") == 0)
	{
	    GameTextForPlayer(playerid, ru, time, style);
	}
	else if (GetPVarInt(playerid, "lang") == 1)
	{
	    GameTextForPlayer(playerid, en, time, style);
	}
}

stock SendClientMessageEx(playerid, color, const ru[], const en[])
{
	if (GetPVarInt(playerid, "lang") == 0)
	{
	    SendClientMessage(playerid, color, ru);
	}
	else if (GetPVarInt(playerid, "lang") == 1)
	{
	    SendClientMessage(playerid, color, en);
	}
	return true;
}

stock SendClientMessageToAllEx(color, const ru[], const en[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if (IsPlayerConnected(i))
	    {
	        SendClientMessageEx(i, color, ru, en);
	    }
	}
}