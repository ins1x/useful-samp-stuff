/*
	About: Model Select with previews.
	Author: ziggi
	TextDraw's based on vspawner script by Kye
*/
#pragma warning disable 213
#pragma warning disable 209

#if !defined _samp_included
	#error "Please include a_samp or a_npc before mselect"
#endif

#if defined _mselect_included
	#endinput
#endif

#define _mselect_included

/*

	Define const

*/

#if !defined MSELECT_MAX_ITEMS
	#define MSELECT_MAX_ITEMS 500
#endif

#if !defined MSELECT_MAX_ITEMS_PER_LINE
	#define MSELECT_MAX_ITEMS_PER_LINE 7
#endif

#if !defined MSELECT_MAX_ITEMS_LINES
	#define MSELECT_MAX_ITEMS_LINES 3
#endif

#if !defined MSELECT_DEF_LIST_LOOP
	#define MSELECT_DEF_LIST_LOOP false
#endif

#if !defined MSELECT_DEF_BUTTON_TEXT
	#define MSELECT_DEF_BUTTON_TEXT "X"
#endif

#if !defined MSELECT_DEF_BUTTON_NEXT
	#define MSELECT_DEF_BUTTON_NEXT ">>"
#endif

#if !defined MSELECT_DEF_BUTTON_PREV
	#define MSELECT_DEF_BUTTON_PREV "<<"
#endif

#if !defined MSELECT_DEF_POS_X
	#define MSELECT_DEF_POS_X 85.0
#endif

#if !defined MSELECT_DEF_POS_Y
	#define MSELECT_DEF_POS_Y 130.0
#endif

#if !defined MSELECT_DEF_BUTTON_WIDTH
	#define MSELECT_DEF_BUTTON_WIDTH 60.0
#endif

#if !defined MSELECT_DEF_BUTTON_HEIGHT
	#define MSELECT_DEF_BUTTON_HEIGHT 13.0
#endif

#if !defined MSELECT_DEF_PBUTTON_WIDTH
	#define MSELECT_DEF_PBUTTON_WIDTH 30.0
#endif

#if !defined MSELECT_DEF_PBUTTON_HEIGHT
	#define MSELECT_DEF_PBUTTON_HEIGHT 13.0
#endif

#if !defined MSELECT_DEF_ITEM_WIDTH
	#define MSELECT_DEF_ITEM_WIDTH 60.0
#endif

#if !defined MSELECT_DEF_ITEM_HEIGHT
	#define MSELECT_DEF_ITEM_HEIGHT 70.0
#endif

#if !defined MSELECT_DEF_ROT_X
	#define MSELECT_DEF_ROT_X 0.0
#endif

#if !defined MSELECT_DEF_ROT_Y
	#define MSELECT_DEF_ROT_Y 0.0
#endif

#if !defined MSELECT_DEF_ROT_Z
	#define MSELECT_DEF_ROT_Z 0.0
#endif

#if !defined MSELECT_DEF_ZOOM
	#define MSELECT_DEF_ZOOM 1.0
#endif

#if !defined MSELECT_DEF_BG_PADDING
	#define MSELECT_DEF_BG_PADDING 20.0
#endif

#if !defined MSELECT_DEF_ITEM_PADDING
	#define MSELECT_DEF_ITEM_PADDING 2.0
#endif

#if !defined MSELECT_DEF_BUTTON_PADDING
	#define MSELECT_DEF_BUTTON_PADDING 5.0
#endif

#if !defined MSELECT_DEF_SELECT_COLOR
	#define MSELECT_DEF_SELECT_COLOR 0xAAAAAAFF
#endif

#if !defined MSELECT_DEF_ITEMS_BG_COLOR
	#define MSELECT_DEF_ITEMS_BG_COLOR 0x55555599
#endif

#if !defined MSELECT_DEF_DIALOG_BG_COLOR
	#define MSELECT_DEF_DIALOG_BG_COLOR 0x00000099
#endif

#if !defined MSELECT_DEF_HEADER_FG_COLOR
	#define MSELECT_DEF_HEADER_FG_COLOR 0xDDDDDDDD
#endif

