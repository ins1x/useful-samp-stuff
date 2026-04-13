/*_______________________________________________________________
					||| GeoIP include R1 |||
						(с) Splav ,

#include <a_samp>
#include <a_http>

forward GeoIPLookingFor(playerid, response_code, data[]);

stock GeoIPLookFor(playerid)
{
	new str[50],ip[16];
	GetPlayerIp(playerid,ip,sizeof(ip));
	//format(str,42,"ip-whois.net/ip_geo.php?ip=%s",ip);
	format(str,42,"https://htmlweb.ru/analiz/whois_ip.php?ip=%s",ip);
	HTTP(playerid,HTTP_GET,str,"","GeoIPLookingFor");
	return 1;
}

public GeoIPLookingFor(playerid, response_code, data[])
{
	new str[50], teststr[50];

	strmid(teststr, data, strfind(data, "Страна:", true), strfind(data, "Страна:", true)+50);
	strmid(str, teststr, 8, strfind(teststr, "<", true));
	SetPVarString(playerid,"Player_Country",str);

	strmid(teststr, data, strfind(data, "Город:", true), strfind(data, "Город:", true)+50);
	strmid(str, teststr, 7, strfind(teststr, ";", true)-1);
	SetPVarString(playerid,"Player_City",str);
	return 1;
}

stock GetPlayerCountry(playerid)
{
	new str[50];
	GetPVarString(playerid,"Player_Country",str,50);
	return str;
}

stock GetPlayerCity(playerid)
{
	new str[50];
	GetPVarString(playerid,"Player_City",str,50);
	return str;
}