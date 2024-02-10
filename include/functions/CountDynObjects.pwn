// Count streamer dynamic objects and pickups
// https://github.com/samp-incognito/samp-streamer-plugin/wiki

#if defined _streamer_included
stock CountDynObjects(worldid = -1)
{
	new dynnumobject = CreateDynamicObject(0,0,0,0,0,0,0,worldid); 
    DestroyDynamicObject(dynnumobject); 
	return dynnumobject-1; 
}

stock CountDynPickups()
{
	new dynpicknumobject = CreateDynamicPickup(0, 0, 0,0,0, 0, 0, 0, 0, -1, 0); 
    DestroyDynamicPickup(dynpicknumobject); 
	return dynpicknumobject-1; 
}
#endif