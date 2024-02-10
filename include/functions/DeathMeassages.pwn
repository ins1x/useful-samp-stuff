switch(reason)
{
	case WEAPON_KNIFE, WEAPON_SHOVEL, WEAPON_KATANA, WEAPON_CHAINSAW:
	{
		new DeathMessages[][] = {"slashed","separated","diced","sacrificed"};
		new rand = random(sizeof(DeathMessages));
		format(deathmessage, sizeof deathmessage, DeathMessages[rand]);
	}
	case WEAPON_RIFLE, WEAPON_SNIPER:
	{
		new DeathMessages[][] = {"surprised","nailed","assassinated",
		"captured", "smashed", "slaughtered", "eliminated","executed"};
		new rand = random(sizeof(DeathMessages));
		format(deathmessage, sizeof deathmessage, DeathMessages[rand]);
	}
	case WEAPON_SHOTGUN, WEAPON_SAWEDOFF, WEAPON_SHOTGSPA:
	{
		new DeathMessages[][] = {"killed","pawned","busted",
		"obliterated","butchered","massacred","beat down","hammered",
		"smashed","farmed","drilled","terminated","pumped"};
		new rand = random(sizeof(DeathMessages));
		format(deathmessage, sizeof deathmessage, DeathMessages[rand]);
	}
	case WEAPON_UZI, WEAPON_MP5, WEAPON_TEC9, WEAPON_AK47, WEAPON_M4:
	{
		new DeathMessages[][] = {"annihilated","terminated","drilled",
		"shelled","perforated","destroyed", "liquidated", "demolished"};
		new rand = random(sizeof(DeathMessages));
		format(deathmessage, sizeof deathmessage, DeathMessages[rand]);
	}		
	case WEAPON_GRENADE, WEAPON_TEARGAS, WEAPON_COLLISION, WEAPON_ROCKETLAUNCHER, WEAPON_HEATSEEKER, WEAPON_MINIGUN, WEAPON_BOMB, WEAPON_FIREEXTINGUISHER, WEAPON_MOLTOV, WEAPON_FLAMETHROWER:
	{
		new DeathMessages[][] = {"barbecued","atomized","sprayed",
		"pulverized","detonated","grilled","roasted"};
		new rand = random(sizeof(DeathMessages));
		format(deathmessage, sizeof deathmessage, DeathMessages[rand]);
	}	
	default:
	{
		new DeathMessages[][] = {"killed","pawned","busted"};
		new rand = random(sizeof(DeathMessages));
		format(deathmessage, sizeof deathmessage, DeathMessages[rand]);
	}
}