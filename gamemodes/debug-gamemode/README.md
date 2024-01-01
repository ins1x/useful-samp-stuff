## Debugmode  
Description: Simple [SA:MP](https://www.sa-mp.com/) gamemode created for debugging purposes.  
Perfect if you need to quickly deploy a samp server and test any system.  
> Based on [SA:MP 0.3.7 R2 server](https://www.sa-mp.com/download.php)  

### Configure
- Check before run [server.cfg](https://open.mp/docs/server/server.cfg) configfile. 
```
filterscripts netstats
plugins crashdetect
rcon_password debug
```
- Change [rcon_password](https://www.open.mp/docs/server/ControllingServer)!
- Compile your script with [debug info](https://github.com/Zeex/samp-plugin-crashdetect/wiki/Compiling-scripts-with-debug-info).
> Crashdetect [does not work in conjunction with Profiler and JIT plugins](https://github.com/Zeex/samp-plugin-crashdetect), only one of them can be used!

### Plugins
* [Crashdetect 4.19 plugin](https://github.com/Zeex/samp-plugin-crashdetect/releases)
* [Sscanf 2.8 plugin](https://github.com/Y-Less/sscanf/releases)
* [Profiler 2.15 plugin](https://github.com/Zeex/samp-plugin-profiler)

### Filterscripts
Contains only the necessary filterscripts:
[afly](https://github.com/ins1x/debug-gamemode/blob/main/filterscripts/afly.pwn),
[attachments](https://github.com/ins1x/debug-gamemode/blob/main/filterscripts/attachments.pwn),
[flymode](https://github.com/ins1x/debug-gamemode/blob/main/filterscripts/flymode.pwn),
[fs_cmds](https://github.com/ins1x/debug-gamemode/blob/main/filterscripts/fs_cmds.pwn),
[fsdebug](https://github.com/ins1x/debug-gamemode/blob/main/filterscripts/fsdebug.pwn),
[http_test](https://github.com/ins1x/debug-gamemode/blob/main/filterscripts/http_test.pwn),
[netstats](https://github.com/ins1x/debug-gamemode/blob/main/filterscripts/netstats.pwn),
[npc_record](https://github.com/ins1x/debug-gamemode/blob/main/filterscripts/npc_record.pwn),
[ospawner](https://github.com/ins1x/debug-gamemode/blob/main/filterscripts/ospawner.pwn),
[pnetstats](https://github.com/ins1x/debug-gamemode/blob/main/filterscripts/pnetstats.pwn),
[samp_anims](https://github.com/ins1x/debug-gamemode/blob/main/filterscripts/samp_anims.pwn),
[skinchanger](https://github.com/ins1x/debug-gamemode/blob/main/filterscripts/skinchanger.pwn),
[specbar](https://github.com/ins1x/debug-gamemode/blob/main/filterscripts/specbar.pwn),
[test_cmds](https://github.com/ins1x/debug-gamemode/blob/main/filterscripts/test_cmds.pwn),
[vae](https://github.com/ins1x/debug-gamemode/blob/main/filterscripts/vae.pwn),
[vspawner](https://github.com/ins1x/debug-gamemode/blob/main/filterscripts/vspawner.pwn)

### Commands
**/respawn, /class, /kill, /slapme, /jetpack, /tpc**  
> To use more loadfs  **[test_cmds](https://github.com/ins1x/debug-gamemode/blob/main/filterscripts/test_cmds.pwn)**  
