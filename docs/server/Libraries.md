## Additional Libraries

> For quick search use **CTRL + F**

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

## Mapping/Graphics/Physics

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

## Network

- [IP-API](https://ip-api.com/docs) - IP Geolocation API. Fast, accurate, reliable Free for non-commercial use, no API key required Easy to integrate, available in JSON, XML, CSV, Newline, PHP.
- [a_http](https://team.sa-mp.com/wiki/HTTP.html) - ends a threaded HTTP request.
- [pawn-requests.inc](https://github.com/Southclaws/pawn-requests) - This package provides an API for interacting with HTTP(S) APIs with support for text and JSON data types.
- [GeoLite (SQLite)](https://github.com/George480/geolite) - Update the country database the GeoIp by Whitetiger's include as many people requested.
- [RPC List](https://github.com/Brunoo16/samp-packet-list/wiki/RPC-List)
- [Network_Stats](https://sampwiki.blast.hk/wiki/Network_Stats)
- [Query_Mechanism](https://sampwiki.blast.hk/wiki/Query_Mechanism)

## Client-Server Plugins

- [samp-audio-plugin](https://github.com/samp-incognito/samp-audio-server-plugin) - Its most useful feature, streaming audio, has been integrated into SA-MP itself, though it can still be used alongside SA-MP. This plugin creates a TCP server that can communicate with external clients to transfer and play back audio files, stream audio files from the Internet, and control in-game radio stations. It has several features.
- [SA-MP+](https://github.com/Hual/SA-MP-Plus) - A client modification that uses SA-MP's plugin SDK to interact with the server and add new features.
- [SAMP CEF](https://github.com/ZOTTCE/samp-cef) - This project embeds CEF into SA:MP expanding abilities to express yourself with beauty in-game interfaces using HTML/CSS/ JavaScript. It is a FRAMEWORK (or SDK), not something that you download and use. To be able to create you should have some webdev basics (JS / HTML / CSS). 
- [KeyListener](https://github.com/CyberMor/keylistener) - Client-server plugin to track the pressing of any key.

## Anticheats/Protection

- [NEX-AC](https://github.com/NexiusTailer/Nex-AC)- is a comprehensive protection which combines powerful anticheat and protection against.
- [SAMPCAC](https://bitbucket.org/1nsanemapping/rsc/wiki/Sampcac) - anticheat  
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

## DB/Storage

- [mxINI](https://github.com/Open-GTO/mxINI) - Fast INI reader/writer ( mxINI )
- [samp-whirlpool](https://github.com/Southclaws/samp-whirlpool) - crypto-plugin
- [samp-bcrypt](https://github.com/Sreyas-Sreelal/samp-bcrypt/) - A bcrypt plugin for samp in Rust.
- [FileManager](https://github.com/JaTochNietDan/SA-MP-FileManager) - is a simple plugin which allows you to manage files and folders.
- [MySQL plugin](https://github.com/pBlueG/SA-MP-MySQL) - The best and most famous MySQL plugin.

## PAWN compiler
- [sampctl](https://github.com/Southclaws/sampctl) command-line development tool for developing SA:MP Pawn scripts. It includes a package manager, a build tool and a configuration manager.
- [AMX-Assembly](https://github.com/YashasSamaga/AMX-Assembly-Docs/blob/master/DOCUMENT.md)
- [Pawn compiler flags](https://github.com/pawn-lang/compiler/wiki/Options)  
- [San Andreas Multiplayer](https://github.com/dashr9230/SA-MP)
- [Pawn Syntax Notepad++](https://github.com/CaptainBoi/Pawn-Compiler-In-Notepad-) - Pawn autocompletes for Notepad ++
- [Pawn Syntax Sublime](https://packagecontrol.io/packages/Pawn%20syntax) - Pawn autocompletes for Sublime Text.
- [Pawn Syntax VScode](https://marketplace.visualstudio.com/items?itemName=southclaws.vscode-pawn) - Pawn autocompletes for Visual Studio Code.

## ETC
- [VisualTexture_Pawn_SA-MP](https://github.com/KaizerHind/VisualTexture_Pawn_SA-MP)
- [VC:MP 0.1c source code](https://github.com/ziggi/vc-mp)

See also:

- [OpenMP. All scripting resources](https://open.mp/docs/scripting/resources)  
- [OpenMP. Awesome resources](https://open.mp/docs/awesome)  
- [Memory addresses](https://gtamods.com/wiki/Memory_Addresses_(SA))  
- [GTA Functions](https://sannybuilder.com/dev/research/gta_funcs.txt)  
- [String manipulation](https://open.mp/docs/tutorials/stringmanipulation)  
- [PAWN-Lang reference](https://github.com/pawn-lang/compiler/blob/master/doc/pawn-lang.pdf)  