#if !defined MSELECT_DEF_PAGE_FG_COLOR
	#define MSELECT_DEF_PAGE_FG_COLOR 0xDDDDDDDD
#endif

#if !defined MSELECT_DEF_BUTTON_FG_COLOR
	#define MSELECT_DEF_BUTTON_FG_COLOR 0x888888FF
#endif

#if !defined MSELECT_DEF_BUTTON_BG_COLOR
	#define MSELECT_DEF_BUTTON_BG_COLOR 0x000000CC
#endif

#if !defined MSELECT_DEF_HEADER_PADDING
	#define MSELECT_DEF_HEADER_PADDING 3.0
#endif

#if !defined MSELECT_DEF_PAGE_PADDING
	#define MSELECT_DEF_PAGE_PADDING 3.0
#endif

#define MSELECT_MAX_ITEMS_ON_LIST (MSELECT_MAX_ITEMS_PER_LINE * MSELECT_MAX_ITEMS_LINES)
#define MSELECT_MAX_FUNCTION_NAME 31
#define MSELECT_INVALID_MODEL_ID  -1

// bullshit for compatibility with unmodified include files
#if !defined FIX_const
	#define FIX_const 0
	#define MSELECT_FIX_CLEAR
#endif

#if !FIX_const
	native MS_CreatePlayerTextDraw(playerid, Float:x, Float:y, const text[]) = CreatePlayerTextDraw;

	#if defined _ALS_CreatePlayerTextDraw
		#undef CreatePlayerTextDraw
	#else
		#define _ALS_CreatePlayerTextDraw
	#endif

	#define CreatePlayerTextDraw MS_CreatePlayerTextDraw

	native MS_PlayerTextDrawSetString(playerid, PlayerText:text, const string[]) = PlayerTextDrawSetString;

	#if defined _ALS_PlayerTextDrawSetString
		#undef PlayerTextDrawSetString
	#else
		#define _ALS_PlayerTextDrawSetString
	#endif

	#define PlayerTextDrawSetString MS_PlayerTextDrawSetString

	#if defined MSELECT_FIX_CLEAR
		#undef MSELECT_FIX_CLEAR
		#undef FIX_const
	#endif
#endif

/*

	Define functions

*/

#define MSelectCreate:%0(%1) \
	forward msc_%0(%1); \
	public msc_%0(%1)

#define MSelectResponse:%0(%1) \
	forward msr_%0(%1); \
	public msr_%0(%1)

#define MSelect: #

/*

	Enums

*/

enum MSelectType {
	MSelect_None,
	MSelect_Item,
	MSelect_Button,
	MSelect_ButtonNext,
	MSelect_ButtonPrev,
	MSelect_Cancel,
}

/*

	Vars

*/

static
	bool:IsOpen[MAX_PLAYERS],
	ItemsCount[MAX_PLAYERS],
	ListItemID[MAX_PLAYERS],
	ListItemModel[MAX_PLAYERS],
	ListItemPage[MAX_PLAYERS],
	ListPage[MAX_PLAYERS],
	bool:ListLoop[MAX_PLAYERS],
	FunctionName[MAX_PLAYERS][MSELECT_MAX_FUNCTION_NAME],
	bool:TD_SkipCancel[MAX_PLAYERS],
	TD_ItemsModel[MAX_PLAYERS][MSELECT_MAX_ITEMS],
	TD_ItemsBgColors[MAX_PLAYERS][MSELECT_MAX_ITEMS],
	TD_PageFgColor[MAX_PLAYERS],
	TD_SelectColor[MAX_PLAYERS],
	Float:TD_PosX[MAX_PLAYERS],
	Float:TD_PosY[MAX_PLAYERS],
	Float:TD_ItemWidth[MAX_PLAYERS],
	Float:TD_ItemHeight[MAX_PLAYERS],
	Float:TD_RotX[MAX_PLAYERS],
	Float:TD_RotY[MAX_PLAYERS],
	Float:TD_RotZ[MAX_PLAYERS],
	Float:TD_Zoom[MAX_PLAYERS],
	Float:TD_PaddingBackground[MAX_PLAYERS],
	Float:TD_PaddingButton[MAX_PLAYERS],
	Float:TD_PaddingItem[MAX_PLAYERS],
	Float:TD_PaddingPage[MAX_PLAYERS],
	PlayerText:TD_Header[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...},
	PlayerText:TD_Item[MAX_PLAYERS][MSELECT_MAX_ITEMS],
	PlayerText:TD_ButtonCancel[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...},
	PlayerText:TD_ButtonNext[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...},
	PlayerText:TD_ButtonPrev[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...},
	PlayerText:TD_Page[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...},
	PlayerText:TD_Background[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};

