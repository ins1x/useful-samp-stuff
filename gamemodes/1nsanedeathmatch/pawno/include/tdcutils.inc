#if defined _tdcutils_included
  #endinput
#endif
#define _tdcutils_included
#pragma library tdcutils

#include <a_samp>

#define MAX_STRING 255

stock strtok(const string[], &index,seperator=' ')
{
	new length = strlen(string);
	new offset = index;
	new result[MAX_STRING];
	while ((index < length) && (string[index] != seperator) && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}

	result[index - offset] = EOS;
	if ((index < length) && (string[index] == seperator))
	{
		index++;
	}
	return result;
}

stock IsAdmin(playerid)
{
    if(!CallRemoteFunction("IsAdmin","i",playerid)) return false;
    else return true;
}

stock IsAdminLevel(playerid,level)
{
    if(!CallRemoteFunction("IsAdminLevel","ii",playerid,level)) return false;
    else return true;
}

