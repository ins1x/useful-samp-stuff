# 1nsaneDeathMatch

Homepage: https://github.com/ins1x/1nsanedeathmatch/tree/main

Some time ago I started developing my own samp gamemode. I wanted to make the DM project look like AbsoluteDM, but simplistic and focused on a comfortable game. Like many single-handed developers, by the time the server became similar, it was gone. It was decided that some ideas would be implemented on the server.

## Some features of the gamemode:
* Freeroam is focused on dm and extermination of rivals in any way possible. Weapons can be found on the map.
* A bunch of Dm modes (TDM, DM One shot, Survival, CW, WAR, GANGWAR) with automatic change of cards in time
* Advanced admin panel with many features
* In-game tools for the developer. Map editor with many features (will be published later)
* Server anti-cheat + SAMPCAC support. Chat control from flood, spam, etc.
* Vehicle tuning system with attachment of objects
* High-quality mapping (the source of mapping is closed because some of the work was done by other people)
* The project is Russian-language, respectively, all the menus and messages in Russian.
* It was already developed on new versions of plugins and systems, in general, modern.
* C bug, Slide, Fast not blocked by default(but can be blocked from the admin panel)

A simple dm mode is performance oriented, minimum of timers and maximum of optimization.
The system was designed taking into account many years of playing experience on dm projects
 
This gamemode is provided "as is" you can do with this code whatever you want if it does not violate 
anyone's related copyrights. Part of the code according to the old tradition is taken from various public 
resources of the Internet. This server has not gone into production due to the fact that DM server is not 
interesting in the samp in 2019. Mapping was performed by different ice and mapping sources are closed. 

## Requirements:
> To login as root go under the account root-root, password to enter the admin area

+ jit compiler - https://github.com/Zeex/samp-plugin-jit
+ strlib - https://github.com/oscar-broman/strlib
+ crashdetect - https://github.com/Zeex/samp-plugin-crashdetect/releases
+ ASAN - https://github.com/KrYpToDeN/Advanced-SA-NickName/releases
+ foreach - https://github.com/Open-GTO/mxINI
+ mxINI - http://forum.sa-mp.com/showthread.php?t=120356
+ sscanf - https://forum.sa-mp.com/showthread.php?t=570927
+ new callbacks - https://github.com/emmet-jones/New-SA-MP-callbacks
+ Useful Functions (uf.inc) - https://wiki.sa-mp.com/wiki/Useful_Functions
+ Pawn.CMD -  https://github.com/urShadow/Pawn.CMD/releases
+ Pawn.RakNet - https://github.com/urShadow/Pawn.RakNet/wiki
+ mselect - https://github.com/Open-GTO/mselect
+ streamer - https://github.com/samp-incognito/samp-streamer-plugin/releases
+ airbreak - https://github.com/emmet-jones/OnPlayerAirbreak
+ Mapfix - https://pawn-wiki.ru/index.php?showtopic=28682
+ sampcac - https://SAMPCAC.xyz/

### Server side requirements:
* The modified jit compiler is used - https://github.com/pawn-lang/compiler/releases
* Loss of objects from the player in case of server crash

### Client side requirements:
* Due to the fact that Sampac does not develop for a long time and requires 
 an old version of the samp client 0.3.7 R1, it is disabled by default.
* There are crashes on non-Russified GTA assemblies (fix Smarter's Localization v2.0)
* Reccomended screen resolution no less 1024x768

## Disclaimer: 
This version of the mod is not the final and meet some bugs and flaws
The native language of the author is Russian translation by places may be inaccurate.
In this version of the system gangzones not ready, it did not finish
