# Texture Studio 2.1 TM + Mtools (SA:MP)

*Re-pack modified version Texture Studio by TM. This version has a new GUI, fixes and more features.*

> What is a **"Texture Studio"** - Texture Studio is an advanced, server-based map editor.  
You can use Texture Studio for practically any kind of SA-MP map.   
It has many features that allow you to create, texture, and modify SA-MP maps with ease.  

Well it's just a in game map editor that will let you texture up to material index 15 (16 materials) as well as set color for that material index on objects.  

So far there is only some basic editing commands as it's mainly meant for texturing the idea is you create your maps in your favorite map editor they can then be imported into Texture Studio with the /importmap command only CreateObject() and CreateDynamicObject() object code lines are currently accepted. Just put your maps in text files located in the /tstudio/ImportMaps/ folder.

Yes you will need the textureviewer that is included in the release the command is /mtextures in game /mtset uses those array ids

You can set how many objects are editable the default is 10,000 which should be good for most people setting a different value requires a re-compile.

You can set the material slots higher the default being 16 you can increase this but I'm pretty sure you won't be able to open a map that was saved in a 16 slot compile. This is because it saves the array into the database keep in mind as well that SAMP only supports re-texturing from index 0-15 but if this changes in the future Texture Studio is adaptable.

### MTOOLS:
 is a filterscript that complements Texture Studio and provides a classic dialog interface.  
Mtools gives mappers more features to be more productive.

>The main menu is called by default on ALT (Can be changed in the settings)
For the list of all server commands and features type /help

### Commands:
Texture Studio currently have 114 commands. Refer to /thelp for a list of commands and documentation on each command. A list of major commands and short descriptions can be found in the github readme (or main page).

### Links:

All original versions will only be downloadable from github located here  
https://github.com/Crayder/Texture-Studio/  

Command information, basic usage, and more can be found on the wiki:  
https://github.com/Crayder/Texture-Studio/wiki  

Mtools Wiki:  
https://github.com/ins1x/mtools/wiki  

Video Introduction:  
http://www.youtube.com/watch?v=yk9oKoRJdds  