/*

	Public functions

*/

stock MSelect_Show(playerid, const function[])
{
	if (!IsPlayerConnected(playerid)) {
		return 0;
	}

	new call_func[MSELECT_MAX_FUNCTION_NAME] = "msc_";
	strcat(call_func, function);

	CallLocalFunction(call_func, "i", playerid);

	return 1;
}

stock MSelect_Close(playerid)
{
	if (!IsPlayerConnected(playerid)) {
		return 0;
	}

	if (!MSelect_IsOpen(playerid)) {
		return 0;
	}

	IsOpen[playerid] = false;

	TD_Remove(playerid, TD_Header[playerid]);

	TD_Remove(playerid, TD_Page[playerid]);
	TD_Remove(playerid, TD_Background[playerid]);

	TD_Remove(playerid, TD_ButtonNext[playerid]);
	TD_Remove(playerid, TD_ButtonPrev[playerid]);
	TD_Remove(playerid, TD_ButtonCancel[playerid]);

	for (new i = 0; i < sizeof(TD_ItemsModel[]); i++) {
		TD_ItemsModel[playerid][i] = MSELECT_INVALID_MODEL_ID;

		TD_Remove(playerid, TD_Item[playerid][i]);
	}

	TD_SkipCancel[playerid] = true;
	CancelSelectTextDraw(playerid);

	return 1;
}

