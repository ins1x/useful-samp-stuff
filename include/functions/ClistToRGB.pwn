// clist color hex to rgb converter
stock ClistToRGB(colorid)
{
	new tmpint, tmpstr[10];
	tmpint = playerClistColors[colorid] >> 8 & 0x00FFFFFF;
	format(tmpstr, sizeof(tmpstr), "%06x", tmpint);
	return tmpstr;
}