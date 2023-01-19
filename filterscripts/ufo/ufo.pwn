/*
	Filterscript: ufo
	Description: Adds a dynamic UFO over a bar in the desert
	Author: 1NS
*/

#include <a_samp>
#define FILTERSCRIPT

// Change this public to your update function (recomended 5-30 sec)
forward OnObjectUpdate(objectid);

new Ufo;

public OnFilterScriptInit()
{
	SetTimer("OnObjectUpdate", 1000*5, true);
	Ufo = CreateObject(18846, -87.22830, 1362.65686, 100.94141, 0.0, 0.0, 0.0);
	return 1;
}

public OnFilterScriptExit()
{
	DestroyObject(Ufo);
	return 1;
}

public OnObjectMoved(objectid)
{
	MoveObject(Ufo, -1367.8406+random(100), -216.8063+random(100), 83.3198+random(5),
	10.0, 0.0, 0.0, 360.0);
	return 1;
}

public OnObjectUpdate(objectid)
{
	if(IsValidObject(Ufo))
	{
		MoveObject(Ufo, -1367.8406+random(100), -216.8063+random(100), 83.3198+random(5),
		10.0, 0.0, 0.0, 360.0);
	}
	return 1;
}