stock MSelect_Open(playerid, const function[], const items_array[], items_count, bool:list_loop = MSELECT_DEF_LIST_LOOP,
      const header[] = "", const button[] = MSELECT_DEF_BUTTON_TEXT,
      const button_next[] = MSELECT_DEF_BUTTON_NEXT, const button_prev[] = MSELECT_DEF_BUTTON_PREV,
      Float:pos_x = MSELECT_DEF_POS_X, Float:pos_y = MSELECT_DEF_POS_Y,
      Float:button_width = MSELECT_DEF_BUTTON_WIDTH, Float:button_height = MSELECT_DEF_BUTTON_HEIGHT,
      Float:page_button_width = MSELECT_DEF_PBUTTON_WIDTH, Float:page_button_height = MSELECT_DEF_PBUTTON_HEIGHT,
      Float:item_width = MSELECT_DEF_ITEM_WIDTH, Float:item_height = MSELECT_DEF_ITEM_HEIGHT,
      Float:rot_x = MSELECT_DEF_ROT_X, Float:rot_y = MSELECT_DEF_ROT_Y, Float:rot_z = MSELECT_DEF_ROT_Z,
      Float:zoom = MSELECT_DEF_ZOOM, Float:background_padding = MSELECT_DEF_BG_PADDING,
      Float:item_padding = MSELECT_DEF_ITEM_PADDING, Float:button_padding = MSELECT_DEF_BUTTON_PADDING,
      Float:header_padding = MSELECT_DEF_HEADER_PADDING, Float:page_padding = MSELECT_DEF_PAGE_PADDING,
      select_color = MSELECT_DEF_SELECT_COLOR,
      const items_bg_colors[MSELECT_MAX_ITEMS] = {MSELECT_DEF_ITEMS_BG_COLOR, ...},
      dialog_bg_color = MSELECT_DEF_DIALOG_BG_COLOR,
      header_fg_color = MSELECT_DEF_HEADER_FG_COLOR,
      page_fg_color = MSELECT_DEF_PAGE_FG_COLOR,
      button_fg_color = MSELECT_DEF_BUTTON_FG_COLOR,
      button_bg_color = MSELECT_DEF_BUTTON_BG_COLOR)
{
	if (!IsPlayerConnected(playerid)) {
		return 0;
	}

	MSelect_Close(playerid);

	if (items_count > MSELECT_MAX_ITEMS) {
		printf("Error (MSelect): list count value is too big (%d, max is %d).", items_count, MSELECT_MAX_ITEMS);
		items_count = MSELECT_MAX_ITEMS;
	}

	IsOpen[playerid] = true;
	ItemsCount[playerid] = items_count;
	ListItemID[playerid] = -1;
	ListItemModel[playerid] = MSELECT_INVALID_MODEL_ID;
	ListItemPage[playerid] = 0;
	ListPage[playerid] = 0;
	ListLoop[playerid] = list_loop;
	TD_PosX[playerid] = pos_x;
	TD_PosY[playerid] = pos_y;
	TD_ItemWidth[playerid] = item_width;
	TD_ItemHeight[playerid] = item_height;
	TD_RotX[playerid] = rot_x;
	TD_RotY[playerid] = rot_y;
	TD_RotZ[playerid] = rot_z;
	TD_Zoom[playerid] = zoom;
	TD_PaddingBackground[playerid] = background_padding;
	TD_PaddingButton[playerid] = button_padding;
	TD_PaddingItem[playerid] = item_padding;
	TD_PaddingPage[playerid] = page_padding;
	TD_ItemsBgColors[playerid] = items_bg_colors;
	TD_PageFgColor[playerid] = page_fg_color;
	TD_SelectColor[playerid] = select_color;
	MS_strcpy(FunctionName[playerid], function, MSELECT_MAX_FUNCTION_NAME);

	for (new i = 0; i < items_count; i++) {
		TD_ItemsModel[playerid][i] = items_array[i];
	}

	// background
	TD_BackgroundCreate(playerid, dialog_bg_color, TD_PosX[playerid], TD_PosY[playerid],
	                    TD_ItemWidth[playerid], TD_ItemHeight[playerid],
	                    TD_PaddingBackground[playerid], TD_PaddingButton[playerid]);

	// buttons
	new Float:button_x = pos_x + background_padding + MSELECT_MAX_ITEMS_PER_LINE * (TD_ItemWidth[playerid] + item_padding) - 5.0;
	new Float:button_y = pos_y + background_padding * 1.5 + MSELECT_MAX_ITEMS_LINES * (TD_ItemHeight[playerid] + item_padding) + 5.0;

	TD_ButtonCreate(playerid, TD_ButtonNext[playerid],
	                button_next, button_bg_color, button_fg_color,
	                button_x - page_button_width / 2.0, button_y, page_button_width, page_button_height);

	TD_ButtonCreate(playerid, TD_ButtonPrev[playerid],
	                button_prev, button_bg_color, button_fg_color,
	                button_x - page_button_width * 1.5 - button_padding, button_y, page_button_width, page_button_height);

	TD_ButtonCreate(playerid, TD_ButtonCancel[playerid],
	                button, button_bg_color, button_fg_color,
	                button_x - page_button_width * 2.0 - button_width / 2.0 - button_padding * 2.0, button_y, button_width, button_height);

	// header
	if (strlen(header) != 0) {
		TD_HeaderCreate(playerid, header, header_fg_color, TD_PosX[playerid] + header_padding, TD_PosY[playerid]);
	}

	// page
	TD_SetPage(playerid, ListPage[playerid], TD_ItemsModel[playerid], ItemsCount[playerid],
	           ListLoop[playerid], TD_PosX[playerid], TD_PosY[playerid],
	           TD_RotX[playerid], TD_RotY[playerid], TD_RotZ[playerid], TD_Zoom[playerid],
	           TD_ItemWidth[playerid], TD_ItemHeight[playerid],
	           TD_PaddingBackground[playerid], TD_PaddingItem[playerid], TD_PaddingPage[playerid],
	           TD_ItemsBgColors[playerid], TD_PageFgColor[playerid]);

	SelectTextDraw(playerid, select_color);

	return 1;
}

stock MSelect_IsOpen(playerid)
{
	if (!IsPlayerConnected(playerid)) {
		return 0;
	}

	return _:IsOpen[playerid];
}

