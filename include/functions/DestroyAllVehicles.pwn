// Destroy vehicles in virtual world (wordlid -1 destroy for all worlds)
public DestroyAllVehicles(worldid)
{
	if(worldid != -1)
	{
		for(new i = GetVehiclePoolSize() +1; --i != 0;)
		{
			if(GetVehicleVirtualWorld(i) == worldid) DestroyVehicle(i);
		}
	} else {
		for(new i = GetVehiclePoolSize() +1; --i != 0;) DestroyVehicle(i);
	}
	
	return true;
}