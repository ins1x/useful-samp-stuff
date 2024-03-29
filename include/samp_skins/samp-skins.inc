// samp-skins.inc
// Contains information about models and names of skins in samp
// Wiki page: https://www.open.mp/docs/scripting/resources/skins
// Not contain finformation about skins added in SA-MP 0.3.7 RC3!

enum SkinInfoStruct 
{
    Skinid,
    SkinModelName[24],
    SkinName[32]
};

// Skin ID, "Model Name", "Skin Name/Type"
new SkinInfo[][SkinInfoStruct] = 
{
    {0, "cj", "Carl Johnson"},
    {1, "truth", "The Truth"},
    {2, "maccer", "Maccer"},
    {3, "andre", "Andre"}, 
    {4, "bbthin", "Big Bear Thin"},
    {5, "bb", "Big Bear Big"},
    {6, "emmet", "Emmet"},
    {7, "male01", "Taxi Driver/Train Driver"},
    {8, "janitor", "Janitor"},
    {9, "bfori", "Civillian"},
    {10, "bfost", "Old Woman"},
    {11, "vbfycrp", "Casino croupier"},
    {12, "bfyri", "Rich Woman"},
    {13, "bfyst", "Street Girl"},
    {14, "bmori", "Civillian"},
    {15, "bmost", "Mr.Whittaker (RS Haul Owner)"},
    {16, "bmyap", "Airport Ground Worker"},
    {17, "bmybu", "Businessman"},
    {18, "bmybe", "Beach Visitor"},
    {19, "bmydj", "DJ"},
    {20, "bmyri", "Rich Guy (Madd Doggs Manager)"},
    {21, "bmycr", "Civillian"},
    {22, "bmyst", "Civillian"},
    {23, "wmybmx", "BMXer"},
    {24, "wbdyg1", "Madd Dogg Bodyguard"},
    {25, "wbdyg2", "Madd Dogg Bodyguard"},
    {26, "wmybp", "Backpacker"},
    {27, "wmycon", "Construction Worker"},
    {28, "bmydrug", "Drug Dealer"},
    {29, "wmydrug", "Drug Dealer"},
    {30, "hmydrug", "Drug Dealer"},
    {31, "dwfolc", "Farm-Town inhabitant"},
    {32, "dwmolc1", "Farm-Town inhabitant"},
    {33, "dwmolc2", "Farm-Town inhabitant"},
    {34, "dwmylc1", "Farm-Town inhabitant"},
    {35, "hmogar", "Gardener"},
    {36, "wmygol1", "Golfer"},
    {37, "wmygol2", "Golfer"},
    {38, "hfori", "Civillian"},
    {39, "hfost", "Civillian"},
    {40, "hfyri", "Civillian"},
    {41, "hfyst", "Civillian"},
    {42, "jethro", "Jethro"},
    {43, "hmori", "Civillian"},
    {44, "hmost", "Civillian"},
    {45, "hmybe", "Beach Visitor"},
    {46, "hmyri", "Civillian"},
    {47, "hmycr", "Civillian"},
    {48, "hmyst", "Civillian"},
    {49, "omokung", "Snakehead (Da Nang)"},
    {50, "wmymech", "Mechanic"},
    {51, "bmymoun", "Mountain Biker"},
    {52, "wmymoun", "Mountain Biker"},
    {53, "ofori", "Unknown"},
    {54, "ofost", "Civillian"},
    {55, "ofyri", "Civillian"},
    {56, "ofyst", "Civillian"},
    {57, "omori", "Oriental Ped"},
    {58, "omost", "Oriental Ped"},
    {59, "omyri", "Civillian"},
    {60, "omyst", "Civillian"},
    {61, "wmyplt", "Pilot"},
    {62, "wmopj", "Colonel Fuhrberger"},
    {63, "bfypro", "Prostitute"},
    {64, "hfypro", "Prostitute"},
    {65, "kendl", "Kendl Johnson"}, 
    {66, "bmypol1", "Pool Player"},
    {67, "bmypol2", "Pool Player"}, 
    {68, "wmoprea", "Priest/Preacher"},
    {69, "sbfyst", "Civillian"},
    {70, "wmosci", "Scientist"},
    {71, "wmysgrd", "Security Guard"},
    {72, "swmyhp1", "Hippy"},
    {73, "swmyhp2", "Hippy"},
    {75, "swfopro", "Prostitute"},
    {76, "wfystew", "Stewardess"},
    {77, "swmotr1", "Homeless"},
    {78, "wmotr1", "Homeless"},
    {79, "bmotr1", "Homeless"},
    {80, "vbmybox", "Boxer"},
    {81, "vwmybox", "Boxer"},
    {82, "vhmyelv", "Black Elvis"},
    {83, "vbmyelv", "White Elvis"},
    {84, "vimyelv", "Blue Elvis"},
    {85, "vwfypro", "Prostitute"},
    {86, "ryder3", "Ryder with robbery mask"},
    {87, "vwfyst1", "Stripper"},
    {88, "wfori", "Civillian"},
    {89, "wfost", "Civillian"},
    {90, "wfyjg", "Jogger"},
    {91, "wfyri", "Rich Woman"},
    {92, "wfyro", "Rollerskater"},
    {93, "wfyst", "Civillian"},
    {94, "wmori", "Civillian"},
    {95, "wmost", "Civillian"},
    {96, "wmyjg", "Jogger"},
    {97, "wmylg", "Lifeguard"},
    {98, "wmyri", "Civillian"},
    {99, "wmyro", "Rollerskater"},
    {100, "wmycr", "Biker"},
    {101, "wmyst", "Civillian"},
    {102, "ballas1", "Balla"},
    {103, "ballas2", "Balla"},
    {104, "ballas3", "Balla"},
    {105, "fam1", "Grove Street Families"},
    {106, "fam2", "Grove Street Families"},
    {107, "fam3", "Grove Street Families"},
    {108, "lsv1", "Los Santos Vagos"},
    {109, "lsv2", "Los Santos Vagos"},
    {110, "lsv3", "Los Santos Vagos"},
    {111, "maffa", "The Russian Mafia"},
    {112, "maffb", "The Russian Mafia"},
    {113, "mafboss", "The Russian Mafia"},
    {114, "vla1", "Varios Los Aztecas"},
    {115, "vla2", "Varios Los Aztecas"},
    {116, "vla3", "Varios Los Aztecas"},
    {117, "triada", "Triad"},
    {118, "triadb", "Triad"},
    {119, "sindaco", "Johhny Sindacco"},
    {120, "triboss", "Triad Boss"},
    {121, "dnb1", "Da Nang Boy"},
    {122, "dnb2", "Da Nang Boy"},
    {123, "dnb3", "Da Nang Boy"},
    {124, "vmaff1", "The Mafia"},
    {125, "vmaff2", "The Mafia"},
    {126, "vmaff3", "The Mafia"},
    {127, "vmaff4", "The Mafia"},
    {128, "dnmylc", "Farm Inhabitant"},
    {129, "dnfolc1", "Farm Inhabitant"},
    {130, "dnfolc2", "Farm Inhabitant"},
    {131, "dnfylc", "Farm Inhabitant"},
    {132, "dnmolc1", "Farm Inhabitant"},
    {133, "dnmolc2", "Farm Inhabitant"},
    {134, "sbmotr2", "Homeless"},
    {135, "swmotr2", "Homeless"},
    {136, "sbmytr3", "Civillian"},
    {137, "swmotr3", "Homeless"},
    {138, "wfybe", "Beach Visitor"},
    {139, "bfybe", "Beach Visitor"},
    {140, "hfybe", "Beach Visitor"},
    {141, "sofybu", "Businesswoman"},
    {142, "sbmyst", "Taxi Driver"},
    {143, "sbmycr", "Crack Maker"},
    {144, "bmycg", "Crack Maker"},
    {145, "wfycrk", "Crack Maker"},
    {146, "hmycm", "Crack Maker"},
    {147, "wmybu", "Businessman"},
    {148, "bfybu", "Businesswoman"},
    {149, "smokev", "Big Smoke Armored"},
    {150, "wfybu", "Businesswoman"},
    {151, "dwfylc1", "Civillian"},
    {152, "wfypro", "Prostitute"},
    {153, "wmyconb", "Construction Worker"},
    {154, "wmybe", "Beach Visitor"},
    {155, "wmypizz", "Well Stacked Pizza Worker"},
    {156, "bmobar", "Barber"},
    {157, "cwfyhb", "Hillbilly"},
    {158, "cwmofr", "Farmer"},
    {159, "cwmohb1", "Hillbilly"},
    {160, "cwmohb2", "Hillbilly"},
    {161, "cwmyfr", "Farmer"},
    {162, "cwmyhb1", "Hillbilly"},
    {163, "bmyboun", "Black Bouncer"},
    {164, "wmyboun", "White Bouncer"},
    {165, "wmomib", "White MIB agent"},
    {166, "bmymib", "Black MIB agent"},
    {167, "wmybell", "Cluckin Bell Worker}",
    {168, "bmochil", "Hotdog/Chilli Dog Vendor"},
    {169, "sofyri", "Civillian"},
    {170, "somyst", "Civillian"},
    {171, "vwmybjd", "Blackjack Dealer"},
    {172, "vwfycrp", "Casino croupier"},
    {173, "sfr1", " Rifa"},
    {174, "sfr2", " Rifa"},
    {175, "sfr3", " Rifa"},
    {176, "bmybar", "Barber"},
    {177, "wmybar", "Barber"},
    {178, "wfysex", "Whore"},
    {179, "wmyammo", "Ammunation Salesman"},
    {180, "bmytatt", "Tattoo Artist"},
    {181, "vwmycr", "Punk"},
    {182, "vbmocd", "Cab Driver"},
    {183, "vbmycr", "Civillian"},
    {184, "vhmycr", "Civillian"},
    {185, "sbmyri", "Civillian"},
    {186, "somyri", "Civillian"},
    {187, "somybu", "Businessman"},
    {188, "swmyst", "Civillian"},
    {189, "wmyva", "Valet"},
    {190, "copgrl3", "Barbara Schternvart"},
    {191, "gungrl3", "Helena Wankstein"},
    {192, "mecgrl3", "Michelle Cannes"},
    {193, "nurgrl3", "Katie Zhan"},
    {194, "crogrl3", "Millie Perkins"},
    {195, "gangrl3", "Denise Robinson"},
    {196, "cwfofr", "Farm-Town inhabitant"},
    {197, "cwfohb", "Hillbilly"},
    {198, "cwfyfr1", "Farm-Town inhabitant"},
    {199, "cwfyfr2", "Farm-Town inhabitant"},
    {200, "cwmyhb2", "Hillbilly"},
    {201, "dwfylc2", "Farmer"},
    {202, "dwmylc2", "Farmer"},
    {203, "omykara", "Karate Teacher"},
    {204, "wmykara", "Karate Teacher"},
    {205, "wfyburg", "Burger Shot Cashier"},
    {206, "vwmycd", "Cab Driver"},
    {207, "vhfypro", "Prostitute"},
    {208, "suzie", "Su Xi Mu (Suzie)"},
    {209, "omonood", "Oriental Noodle stand vendor"},
    {210, "omoboat", "Oriental Boating School Instructor"},
    {211, "wfyclot", "Clothes shop staff"},
    {212, "vwmotr1", "Homeless"},
    {213, "vwmotr2", "Weird old man"},
    {214, "vwfywai", "Waitress (Maria Latore)"},
    {215, "sbfori", "Civillian"},
    {216, "swfyri", "Civillian"},
    {217, "wmyclot", "Clothes shop staff"},
    {218, "sbfost", "Civillian"},
    {219, "sbfyri", "Rich Woman"},
    {220, "sbmocd", "Cab Driver"},
    {221, "sbmori", "Civillian"},
    {222, "sbmost", "Civillian"},
    {223, "shmycr", "Civillian"},
    {224, "sofori", "Civillian"},
    {225, "sofost", "Civillian"},
    {226, "sofyst", "Civillian"},
    {227, "somobu", "Oriental Businessman"},
    {228, "somori", "Oriental Ped"},
    {229, "somost", "Oriental Ped"},
    {230, "swmotr5", "Homeless"},
    {231, "swfori", "Civillian"},
    {232, "swfost", "Civillian"},
    {233, "swfyst", "Civillian"},
    {234, "swmocd", "Cab Driver"},
    {235, "swmori", "Civillian"},
    {236, "swmost", "Civillian"},
    {237, "shfypro", "Prostitute"},
    {238, "sbfypro", "Prostitute"},
    {239, "swmotr4", "Homeless"},
    {240, "swmyri", "The D.A"},
    {241, "smyst", "Afro-American"},
    {242, "smyst2", "Mexican"},
    {243, "sfypro", "Prostitute"},
    {244, "vbfyst2", "Stripper"},
    {245, "vbfypro", "Prostitute"},
    {246, "vhfyst3", "Stripper"},
    {247, "bikera", "Biker"},
    {248, "bikerb", "Biker"},
    {249, "bmypimp", "Pimp"},
    {250, "swmycr", "Civillian"},
    {251, "wfylg", "Lifeguard"},
    {252, "wmyva2", "Naked Valet"},
    {253, "bmosec", "Bus Driver"},
    {254, "bikdrug", "Biker Drug Dealer"},
    {255, "wmych", "Chauffeur (Limo Driver)"},
    {256, "sbfystr", "Stripper"},
    {257, "swfystr", "Stripper"},
    {258, "heck1", "Heckler"},
    {259, "heck2", "Heckler"},
    {260, "bmycon", "Construction Worker"},
    {261, "wmycd1", "Cab driver"},
    {262, "bmocd", "Cab driver"},
    {263, "vwfywa2", "Civillian"},
    {264, "wmoice", "Clown (Ice-cream Van Driver)"},
    {265, "tenpen", "Officer Frank Tenpenny"},
    {266, "pulaski", "Officer Eddie Pulaski"},
    {267, "hern", "Officer Jimmy Hernandez"},
    {268, "dwayne", "Dwaine/Dwayne"},
    {269, "smoke", "Big Smoke"},
    {270, "sweet", "Sean Johnson (Sweet)"},
    {271, "ryder", "Lance Wilson (Ryder)"},
    {272, "forelli", "Mafia Boss"},
    {273, "tbone", "T-Bone Mendez"},
    {274, "laemt1", "Paramedic"},
    {275, "lvemt1", "Paramedic"},
    {276, "sfemt1", "Paramedic"},
    {277, "lafd1", "Firefighter"},
    {278, "lvfd1", "Firefighter"},
    {279, "sffd1", "Firefighter"},
    {280, "lapd1", "Los Santos Police Officer"},
    {281, "sfpd1", "Police Officer"},
    {282, "lvpd1", "Police Officer"},
    {283, "csher", "County Sheriff"},
    {284, "lapdm1", "LSPD Motorbike Cop"},
    {285, "swat", "S.W.A.T Special Forces"},
    {286, "fbi", "FBI Agent"},
    {287, "army", "Army Soldier"},
    {288, "dsher", "Desert Sheriff"},
    {289, "zero", "Zero"},
    {290, "rose", "Ken Rosenberg"},
    {291, "paul", "Kent Paul"},
    {292, "cesar", "Cesar Vialpando"},
    {293, "ogloc", "Jeffery (OG Loc)"},
    {294, "wuzimu", "Wu Zi Mu (Woozie)"},
    {295, "torino", "Michael Toreno (Mike)"},
    {296, "jizzy", "Jizzy"},
    {297, "maddogg", "Madd Dogg"},
    {298, "cat", "Catalina"},
    {299, "claude", "Claude Speed}
};