/*

	Private functions

*/
static stock TD_SetPage(playerid, &page_id, const items_array[], items_count, bool:list_loop,
                        Float:pos_x, Float:pos_y, Float:rot_x, Float:rot_y, Float:rot_z, Float:zoom,
                        Float:width, Float:height, Float:padding_bg, Float:padding_item, Float:padding_page,
                        const items_bg_colors[MSELECT_MAX_ITEMS], page_fg_color)
{
	// list
	new pages_count, start_index, end_index;
	GetPaginatorInfo(items_count, page_id, pages_count, start_index, end_index, list_loop);

	new
		bool:IsDefaultItemCount = end_index - start_index == MSELECT_MAX_ITEMS_ON_LIST,
		bool:IsListCreated = TD_Item[playerid][0] != PlayerText:INVALID_TEXT_DRAW,
		bool:IsPageChanged = page_id != ListPage[playerid];

	if (IsDefaultItemCount && IsListCreated && IsPageChanged) {
		// update list
		new current_row = 0;

		for (new i = start_index; i < end_index; i++) {
			current_row++;
			TD_ListUpdateModel(playerid, current_row, items_array[i]);
		}

		// update paginator
		if (pages_count > 1) {
			new string[16];
			format(string, sizeof(string), "%d/%d", page_id + 1, pages_count);

			TD_PaginatorUpdateText(playerid, string);
		}
	} else {
		// remove old page
		TD_Remove(playerid, TD_Page[playerid]);

		for (new i = 0; i < MSELECT_MAX_ITEMS; i++) {
			TD_Remove(playerid, TD_Item[playerid][i]);
		}

		// draw list
		new
			row,
			Float:x,
			Float:y;

		for (new i = start_index; i < end_index; i++) {
			x = pos_x + padding_bg + (row % MSELECT_MAX_ITEMS_PER_LINE) * (width + padding_item);
			y = pos_y + padding_bg + (row / MSELECT_MAX_ITEMS_PER_LINE) * (height + padding_item);
			row++;

			TD_ItemCreate(playerid, i, items_array[i], items_bg_colors[i],
			              x, y, rot_x, rot_y, rot_z, zoom, width, height);
		}

		// paginator
		if (pages_count > 1) {
			new string[16];
			format(string, sizeof(string), "%d/%d", page_id + 1, pages_count);
			TD_PaginatorCreate(playerid, string, page_fg_color,
			                   pos_x - padding_page + padding_bg * 2.0 + MSELECT_MAX_ITEMS_PER_LINE * (width + padding_item),
			                   pos_y);
		}
	}

	if (page_id == ListItemPage[playerid]) {
		TD_SelectItem(playerid, ListItemID[playerid]);
	}
}

static stock GetPaginatorInfo(items_count, &curr_page = 0, &max_page = 0, &start_index = 0, &end_index = 0, bool:list_loop = false)
{
	if (items_count <= 0) {
		return;
	}

	max_page = items_count / MSELECT_MAX_ITEMS_ON_LIST;
	if (items_count % MSELECT_MAX_ITEMS_ON_LIST != 0) {
		max_page++;
	}

	if (curr_page < 0) {
		if (list_loop) {
			curr_page = max_page - 1;
		} else {
			curr_page = 0;
		}
	} else if (curr_page > max_page - 1) {
		if (list_loop) {
			curr_page = 0;
		} else {
			curr_page = max_page - 1;
		}
	}

	start_index = curr_page * MSELECT_MAX_ITEMS_ON_LIST;
	end_index = start_index + MSELECT_MAX_ITEMS_ON_LIST;

	if (items_count % end_index == items_count) {
		end_index = start_index + items_count % MSELECT_MAX_ITEMS_ON_LIST;
	}
}

static stock TD_SelectItem(playerid, item_id)
{
	if (!(0 <= item_id < ItemsCount[playerid])) {
		return 0;
	}

	new prev_item_id = ListItemID[playerid];

	if (prev_item_id != -1) {
		PlayerTextDrawBackgroundColor(playerid, TD_Item[playerid][prev_item_id], TD_ItemsBgColors[playerid][prev_item_id]);
		PlayerTextDrawShow(playerid, TD_Item[playerid][prev_item_id]);
	}
	PlayerTextDrawBackgroundColor(playerid, TD_Item[playerid][item_id], TD_SelectColor[playerid]);
	PlayerTextDrawShow(playerid, TD_Item[playerid][item_id]);

	ListItemID[playerid] = item_id;
	ListItemModel[playerid] = TD_ItemsModel[playerid][item_id];
	ListItemPage[playerid] = ListPage[playerid];
	return 1;
}

