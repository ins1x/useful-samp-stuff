// UG:MP objects enum
// This include contains all of the models UG-MP provides which aren't peds, vehicles, or weapons.

#define MAX_OBJECT_NAME_LENGTH		48

enum objEnum
{
	oID,
	oName[MAX_OBJECT_NAME_LENGTH]
}

static const ObjectsArray[][objEnum] =
{
	{11769, "mp_acetone"}, {11794, "mp_ashtray"}, {11770, "mp_batteries"}, {11795, "mp_biblegun"},
	{11796, "mp_beachhut"}, {11766, "mp_bonsai"}, {11797, "mp_bookalgebra"}, {11798, "mp_bookbio"},
	{11799, "mp_bookchem"}, {11800, "mp_bookphysics"}, {11801, "mp_boomboxa"}, {11849, "mp_breacher"},
	{11759, "mp_broadcam"}, {11802, "mp_childbed"}, {11803, "mp_closet1"}, {11850, "mp_coffeemake"},
	{11808, "mp_rusdrugcase"}, {11754, "mp_cylinder0"}, {11755, "mp_cylinder1"}, {11756, "mp_cylinder2"},
	{11760, "mp_desktoppc"}, {11851, "mp_directorchair"}, {11809, "mp_djtable"}, {11810, "mp_doctable"},
	{11811, "mp_dollarbill"}, {11812, "mp_drugequip"}, {11767, "mp_dsafeclose"}, {11768, "mp_dsafeopen"},
	{11813, "mp_easel"}, {11761, "mp_exsorbeo"}, {11762, "mp_exsorbeoc"}, {11852, "mp_footplate1"},
	{11853, "mp_footplate2"}, {11854, "mp_footplate3"}, {11855, "mp_footplate4"}, {11814, "mp_gasmask01"},
	{11856, "mp_giraffetoy"}, {11815, "mp_gopro"}, {11816, "mp_hangcloth"}, {11817, "mp_hangglider"},
	{11771, "mp_hcl"}, {11818, "mp_waterpipe"}, {11763, "mp_idesk"}, {11819, "mp_ifruitpcm"}, 
	{11863, "mp_imlands4"}, {11864, "mp_imlands5"}, {11865, "mp_imlands6"}, {11777, "mp_island"},
	{11778, "mp_island2"}, {11779, "mp_island3"}, {11780, "mp_island4"}, {11820, "mp_jbriefcase"},
	{11821, "mp_jewelbox"}, {11822, "mp_jewelboxclosed"}, {11823, "mp_jewelcase"}, {11857, "mp_kitchenset"},
	{11764, "mp_lockpick"}, {11824, "mp_makeup1"}, {11825, "mp_makeup2"}, {11826, "mp_makeup3"},
	{11827, "mp_makeup4"}, {11828, "mp_msofa1"}, {11829, "mp_msofa2"}, {11772, "mp_muraticacid"},
	{11830, "mp_newspaper"}, {11773, "mp_nitrilegloves"}, {11831, "mp_noodle"}, {11832, "mp_pancake"},
	{11833, "mp_pianowest"}, {11834, "mp_pumpkin"}, {11835, "mp_redpurse"}, {11836, "mp_ruggedrug"},
	{11837, "mp_shopbag1"}, {11838, "mp_shopbag2"}, {11839, "mp_shopbag3"}, {11765, "mp_slimjim"},
	{11774, "mp_ssoda"}, {11840, "mp_standmic"}, {11775, "mp_starterfluid"}, {11841, "mp_tarbrushcup"},
	{11776, "mp_toluene"}, {11842, "mp_tornado"}, {11843, "mp_travelbag"}, {11875, "mp_tune_battery"},
	{11879, "mp_tune_exh2l"}, {11880, "mp_tune_exh2r"}, {11878, "mp_tune_exht1"}, {11876, "mp_tune_meters"},
	{11877, "mp_tune_para"}, {11858, "mp_ushanka"}, {11844, "mp_wallsafe"}, {11845, "mp_watchbox"},
	{11846, "mp_watchboxclosed"}, {11781, "mp_weed_buda"}, {11782, "mp_weed_budb"}, {11783, "mp_weed_budc"},
	{11784, "mp_weed_budd"}, {11785, "mp_weed_dryinga"}, {11786, "mp_weed_dryingb"}, {11787, "mp_weed_lrga"},
	{11788, "mp_weed_lrgb"}, {11789, "mp_weed_meda"}, {11790, "mp_weed_medb"}, {11791, "mp_weed_smla"},
	{11792, "mp_weed_smlb"}, {11793, "mp_weed_smlc"}, {11847, "mp_wepcase"}, {11859, "mp_wepcrates"},
	{11848, "mp_ww2radio"}
};

stock UGMP_IsValidObjectModel(modelid)
{
	if(modelid >= 11754 && modelid <= 11756) return 1;
	else if(modelid >= 11759 && modelid <= 11803) return 1;
	else if(modelid >= 11808 && modelid <= 11859) return 1;
	else if(modelid >= 11863 && modelid <= 11865) return 1;
	else if(modelid >= 11875 && modelid <= 11880) return 1;
	else return 0;
}