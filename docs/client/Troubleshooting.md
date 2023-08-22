# The most common problems and their solutions

**Server closed the connection without a reason**
* Check the version of the SA:MP client, whether it matches the version of the server you are connecting to.

**After connecting not reaching the skin selection, crash with format codes 0x06XXXXXXX where X are arbitrary characters**
* Reinstall the SA-MP client through the original installer (not by changing the files)

**Error when clicking "Connect" button in SA-MP client. 0x0040fB80 or similar.**
* Install sa-mp 0.3.7 client again and change version of GTA_SA.exe to US 1.0

**Black screen.**
* Delete the gta_sa.set file from the GTA San Andreas User Files folder

**0x0059F8B4**
* Crash occurs when the client cannot load any object on the server from samp.img.
* Reinstall the client and try running SA:MP as an administrator.

**0x00746929 or 0x0081214A**
* You can solve the problem by resetting all settings related to the client to the standard ones.

**0x0000005 at 0x534134**
* Problem with Windows 7/8/10 access levels. Running SA:MP as administrator fixes it.

**0x00710881 0x0070FF4D 0x007100A1 0x00710727 0x004AA4F7 0x0156F981**
* Lack of memory in the game. Try installing StreamMemFix (For windows 10 streammemfix does not work)

**0xC0000005 at 0x5E5815**
* This error has many causes (more than 400). For example: animations, different sounds, processes, or even performing many functions at the same time. Here we just put a clean GTA: SA

**SAMPCAC installer gives Windows version mismatch error**
* Download sampcac_client.asi separately, or run the installer in Windows XP compatibility mode (Service pack 3).

**The game does not start on Windows10 / Windows11 (no crash)**
* On a Windows 10 system, the old DirectPlay must be enabled. To do this, go to "Control Panel » Programs » Uninstall Programs » Turn Windows features on or off" and check "Legacy Components and DirectPlay". 

---

## Problems related to mods

0x004AA8CB or 0x004F1464, 0x004F1B70 - Check the audio folder and its files.  
0x004DFF90, 0x004DD5A3, 0x004DFE92, 0x004F0E67, 0x004F0EBA, 0x004F0E1C - Problems with sound files.  
0x004F153A and 0x004D9880 - Audio/config is missing. Download the standard one.  
0x004F1464 - Attempt to play a non-existent radio.   
0x006FD525 - Missing platecharset in vehicle.txd  
0x004C87B6 - Missing white in particle.txd  
0x005B6B2F - Broken carcols.dat file  
0x00827F6E - Configuration curves with InterfaceEditor mod.   
0x0072CD14 - At death with mods for drawing distance.   
0x005DD97C - No textures plant1.txd  
0x005D9A9B - Curves transport effects  
0x006FE144 - No texture roadsignfont2  
0x0053388E - Curve effects  
0x005D5CA2 - Invalid texture format vehiclegrunge256  
0x0064F73B - Deleting the transport in which the player sits  
0x007C91CC - Fashion curves for skins   
0x00718604 - Incompatible or crooked screen resolution  
0x004D1750 0x004D46AE 0x005E5815 - Animation curves  
0x00728365 - Image curves or textures in mods  
0x006EB628 and 0x006EB670- Missing water textures of waterclear256 and waterwake  
0x0055D234 - Curve file data/plants.dat  
0x00734D88 - Curve file models/grass/grass.dff  
0x00706611 - Delete shadows.asi  
0x004874EA - Delete mod CJ can repair the car  
0x007ECABB - Problems reading files  
0x004C53A6 - DFF curves files  
0x007F39FB and 0x007F3825- Attempt to read a non-existent txd   

---

**VC|SA CrashInfo v1.2 (show crash solution)**
Some of the problems are solved by the Anticrasher.asi plugin and the Crashes plugin. These plugins help to eliminate many errors, as well as improve the performance of GTA San Andreas. Anticrasher.asi works stably with SAMPCAC. Source: https://github.com/Whitetigerswt/gtasa_crashfix/releases 

A utility that helps determine what is causing the game to crash. Works through Crash List which has been collected for 6 years now, and there are hundreds of documented solutions. The mod loads the list from CrashList.txt once a day when the game starts, so it will always be up to date. Includes the gta_sa.pdb file, which shows the name of the game's internal functions under "Backtrace", which no doubt helps mod developers to determine the cause of the problem. Can be used to create a "crash dump" and send it to more experienced people for review.  
Download: https://www.mixmods.com.br/2022/09/crashinfo/

See also the list of all known GTA:SA issues in the ModMixSets Crash Document  
(It is outdated, the author recommends using the CrashInfo utility)  
* https://docs.google.com/document/d/1YLdADUoDvAoV3wFsPq25CXgm3IuCCoL6r3odkN14TlY/edit
* https://github.com/JuniorDjjr/CrashInfo/blob/main/Lists/GTA-SA-10US/EN-CrashList.txt