static stock TD_ItemCreate(playerid, item_id, model_id, bg_color, Float:pos_x, Float:pos_y,
                           Float:rot_x, Float:rot_y, Float:rot_z, Float:zoom,
                           Float:width, Float:height)
{
	TD_Item[playerid][item_id] = CreatePlayerTextDraw(playerid, pos_x, pos_y, " ");
	PlayerTextDrawFont(playerid, TD_Item[playerid][item_id], TEXT_DRAW_FONT_MODEL_PREVIEW);
	PlayerTextDrawColor(playerid, TD_Item[playerid][item_id], 0xFFFFFFFF);
	PlayerTextDrawBackgroundColor(playerid, TD_Item[playerid][item_id], bg_color);
	PlayerTextDrawTextSize(playerid, TD_Item[playerid][item_id], width, height);
	PlayerTextDrawSetPreviewModel(playerid, TD_Item[playerid][item_id], model_id);
	PlayerTextDrawSetPreviewRot(playerid,TD_Item[playerid][item_id], rot_x, rot_y, rot_z, zoom);
	PlayerTextDrawSetSelectable(playerid, TD_Item[playerid][item_id], 1);
	PlayerTextDrawShow(playerid, TD_Item[playerid][item_id]);
}

static stock TD_ListUpdateModel(playerid, item_id, model_id)
{
    PlayerTextDrawSetPreviewModel(playerid, TD_Item[playerid][item_id], model_id);
}

static stock TD_PaginatorCreate(playerid, const pagestr[], fg_color, Float:pos_x, Float:pos_y)
{
	TD_Page[playerid] = CreatePlayerTextDraw(playerid, pos_x, pos_y, pagestr);
	PlayerTextDrawUseBox(playerid, TD_Page[playerid], 0);
	PlayerTextDrawLetterSize(playerid, TD_Page[playerid], 0.4, 1.1);
	PlayerTextDrawFont(playerid, TD_Page[playerid], 1);
	PlayerTextDrawSetShadow(playerid, TD_Page[playerid], 0);
	PlayerTextDrawSetOutline(playerid, TD_Page[playerid], 1);
	PlayerTextDrawColor(playerid, TD_Page[playerid], fg_color);
	PlayerTextDrawShow(playerid, TD_Page[playerid]);
	PlayerTextDrawAlignment(playerid, TD_Page[playerid], 3);

	PlayerTextDrawShow(playerid, TD_Page[playerid]);
}

static stock TD_PaginatorUpdateText(playerid, const pagestr[])
{
	PlayerTextDrawSetString(playerid, TD_Page[playerid], pagestr);
}

static stock TD_HeaderCreate(playerid, const text[], fg_color, Float:pos_x, Float:pos_y)
{
	TD_Header[playerid] = CreatePlayerTextDraw(playerid, pos_x, pos_y, text);
	PlayerTextDrawUseBox(playerid, TD_Header[playerid], 0);
	PlayerTextDrawLetterSize(playerid, TD_Header[playerid], 0.4, 1.4);
	PlayerTextDrawFont(playerid, TD_Header[playerid], 1);
	PlayerTextDrawSetShadow(playerid, TD_Header[playerid], 0);
	PlayerTextDrawSetOutline(playerid, TD_Header[playerid], 1);
	PlayerTextDrawColor(playerid, TD_Header[playerid], fg_color);
	PlayerTextDrawShow(playerid, TD_Header[playerid]);

	PlayerTextDrawShow(playerid, TD_Header[playerid]);
}

