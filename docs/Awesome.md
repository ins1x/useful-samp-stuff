Awesome list for [Grand Theft Auto 3D Universe](https://gta.fandom.com/wiki/3D_Universe) multiplayers

![SA:MP](https://github.com/ins1x/useful-samp-stuff/raw/main/filterscripts/samp-logo.gif)  
# **San Andreas Multiplayer (SA:MP)**

### Server plugins/fixes
- [YSF](https://github.com/IllidanS4/YSF/wiki/Natives) - pull out maximum possibilities from the server, mainly with memory editing and hooking.
- [SKY](https://github.com/oscar-broman/SKY/blob/master/SKY.inc) - Slice's fork of kurta999's fork of YSF
- [Weapon-config](https://github.com/oscar-broman/samp-weapon-config) - This is an include that provides a more consistent and responsive damage system with many new features. It's pretty much plug-and-play if you don't have any filterscripts that interfere with the health or death events.
- [Samp-distance](https://github.com/Y-Less/samp-distance) - This library offers a bunch of functions for getting the distance between various entities (2D/3D points, players, vehicles), performing proximity/distance checks between them and finding the closest entities to other entities. The idea for this library came after seeing a discussion on this topic on the forums and realising that there is no widely adopted library for performing these tasks and the homebrewed implementations often have major issues.
- [Streamer](https://github.com/samp-incognito/samp-streamer-plugin/wiki)  - This plugin streams objects, pickups, checkpoints, race checkpoints, map icons, 3D text labels, and actors at user-defined server ticks. Basic area detection is also included. Because it is written entirely in C++, much of the overhead from PAWN is avoided. This streamer, as a result, is quite a bit faster than any other implementation currently available in PAWN.
- [Strlib](https://github.com/oscar-broman/strlib) - String functions for SA-MP Pawn scripting.
- [Sscanf](https://github.com/Y-Less/sscanf) - This is the sscanf plugin, which provides the sscanf function to extract basic structured data from strings. This is slightly different to regular expressions, but both have their place. A regular expression gives you total control over the exact structure of data down to the character level; however, extracting structured data like numbers using it is tricky. Conversely this gives slightly higher-level "specifiers" which can easily extract data types, at the expense of fine-grained control. To convert a string in to two numbers would look like:
- [Pawn Algorithms](https://github.com/iPollo/PawnAlgorithms) - The repository is a collection of open-source implementation of a variety of algorithms implemented in PAWN and licensed under GPL-3.0 License. This repository aims to share several algorithms implemented in Pawn for educational and professional purposes, the codes contain descriptions that aim to be detailed to exemplify the functionality of the algorithm.
- [FCNPC](https://github.com/ziggi/FCNPC) - Fully Controllable NPC (FCNPC) is a plugin for SA-MP servers which adds a lot of capabilities to the existing standard NPCs.
- [samp-util](https://github.com/WoutProvost/samp-util/tree/master/util) - A set of useful functions for SA-MP.
- [samp-plugin-timerfix](https://github.com/ziggi/samp-plugin-timerfix) - Timerfix provides an improvement (increases the accuracy) to the timers system existent in SA-MP server.

### Includes Graphics/Physics

- [MapFix](https://github.com/NexiusTailer/MapFix) - Texture bug fixes of the GTA San Andreas map  
- [3DTryg.inc](https://pro-pawn.ru/showthread.php?17336-3DTryg) - Include professional controls (coordinates / rotations / vectors / arcs / areas / offsets) supported (2D / 3D)
- [modelsizes-sql](https://github.com/algorhitmically/modelsizes-sql) - Model Sizes SQL
Model Sizes include but in SQL with standalone database.
- [physics.inc](https://www.burgershot.gg/showthread.php?tid=641) - library to simulate 2D and 3D physics (realistic movements, collisions, and more)
- [samp-aviation.inc](https://github.com/Southclaws/samp-aviation) - A basic pitch-based altitude and roll-based heading autopilot for SA-MP. Based on real autopilot behaviour with some adjustments made for the simple physics of San Andreas.
- [Vegetation-Array](https://github.com/rogercosta93/SAMP-Vegetation-Array) - This file contains array with all models ID and coordinates of remaining vegetation of SA-MP. Basically, SAMP removes various objects of GTA SA (this objects stay in binary .ipl file in .img files), to increase perfomance in Multiplayer game. But, SAMP don't remove all vegetations, because if remove all, the gameplay as run uggly.
- [Map-Loader](https://github.com/Gammix/Map-Loader) - The easiest and best way to load huge map codes from files, support settings, materials, textures, all dynamic items and comments!
- [Models-Array](https://github.com/Gammix/Models-Array) - Include containing all models names and ids support 0.3.7 new objects and skins
- [Zonenames](https://github.com/Gammix/zonenames.pwn) - Filterscript allows default samp 0.2 function: AllowZoneNames.
- [StreamerFunction](https://adm.ct8.pl/download/) - Include contain additional functions for Incognito Streamer Plugin

### Network and requests lisr

- [IP-API](https://ip-api.com/docs) - IP Geolocation API. Fast, accurate, reliable Free for non-commercial use, no API key required Easy to integrate, available in JSON, XML, CSV, Newline, PHP.
- [a_http](https://team.sa-mp.com/wiki/HTTP.html) - ends a threaded HTTP request.
- [pawn-requests.inc](https://github.com/Southclaws/pawn-requests) - This package provides an API for interacting with HTTP(S) APIs with support for text and JSON data types.
- [GeoLite (SQLite)](https://github.com/George480/geolite) - Update the country database the GeoIp by Whitetiger's include as many people requested.
- [RPC List](https://github.com/Brunoo16/samp-packet-list/wiki/RPC-List)
- [Network_Stats](https://sampwiki.blast.hk/wiki/Network_Stats)
- [Query_Mechanism](https://sampwiki.blast.hk/wiki/Query_Mechanism)

### Client-Server plugins

- [samp-audio-plugin](https://github.com/samp-incognito/samp-audio-server-plugin) - Its most useful feature, streaming audio, has been integrated into SA-MP itself, though it can still be used alongside SA-MP. This plugin creates a TCP server that can communicate with external clients to transfer and play back audio files, stream audio files from the Internet, and control in-game radio stations. It has several features.
- [SA-MP+](https://github.com/Hual/SA-MP-Plus) - A client modification that uses SA-MP's plugin SDK to interact with the server and add new features.
- [SAMP CEF](https://github.com/ZOTTCE/samp-cef) - This project embeds CEF into SA:MP expanding abilities to express yourself with beauty in-game interfaces using HTML/CSS/ JavaScript. It is a FRAMEWORK (or SDK), not something that you download and use. To be able to create you should have some webdev basics (JS / HTML / CSS). 
- [KeyListener](https://github.com/CyberMor/keylistener) - Client-server plugin to track the pressing of any key.

### Anticheats/Protection

- [NEX-AC](https://github.com/NexiusTailer/Nex-AC)- is a comprehensive protection which combines powerful anticheat and protection against.
- [SAMPCAC](https://github.com/ins1x/sampcac-docs) - anticheat  
- [Rakcheat](https://github.com/f0Re3t/rakcheat) - filtering incoming data to the server
- [Rogue-AC](https://github.com/RogueDrifter/Anti_cheat_pack) - This is a pack of 14 anticheats and 3 helping systems which you can control through callbacks mentioned in the includes and the test.pwn file.
- [Protection.inc](https://github.com/Open-GTO/protection) - Flexible server protection system (development).
- [SA-MP Guard](https://github.com/Amit-B/samp-guard) - is a script for the multiplayer game GTA: San Andreas which extends the server scripters ability with a few new features, including cheat and hack checking.
- [crashfix](https://github.com/Whitetigerswt/gtasa_crashfix) - fix GTA:SA Bugs ASI
- [BustAim-AntiAimbot](https://github.com/YashasSamaga/BA-AntiAimbot) - Aimbot Detection with LagComp
BustAim is a feature rich anti-aimbot include which tries to detect players who are using aimbots. BustAim is designed to trigger warnings and provide administrators with vital information about the suspected player. It by itself cannot do much and requires human intelligence to confirm if the player is using an aimbot.
- [GTA-Open serverside AC](https://github.com/PatrickGTR/gta-open/tree/master/gamemodes/core/anti-cheat)
- [SAMP_AC_v2](https://whitetigerswt.github.io/SAMP_AC_v2/)-The time has come where cheaters are no longer in control. Enter SA:MP Client Anti-Cheat Version 2.0. Scroll down to learn more.
- [query-flood-check](https://github.com/spmn/samp-custom-query-flood-check) - Custom Query Flood Check (CQFC plugin) Write custom protections against query flood.
- [Open-GTO protection](https://github.com/Open-GTO/protection) - Flexible server protection system (development)
- [alt-V-Anticheat-Guide](https://github.com/MyHwu9508/alt-V-Anticheat-Guide) - This guide is more or less designed to help you find approaches to detect & ban cheaters.
- [ModSA sources](https://github.com/BlastHackNet/mod_sa/tree/master/src) - s0beit sources

### DB/Storage

- [mxINI](https://github.com/Open-GTO/mxINI) - Fast INI reader/writer ( mxINI )
- [samp-whirlpool](https://github.com/Southclaws/samp-whirlpool) - crypto-plugin
- [samp-bcrypt](https://github.com/Sreyas-Sreelal/samp-bcrypt/) - A bcrypt plugin for samp in Rust.
- [FileManager](https://github.com/JaTochNietDan/SA-MP-FileManager) - is a simple plugin which allows you to manage files and folders.
- [MySQL plugin](https://github.com/pBlueG/SA-MP-MySQL) - The best and most famous MySQL plugin.

### Mapping guides

- [Detailed Mapping Guide / Tips](https://www.burgershot.gg/showthread.php?tid=990)  
- [Objects that are not visible to map editors](https://pawn-wiki.ru/index.php?/topic/31763-obekti-kotorie-ne-vidni-redaktoram-kart/) 
- [TxdGen/Mipmapping San Andreas for PC](https://gtamods.com/wiki/TxdGen/Mipmapping_San_Andreas_for_PC)

### Map Editors

- [SA:MP Texture Studio 2.1 RUS + mtools](https://drive.google.com/file/d/1y-4jfvl5EpzH5FeN2Hji62NBIB88rMkv/view?usp=sharing)
- [SA:MP Texture Studio 2.0 RUS](https://vk.com/@tip_mapper-texture-studio-20-rus)
- [SA:MP Texture Studio 1.9 (original)](https://github.com/Pottus/Texture-Studio)  
- [CR:MP Texture Studio v1.5](https://drive.google.com/file/d/1SZhzQ5jD0-ctlgXKPqj-bBrv6-J9yxki/view)
- [SA:MP Ultimate Creator](https://github.com/NexiusTailer/Ultimate-Creator)
- [SA:MP Map Construction](https://drive.google.com/file/d/17gjE54gxbSClJdJGlvbjiJnSnSYowsI0/view)  
- [MTA MAP Editor + SAMP 0.3.7 Objects & Autoconvert](https://drive.google.com/file/d/16G1SDlE40SqeE4fQBRRSMQ0KfwH64CIn/view)
- [MTA Mapping tools by KnOwN](https://drive.google.com/file/d/1syvD4i4zp3jZvS7z743bM92wYgDrT1yp/view)
- [MTA Mappers Community - Tools Bundle](https://drive.google.com/file/d/1TSK5hyPtnC3ZrgBEKNMcHPYE0-mMxHr8/view)
- [SA:MP MaterialTextPro](https://drive.google.com/file/d/1jug8FazFe_LMf9vaZJFq14afdvKbzR7E/view)
- [MEd (SA:MP)](https://drive.google.com/file/d/15IRG1nrCSKWJWTyKuiqr0F_u5FAexxWJ/view)
- [Moomapper 0.90 (VC,GTA3)](https://drive.google.com/file/d/1qg9Zg5tXgNxTmSEDjNc5Qj132zq8utfN/view)
- [KEd RUS (MOO MAPPER 0.94)](https://drive.google.com/file/d/1I-LqRGxeqJEsRH0Gc_7e2hhR9EV7HfbV/view)
- [Tube Connector (SA:MP)](https://drive.google.com/file/d/1Bwqzx8SaV3lo6NMdv2Jgz8QPSB_YVy3O/view)
- [GTA3 Mapper](https://drive.google.com/file/d/1xOCpumjfNM_HUDazKwPE2dcQWeEVsKDT/view)  
- [SA:MP Fusez's Map Editor v3 (source)](https://drive.google.com/file/d/1547MiIiBIDlHv_ohyqhIWKxumfc9wjPX/view)
- [SOE - Server Object Editor (SA:MP)](https://drive.google.com/file/d/12luMCaBnAgGPIElFIrVUWhfy48dUHE27/view)
- [Euryopa (SA:MP)](https://drive.google.com/file/d/1CTgykT0Xj2tmWZJHzKd119A1dWoc1nmL/view)

### Mapping tools guides

- [SA:MP map construction editor tutorial [Video]](https://www.youtube.com/watch?v=uKzjPgQcvU0)
- [SA:MP Map construction - Textures, Text, Mapping [Video]](https://www.youtube.com/watch?v=HmIrk4mdRqs)
- [SA:MP How to use drebin's object editor (DrEdit)[Video]](https://www.youtube.com/watch?v=uZQ8Vmk-fhM)
- [Fusez's SA:MP Map Editor](https://www.youtube.com/watch?v=qCqaDq8GcBs&t=2s)
- [VisualTexture_Pawn_SA-MP](https://github.com/KaizerHind/VisualTexture_Pawn_SA-MP)

### 3D Modeling tools
- [Blender](https://www.blender.org/) 
- [Zmodeler](https://www.zmodeler3.com/)
- [Zbrush](https://pixologic.com/)
- [Hammer](https://developer.valvesoftware.com/wiki/Valve_Hammer_Editor)

### 3D Modeling guides
- [J16D modeling tutorials](https://sites.google.com/view/j16d/p%C3%A1gina-principal/gta-sa-tutorials)
- [Creating your own object for SA:MP](https://www.youtube.com/watch?v=szZ2Qqu6iYM)
- [How to Rig Custom Map Objects!](https://www.youtube.com/watch?v=7YImSwnJ0oc)
- [SA:MP Custom models tutorial - Making a cube and texturing it](https://www.youtube.com/watch?v=qU8eonm6r0s)
- [GTA SA Modding Tutorial: UV Animation](https://www.youtube.com/watch?v=v5asIIBXOEE&feature=youtu.be)
- [GTA SA Modding Tutorial: Placing objects on maps](https://www.youtube.com/watch?v=qrdlYpYFqXw)
- [Convert any 3D vehicle models to GTA:SA format](https://www.youtube.com/watch?v=VT40Ggj0-Rk)
- [ZMODELER 3 NON ELS TUTORIAL](https://www.youtube.com/watch?v=T9x11bZMGmQ)
- [Zum Konvertieren von Autos GTASA Zmodeler (DE)](https://www.drakes-legacy.com/index_htm_files/Tutorial,%20GTA%20San%20Andreas,%20ZModeller%202,%20113%20Seiten.pdf)
- [Zbrush. Basic/ZModeler - part 1](https://www.youtube.com/watch?v=L3kuwzLlKfQ)
- [ZBrush шпаргалка: 2. Reference view](https://www.youtube.com/watch?v=hxacf8LLwM8)
- [Hammer Editor Tips and Tricks](https://www.youtube.com/watch?v=47HR2jewQms)

### Scripting resources

- [OpenMP. All scripting resources](https://open.mp/docs/scripting/resources)  
- [OpenMP. Awesome resources](https://open.mp/docs/awesome)  
- [Memory addresses](https://gtamods.com/wiki/Memory_Addresses_(SA))  
- [GTA Functions](https://sannybuilder.com/dev/research/gta_funcs.txt)  
- [String manipulation](https://open.mp/docs/tutorials/stringmanipulation) 
- [GDK SA:MP natives](https://zeex.github.io/sampgdk/doc/html/group__natives.html)
- [Virtual KeyCodes](https://api.farmanager.com/ru/winapi/virtualkeycodes.html)
- [WebGL vehicle models preview](http://gta.rockstarvision.com/vehicleviewer/#sa/elegant)
- [Junior_Djjr's Workshop](https://forum.mixmods.com.br/f94-workshops/t30-junior_djjr-s-workshop)
- [SA:MP UDF AHK](https://github.com/paul-phoenix/SAMP-UDF-for-AutoHotKey/blob/master/SAMP.ahk)

### PAWN compiler

- [sampctl](https://github.com/Southclaws/sampctl) command-line development tool for developing SA:MP Pawn scripts. It includes a package manager, a build tool and a configuration manager.
- [AMX-Assembly](https://github.com/YashasSamaga/AMX-Assembly-Docs/blob/master/DOCUMENT.md)
- [Pawn compiler flags](https://github.com/pawn-lang/compiler/wiki/Options)  
- [San Andreas Multiplayer](https://github.com/dashr9230/SA-MP)
- [Pawn Syntax Notepad++](https://github.com/CaptainBoi/Pawn-Compiler-In-Notepad-) - Pawn autocompletes for Notepad ++
- [Pawn Syntax Sublime](https://packagecontrol.io/packages/Pawn%20syntax) - Pawn autocompletes for Sublime Text.
- [Pawn Syntax VScode](https://marketplace.visualstudio.com/items?itemName=southclaws.vscode-pawn) - Pawn autocompletes for Visual Studio Code.
- [PAWN-Lang reference](https://github.com/pawn-lang/compiler/blob/master/doc/pawn-lang.pdf)  
- [Known Runtime/Compiler PAWN Bugs](https://sampforum.blast.hk/showthread.php?tid=570960) 

### Lua moonloader

- [Moonloader scripting-api](https://wiki.blast.hk/ru/moonloader/scripting-api)
- [Moonloader functions](https://blast.hk/dokuwiki/moonloader:functions)
- [Events lua](https://github.com/THE-FYP/SAMP.Lua/blob/master/samp/events.lua)
- [LUA book (RU)](https://antirek.github.io/luabook/)
- [Lua memory module (RU)](https://wiki.blast.hk/moonloader/lua/memory)
- [Lua style guide (luarocks](https://github.com/luarocks/lua-style-guide) - This style guides lists the coding conventions
- [ImGui wiki](https://mbm-documentation.readthedocs.io/en/latest/imgui.html#getclipboardtext)

### ID Lists
- [Models](https://dev.prineside.com/gtasa_samp_model_id/)
- [Interiors](https://pawnokit.ru/ru/interiors_id)
- [Animations](https://open.mp/docs/scripting/resources/animations) 
- [Skin](https://sampwiki.blast.hk/wiki/Skins:All) 
- [Vehicles](https://wiki.multitheftauto.com/wiki/RU/Vehicle_IDs) 
- [Sounds](https://pawnokit.ru/sounds) 
- [Keys ID's](https://wiki.pawno-info.ru/SAMP/ID_Keys)
- [Gametexts](https://pawnokit.ru/ru/gametexts_id)
- [Mapicons](https://pawnokit.ru/ru/mapicons_id)
- [Weather](https://pawnokit.ru/ru/weather_id)
- [Vehicle colors](https://pawnokit.ru/ru/colors_id)

![MTA](https://styles.redditmedia.com/t5_2snkj/styles/communityIcon_i4tqrbvgotq71.png?width=256&s=04650f41affea9ccaf0a6676fa5d94d41ff66e2f)
# **Multi Theft Auto (MTA)**

- [Tips & Tutorials learn from the most experienced mappers](https://web.archive.org/web/20200812184744/https://mta-mappers.com/tips-tutorials/)
- [Location of Mappers - Help/scripts/tools/resources/mods/tutorial](https://forums.mrgreengaming.com/topic/14776-location-of-mappers-helpscriptstoolsresourcesmodstutorial/)
- [Editor plugin + Mapping rules for MTA](https://forums.mrgreengaming.com/topic/14734-editor-plugin-mapping-rules-for-mta/)
- [MTA tools videotutorials](https://mtamapping.weebly.com/tutorials.html)
- [MTA Mapping tools and scripts](https://mtamapping.weebly.com/mapping-tools.html)
- [How to create a [DD] map](https://ffs.gg/threads/21181-TUTORIAL-How-to-create-a-DD-map)
- [How to create a [CTF] map](https://www.youtube.com/watch?v=zgFUqmnqLto)
- [Roller Coaster Generator](https://wiki.multitheftauto.com/wiki/Roller_Coaster_Generator)
- [Moving Objects Editor [MOE] ](https://wiki.multitheftauto.com/wiki/Moving_Objects_Editor)
- [MTA Modding in 3D](https://forum.mtasa.com/topic/119240-mta-modding-in-3d/)

### ID Lists
- [Models](https://wiki.multitheftauto.com/wiki/Object_IDs)
- [Interiors](https://wiki.multitheftauto.com/wiki/Interior_IDs)
- [Weapons](https://wiki.multitheftauto.com/wiki/Weapons)
- [Vehicles](https://wiki.multitheftauto.com/wiki/Vehicle_IDs)
- [Weather](https://wiki.multitheftauto.com/wiki/Weather)
- [Sounds](https://wiki.multitheftauto.com/wiki/Sounds)
- [Skin](https://wiki.multitheftauto.com/wiki/Character_Skins)
- [Animations](https://wiki.multitheftauto.com/wiki/Animations)

![VC:MP](https://static.vc-mp.org/forum/vcmp_forum_logo.png)
# **Vice City Multiplayer (VC:MP)**

- [Vice city List of Model IDs of interiors](https://forum.vc-mp.org/?topic=1189.0)
- [VC:MP objects model IDs](https://samp-pawn.do.am/publ/library_of_vcmp/id/id_modelej/23-1-0-10)
- [How to use med map editor for gta vice city](https://www.youtube.com/watch?v=n2BlV1IJZYc)
- [Blender Building to Vice City](https://www.youtube.com/watch?v=X3gtS8bEpPo)
- [[MVL] How to import objects from GTA](https://forum.vc-mp.org/?topic=7319.0)
- [VC Interactive Map](https://mapgenie.io/grand-theft-auto-vice-city/maps/vice-city)
- [VC:MP 0.1c source code](https://github.com/ziggi/vc-mp)

### ID Lists
- [Models](https://samp-pawn.do.am/publ/library_of_vcmp/id/id_modelej/23-1-0-10)
- [Interiors](https://forum.vc-mp.org/?topic=1189.0) 
- [Skin](https://samp-pawn.do.am/publ/library_of_vcmp/id/id_skinov/23-1-0-6) 
- [Vehicles](https://samp-pawn.do.am/publ/library_of_vcmp/id/id_transports/23-1-0-7) 
- [Weapons](https://samp-pawn.do.am/publ/library_of_vcmp/id/id_oruzhija/23-1-0-8)  

![UG:MP](https://i.ytimg.com/vi/UEFosJMLlWE/mqdefault.jpg)
# **GTA Undeground Multiplayer (UG:MP)**

- [Object modelid UG-MP](https://gtaundergroundmod.com/pages/ug-mp/documentation/models)
- [Migrating to ugmp everything you need to know](https://gtaundergroundmod.com/pages/ug-mp/documentation/guide/migrating-to-ugmp-everything-you-need-to-know)
- [UG-MP DL feature comparison](https://gtaundergroundmod.com/pages/ug-mp/dl)
- [GF-MP/snippets Weapons, Animations, Teleports, Interiors](https://github.com/GF-MP/snippets)
- [Coordget - small filterscript to pick up centered coordinates](https://github.com/markski1/ugmp-coordget)
- [Coordinates converter - converting between different kinds of coordinates](https://devtools.undergroundcnr.com/coords.html)
- [UG:MP vehicles - All vehicles sorted by location](https://github.com/dark0devx/ugmpsnippets)

### ID Lists
- [Models](https://gtaundergroundmod.com/pages/ug-mp/documentation/models)
- [Interiors](https://gtaundergroundmod.com/pages/ug-mp/documentation/interiors)
- [Skin](https://gtaundergroundmod.com/pages/ug-mp/documentation/skin-ids) 
- [Vehicles](https://gtaundergroundmod.com/pages/ug-mp/documentation/vehicles) 
- [Weapons](https://gtaundergroundmod.com/pages/ug-mp/documentation/weapons) 
- [Weather](https://gtaundergroundmod.com/pages/ug-mp/documentation/weather-ids)
- [Animations](https://gtaundergroundmod.com/pages/ug-mp/documentation/animations)


![GTA III](https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/0011/7389/brand.gif?itok=unbAK3TI)
# **GTA III**

- [Grand Theft Auto III Objects Reference](https://gta.mendelsohn.de/Reference3/IDE_index.html)
- [Programs used to edit GTA3](https://gta.mendelsohn.de/Reference3/Prg_index.html)
- [Information on GTA3 Data File Formats](https://gta.mendelsohn.de/Reference3/Fil_index.html)
- [MooMapper tutorial GTA3](https://www.gta-modding.com/vice_city/tutorials/moo_mapper.html)