static stock TD_BackgroundCreate(playerid, bg_color, Float:pos_x, Float:pos_y, Float:item_width, Float:item_height, Float:padding_bg, Float:padding_item)
{
	TD_Background[playerid] = CreatePlayerTextDraw(playerid,
	                            pos_x + padding_bg + (item_width + padding_item) * MSELECT_MAX_ITEMS_PER_LINE,
	                            pos_y, "_");
	PlayerTextDrawUseBox(playerid, TD_Background[playerid], 1);
	PlayerTextDrawBoxColor(playerid, TD_Background[playerid], bg_color);
	PlayerTextDrawLetterSize(playerid, TD_Background[playerid], 0.0,
	                         (item_height * MSELECT_MAX_ITEMS_LINES - padding_bg / 2.0) * 0.135);
	PlayerTextDrawTextSize(playerid, TD_Background[playerid], pos_x - 5.0, 0.0);
	PlayerTextDrawBackgroundColor(playerid, TD_Background[playerid], bg_color);

	PlayerTextDrawShow(playerid, TD_Background[playerid]);
}

static stock TD_ButtonCreate(playerid, &PlayerText:button, const text[], bg_color, fg_color,
                             Float:pos_x, Float:pos_y, Float:width, Float:height)
{
	button = CreatePlayerTextDraw(playerid, pos_x, pos_y, text);
	PlayerTextDrawUseBox(playerid, button, 1);
	PlayerTextDrawBoxColor(playerid, button, bg_color);
	PlayerTextDrawBackgroundColor(playerid, button, 0x000000FF);
	PlayerTextDrawLetterSize(playerid, button, 0.4, 1.1);
	PlayerTextDrawFont(playerid, button, 1);
	PlayerTextDrawSetShadow(playerid, button, 0);
	PlayerTextDrawSetOutline(playerid, button, 0);
	PlayerTextDrawColor(playerid, button, fg_color);
	PlayerTextDrawSetSelectable(playerid, button, 1);
	PlayerTextDrawAlignment(playerid, button, 2);
	PlayerTextDrawTextSize(playerid, button, height, width);

	PlayerTextDrawShow(playerid, button);
}

static stock TD_Remove(playerid, &PlayerText:td)
{
	PlayerTextDrawHide(playerid, td);
	PlayerTextDrawDestroy(playerid, td);
	td = PlayerText:INVALID_TEXT_DRAW;
}

/*

	OnGameModeInit

*/

public OnGameModeInit()
{
	for (new i = 0; i < sizeof(TD_Item); i++) {
		for (new j = 0; j < sizeof(TD_Item[]); j++) {
			TD_Item[i][j] = PlayerText:INVALID_TEXT_DRAW;
		}
	}

	#if defined MS_OnGameModeInit
		return MS_OnGameModeInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif

#define OnGameModeInit MS_OnGameModeInit
#if defined MS_OnGameModeInit
	forward MS_OnGameModeInit();
#endif

/*

	OnPlayerDisconnect

*/

public OnPlayerDisconnect(playerid, reason)
{
	MSelect_Close(playerid);

	#if defined MS_OnPlayerDisconnect
		return MS_OnPlayerDisconnect(playerid, reason);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif

#define OnPlayerDisconnect MS_OnPlayerDisconnect
#if defined MS_OnPlayerDisconnect
	forward MS_OnPlayerDisconnect(playerid, reason);
#endif

/*

	OnPlayerClickPlayerTextDraw

*/

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if (MSelect_IsOpen(playerid)) {
		new MSelectType:response_type = MSelect_None;

		// check buttons
		if (TD_ButtonCancel[playerid] == playertextid) {
			response_type = MSelect_Button;
		} else if (TD_ButtonPrev[playerid] == playertextid) {
			if (ListLoop[playerid] || ListPage[playerid] != 0) {
				ListPage[playerid]--;
				TD_SetPage(playerid, ListPage[playerid], TD_ItemsModel[playerid], ItemsCount[playerid],
						ListLoop[playerid], TD_PosX[playerid], TD_PosY[playerid],
						TD_RotX[playerid], TD_RotY[playerid], TD_RotZ[playerid], TD_Zoom[playerid],
						TD_ItemWidth[playerid], TD_ItemHeight[playerid],
						TD_PaddingBackground[playerid], TD_PaddingItem[playerid], TD_PaddingPage[playerid],
						TD_ItemsBgColors[playerid], TD_PageFgColor[playerid]);

				response_type = MSelect_ButtonPrev;
			}
		} else if (TD_ButtonNext[playerid] == playertextid) {
			new max_page;
			GetPaginatorInfo(ItemsCount[playerid], .max_page = max_page);

			if (ListLoop[playerid] || ListPage[playerid] != max_page - 1) {
				ListPage[playerid]++;
				TD_SetPage(playerid, ListPage[playerid], TD_ItemsModel[playerid], ItemsCount[playerid],
						ListLoop[playerid], TD_PosX[playerid], TD_PosY[playerid],
						TD_RotX[playerid], TD_RotY[playerid], TD_RotZ[playerid], TD_Zoom[playerid],
						TD_ItemWidth[playerid], TD_ItemHeight[playerid],
						TD_PaddingBackground[playerid], TD_PaddingItem[playerid], TD_PaddingPage[playerid],
						TD_ItemsBgColors[playerid], TD_PageFgColor[playerid]);

				response_type = MSelect_ButtonNext;
			}
		}

		// check listitem
		for (new i = 0; i < ItemsCount[playerid]; i++) {
			if (TD_Item[playerid][i] == playertextid) {
				TD_SelectItem(playerid, i);
				response_type = MSelect_Item;
				break;
			}
		}

		// check on errors
		if (response_type == MSelect_None) {
			#if defined MS_OnPlayerClickPlayerTextDraw
				return MS_OnPlayerClickPlayerTextDraw(playerid, playertextid);
			#else
				return 0;
			#endif
		}

		// check list_id
		new list_id = ListItemID[playerid];
		if (ListItemPage[playerid] != ListPage[playerid]) {
			list_id = -1;
		}

		// close the menu
		if (response_type == MSelect_Button) {
			MSelect_Close(playerid);
		}

		// call function
		new call_func[MSELECT_MAX_FUNCTION_NAME] = "msr_";
		strcat(call_func, FunctionName[playerid]);

		if (funcidx(call_func) != -1) {
			CallLocalFunction(call_func, "iiii", playerid, _:response_type, list_id, ListItemModel[playerid]);
		}
		return 1;
	}

	#if defined MS_OnPlayerClickPlayerTextDraw
		return MS_OnPlayerClickPlayerTextDraw(playerid, playertextid);
	#else
		return 0;
	#endif
}
#if defined _ALS_OnPlayerClickPlayerTD
	#undef OnPlayerClickPlayerTextDraw
#else
	#define _ALS_OnPlayerClickPlayerTD
#endif

#define OnPlayerClickPlayerTextDraw MS_OnPlayerClickPlayerTextDraw
#if defined MS_OnPlayerClickPlayerTextDraw
	forward MS_OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid);
#endif

/*

	OnPlayerClickTextDraw

*/

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if (clickedid == Text:INVALID_TEXT_DRAW && TD_SkipCancel[playerid]) {
		TD_SkipCancel[playerid] = false;
		return 1;
	}

	if (clickedid == Text:INVALID_TEXT_DRAW && MSelect_IsOpen(playerid)) {
		// close the menu
		MSelect_Close(playerid);

		// call the function
		new call_func[MSELECT_MAX_FUNCTION_NAME] = "msr_";
		strcat(call_func, FunctionName[playerid]);

		if (funcidx(call_func) != -1) {
			CallLocalFunction(call_func, "iiii", playerid, _:MSelect_Cancel, ListItemID[playerid], ListItemModel[playerid]);
		}
		return 1;
	}

	#if defined MS_OnPlayerClickTextDraw
		return MS_OnPlayerClickTextDraw(playerid, Text:clickedid);
	#else
		return 0;
	#endif
}
#if defined _ALS_OnPlayerClickTextDraw
	#undef OnPlayerClickTextDraw
#else
	#define _ALS_OnPlayerClickTextDraw
#endif

#define OnPlayerClickTextDraw MS_OnPlayerClickTextDraw
#if defined MS_OnPlayerClickTextDraw
	forward MS_OnPlayerClickTextDraw(playerid, Text:clickedid);
#endif

/*

	Helpers

*/

static stock MS_strcpy(result[], const source[], const size = sizeof(result))
{
	result[0] = 0;
	return strcat(result, source, size);
}
