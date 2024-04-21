script_author("1NS")
script_name("AbsoluteFix")
script_description("Set of fixes for Absolute Play servers")
script_properties("work-in-pause")
script_url("https://github.com/ins1x/useful-samp-stuff/tree/main/luascripts/absolutefix")
script_version("3.0.4")

-- script_moonloader(16) moonloader v.0.26
-- forked from https://github.com/ins1x/AbsEventHelper v1.5

-- If your don't play on Absolute Play servers
-- recommend use more functional script GameFixer by Gorskin
-- https://vk.com/@gorskinscripts-gamefixer-obnovlenie-30

require 'lib.moonloader'
local ffi = require"ffi"
local keys = require 'vkeys'
local sampev = require 'lib.samp.events'
local memory = require 'memory'
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8

----------------- [ cfg ] -------------------
local inicfg = require 'inicfg'
local configIni = "AbsoluteFix.ini"
local ini = inicfg.load({
   settings =
   {
      antiafk = true,
      anticrash = true,
	  autoreconnect = true,
      chatfilter = true,
      dialogfix = true,
      disablenotifications = true,
	  disablerecordnotifications = true,
      fastload = true,
      hideattachesonaim = true,
	  hidehousesmapicons = true,
      gamefixes = true,
      infinityrun = true,
      improvedrun = true,
      improvedbike = true,
      improvedjetpack = true,
      improvedairvehheight = true,
      keybinds = true,
      noeffects = false,
      nologo = false,
	  noradio = false,
      nogametext = false,
	  noweaponpickups = true,
      mapfixes = true,
      menupatch = true,
      pmsoundfix = true,
	  restoreremovedobjects = false,
	  recontime = 20000,
      vehvisualdmg = false
   },
}, configIni)
inicfg.save(ini, configIni)

-- If the server changes IP, change it here
local hostip = "193.84.90.23"

local isAbsoluteRoleplay = false
local removed_objects = {647, 1410, 1412, 1413} 
local restored_objects = {3337, 3244, 3276, 1290, 1540} 
local attached_objects = {}
local isPlayerSpectating = false
local dialogs = {}
local dialogRestoreText = false
local dialogIncoming = 0
local clickedplayerid = nil
local randomcolor = nil
local lastObjectId = nil

function main()
   if not isSampLoaded() or not isSampfuncsLoaded() then return end
      while not isSampAvailable() do wait(100) end
	  -- unload script if not Absolute play server
      local ip, port = sampGetCurrentServerAddress()
      if not ip:find(hostip) then
         thisScript():unload()
	  else
	     if port >= 7771 and port < 7777 then isAbsoluteRoleplay = true end
	     if port == 7111 then isAbsoluteRoleplay = true end -- testhost
	     sampAddChatMessage("{880000}Absolute Fix. {FFFFFF}Загружен", 0xFFFFFF)
      end
	  
      -- flickr
      if not doesFileExist(getGameDirectory() .. "\\flickr.asi") then
         writeMemory(0x5B8E55, 4, 0x15F90, true)
         writeMemory(0x5B8EB0, 4, 0x15F90, true)
	  end
			
	  -- remove "open Y menu" textdraw
      sampTextdrawDelete(423)
	  -- remove server site textdraw
	  sampTextdrawDelete(418)
	  -- remove server logo
	  if ini.settings.nologo then            
         sampTextdrawDelete(2048)
         sampTextdrawDelete(420)
      end
	  
	  if ini.settings.antiafk then
         -- dirty hack nop F1 and F4 keys functions
         memory.setuint8(getModuleHandle('samp.dll') + 0x67450, 0xC3, true)
         memory.write(sampGetBase()+0x797E, 0, 1, true)
	  end
      
	  -- fastload (Hide default loading screen like fastload.asi)
	  if ini.settings.fastload and not doesFileExist(getGameDirectory() .. "\\FastLoad.asi") then 
         if memory.getuint8(0x748C2B) == 0xE8 then
		    memory.fill(0x748C2B, 0x90, 5, true)
	     elseif memory.getuint8(0x748C7B) == 0xE8 then
		    memory.fill(0x748C7B, 0x90, 5, true)
	     end
	     if memory.getuint8(0x5909AA) == 0xBE then
		    memory.write(0x5909AB, 1, 1, true)
	     end
	     if memory.getuint8(0x590A1D) == 0xBE then
		    memory.write(0x590A1D, 0xE9, 1, true)
		    memory.write(0x590A1E, 0x8D, 4, true)
	     end
	     if memory.getuint8(0x748C6B) == 0xC6 then
       	    memory.fill(0x748C6B, 0x90, 7, true)
	     elseif memory.getuint8(0x748CBB) == 0xC6 then
		    memory.fill(0x748CBB, 0x90, 7, true)
	     end
	     if memory.getuint8(0x590AF0) == 0xA1 then
		    memory.write(0x590AF0, 0xE9, 1, true)
		    memory.write(0x590AF1, 0x140, 4, true)
	     end
	  end
	  
	  -- Deleting unnecessary sections in the menu in SA-MP
	  if ini.settings.menupatch then
	     memory.copy(0x8D0444, memory.strptr("\x36\x46\x45\x50\x5F\x52\x45\x53\x00\x0B\x00\x00\x40\x01\xAA\x00\x03\x00\x05\x46\x45\x48\x5F\x4D\x41\x50\x00\x0B\x05\x00\x40\x01\xC8\x00\x03\x00\x05\x46\x45\x50\x5F\x4F\x50\x54\x00\x0B\x21\x00\x40\x01\xE6\x00\x03\x00\x05\x46\x45\x50\x5F\x51\x55\x49\x00\x0B\x23\x00\x40\x01\x04\x01\x03\x00"), 72)
         memory.fill(0x8D048C, 0, 144)
         memory.write(0x8CE47B, 1, 1)
         memory.write(0x8CFD33, 2, 1)
         memory.write(0x8CFEF7, 3, 1)
	  end
	  
      if ini.settings.gamefixes then 
		 -- SADisplayResolutions(1920x1080// 16:9)
         memory.write(0x745BC9, 0x9090, 2, false) 
		 -- CJFix
         memory.fill(0x460773, 0x90, 7, false)
		 -- the helicopter doesn't explode many times
         memory.setuint32(0x736F88, 0, false) 
		 -- fix blackroads
         memory.write(8931716, 0, 4, false)
         -- enable this-blip
         memory.setuint8(0x588550, 0xEB, true)
         -- disable Replays
         writeMemory(0x460500, 1, 0xC3, true)

         -- binthesky by DK
         -- memory.fill(0x5557CF, 0x90, 7, true)
      
         memory.fill(0x748E6B, 0x90, 5, true) -- CGame::Shutdown
	     memory.fill(0x748E82, 0x90, 5, true) -- RsEventHandler rsRWTERMINATE
	     memory.fill(0x748E75, 0x90, 5, true) -- CAudioEngine::Shutdown
         
         -- Afk shift fix by FYP
		 memory.fill(0x00531155, 0x90, 5, true)
		 
         -- nop gamma 
		 --memory.hex2bin('E9D200000090', 0x0074721C, 5)
         
         -- fps fix
         memory.write(0x53E94C, 0, 1, false) --del fps delay 14 ms
         memory.setuint32(12761548, 1051965045, false) -- car speed fps fix
         writeMemory(7547174, 4, 8753112, true) -- limit lod veh
         
         -- birds on
         memory.write(5497200, 232, 1, false)
         memory.write(5497201, 1918619, 4, false)
         
         -- interior reflections
         memory.write(0x555854, 0x90909090, 4, false)
         memory.write(0x555858, 0x90, 1, false)
         
         -- fixing spawn with a bottle
         memory.fill(0x4217F4, 0x90, 21, false)
         memory.fill(0x4218D8, 0x90, 17, false)
         memory.fill(0x5F80C0, 0x90, 10, false)
         memory.fill(0x5FBA47, 0x90, 10, false)
		 
		 -- patch anim duck
		 writeMemory(0x692649+1, 1, 6, true)
         
         -- disable talking
         writeMemory(0x5EFFE7, 1, 0xEB, true)
         
         -- windsound bugfix
         local windsoundfix = allocateMemory(4)
         writeMemory(windsoundfix, 4, 1, true)
         writeMemory(0x506667+1, 4, windsoundfix, true)
         writeMemory(0x505BEB+1, 4, windsoundfix, true)
         
         -- fixloadmap
         memory.fill(0x584C6D, 0x90, 0x19, true)
         
         -- long armfix
         memory.write(7045634, 33807, 2, true)
         memory.write(7046489, 33807, 2, true)
         
      end
      
      if ini.settings.anticrash then
		 -- AntiCrash R1
		 local base = sampGetBase() + 0x5CF2C
         writeMemory(base, 4, 0x90909090, true)
         base = base + 4
         writeMemory(base, 1, 0x90, true)
         base = base + 9
         writeMemory(base, 4, 0x90909090, true)
         base = base + 4
         writeMemory(base, 1, 0x90, true)
      end
         
      if ini.settings.infinityrun then
         -- infinity run
         memory.setint8(0xB7CEE4, 1)
      end
      
      if ini.settings.improvedrun then
         -- interior run
         memory.write(5630064, -1027591322, 4, false)
         memory.write(5630068, 4, 2, false)
      end
          
      if ini.settings.improvedjetpack then 
         -- Jetpack MaxHeight fix
         memory.write(0x67F268, 121, 1, false)
      end
	  
      if ini.settings.improvedairvehheight then 
         -- Max helicopter height
         memory.write(0x6D261D, 235, 1, false)
      end      
      
      if ini.settings.noeffects then
         -- nodust
         memory.write(7205311, 1056964608, 4, false)
         memory.write(7205316, 1065353216, 4, false)
         memory.write(7205321, 1065353216, 4, false)
         memory.write(7205389, 1056964608, 4, false)
         memory.write(7204123, 1050253722, 4, false)
         memory.write(7204128, 1065353216, 4, false)
         memory.write(7204133, 1060320051, 4, false)
         memory.write(5527777, 1036831949, 4, false)
         memory.write(4846974, 1053609165, 4, false)
         memory.write(4846757, 1053609165, 4, false)
         
		 -- no sand particle
		 memory.fill(0x6AA8CF, 0x90, 53, true)
         
		 -- noshadows
         memory.write(5497177, 233, 1, false)
         memory.write(5489067, 492560616, 4, false)
         memory.write(5489071, 0, 1, false)
         memory.write(6186889, 33807, 2, false)
         memory.write(7388587, 111379727, 4, false)
         memory.write(7388591, 0, 2, false)
         memory.write(7391066, 32081167, 4, false)
         memory.write(7391070, -1869611008, 4, false)
         
         -- disable Blue Fog
         -- memory.fill(0x575B0E, 0x90, 5, true)
         
         -- disable Haze Effect
         -- memory.write(0x72C1B7, 0xEB, 1, true)
         
         -- NoStencilShadows
         memory.write(0x70BDAC, 0x84, false);
      end
	  
	  if ini.settings.noradio then
	     memory.copy(0x4EB9A0, memory.strptr('\xC2\x04\x00'), 3, true)
	  end
	  
      -- MapFix
      if ini.settings.mapfixes then
         -- restore statue on spawn LS
         local tmpobjid = createObject(2744, 423.1, -1558.3, 26.3)
         setObjectHeading(tmpobjid, 202.8)
         
         -- replacing invisible roadsign by tree
         createObject(700, 724.05, 1842.88, 4.9)
      end
      
      --- END init
      while true do
      wait(0)
      
	  -- Autoreconnect
	  -- Required use reset_remove.asi fix
	  if ini.settings.autoreconnect then
	     local chatstring = sampGetChatString(99)
         if chatstring == "Server closed the connection." 
		 or chatstring == "You are banned from this server."
		 or chatstring == "Use /quit to exit or press ESC and select Quit Game" then
	        sampDisconnectWithReason(false)
            sampAddChatMessage("Wait reconnecting...", 0xa9c4e4ff)
            wait(ini.settings.recontime)
            sampSetGamestate(1)-- GAMESTATE_WAIT_CONNECT
         end
	  end

      -- chatfix
      if isKeyJustPressed(0x54) and not sampIsDialogActive() and not sampIsScoreboardOpen() and not isSampfuncsConsoleActive() then
         sampSetChatInputEnabled(true)
      end
      
      -- nobike
      if ini.settings.improvedbike then
         if isCharInAnyCar(PLAYER_PED) then
            setCharCanBeKnockedOffBike(PLAYER_PED, true)
         else
            setCharCanBeKnockedOffBike(PLAYER_PED, false)
         end
         if isCharInAnyCar(PLAYER_PED) and isCarInWater(storeCarCharIsInNoSave(PLAYER_PED)) then
            setCharCanBeKnockedOffBike(PLAYER_PED, false)
         end
      end
	  
      if ini.settings.antiafk then
         writeMemory(7634870, 1, 1, 1)
         writeMemory(7635034, 1, 1, 1)
         memory.fill(7623723, 144, 8)
         memory.fill(5499528, 144, 6)
      else
         memory.setuint8(7634870, 0, false)
         memory.setuint8(7635034, 0, false)
         memory.hex2bin('0F 84 7B 01 00 00', 7623723, 8)
         memory.hex2bin('50 51 FF 15 00 83 85 00', 5499528, 6)
      end
    
	  -- hide attachet object if player aiming by sniper rifle, camera, rpg
      if ini.settings.hideattachesonaim then
	     if isKeyDown(VK_RBUTTON) then
		    if isCurrentCharWeapon(PLAYER_PED, 34) or isCurrentCharWeapon(PLAYER_PED, 43) or 
			isCurrentCharWeapon(PLAYER_PED, 35) or isCurrentCharWeapon(PLAYER_PED, 36) then
	           for i, objid in pairs(getAllObjects()) do
			      pX, pY, pZ = getCharCoordinates(PLAYER_PED)
			      _, objX, objY, objZ = getObjectCoordinates(objid)
			      local ddist = getDistanceBetweenCoords3d(pX, pY, pZ, objX, objY, objZ)
			      if ddist < 1 and attached_objects[objid] ~= false then
			         setObjectVisible(objid, false)
				     attached_objects[objid] = false
			      end
		       end
			end
	     else
	        for i, objid in pairs(getAllObjects()) do
			   if attached_objects[objid] == false then
			      pX, pY, pZ = getCharCoordinates(PLAYER_PED)
				  _, objX, objY, objZ = getObjectCoordinates(objid)
				  local ddist = getDistanceBetweenCoords3d(pX, pY, pZ, objX, objY, objZ)
				  if attached_objects[objid] == false then
				     setObjectVisible(objid, true)
					 attached_objects[objid] = true
		     	  end
		       end
		    end
	     end
      end
      
      -- no dialogs restore (by rraggerr)
      if ini.settings.dialogfix then
         if dialogIncoming ~= 0
         and dialogs[dialogIncoming] then
            local data = dialogs[dialogIncoming]
            if data[1] and not dialogRestoreText then
               -- ignore delete option restore on edit dialog
               if dialogIncoming == 1403 and data[1] == 1 then
                  sampSetCurrentDialogListItem(0)
               else
                  sampSetCurrentDialogListItem(data[1])
               end
            end
            if data[2] then
               -- dialog random color autocomplete
               if dialogIncoming == 1496 and randomcolor ~= nil then
                  sampSetCurrentDialogEditboxText(randomcolor)
               elseif dialogIncoming == 43 and randomcolor ~= nil then
                  sampSetCurrentDialogEditboxText(randomcolor)
               else
                  sampSetCurrentDialogEditboxText(data[2])
               end
            end
            dialogIncoming = 0
         end
      end
	  
	  -- won't let you get stuck in another player's skin. 
	  for i = 0, sampGetMaxPlayerId(false) do
		 if sampIsPlayerConnected(i) then
		    local result, id = sampGetCharHandleBySampPlayerId(i)
			if result and doesCharExist(id) then
			   local x, y, z = getCharCoordinates(id)
			   local mX, mY, mZ = getCharCoordinates(playerPed)
			   if 0.4 > getDistanceBetweenCoords3d(x, y, z, mX, mY, mZ) then
				  setCharCollision(id, false)
			   end
			end
	     end
      end
	  
	  -- delete trash objects fences 
	  if ini.settings.restoreremovedobjects then
	     for _, v in pairs(getAllObjects()) do
			local model = getObjectModel(v)
			for key, value in ipairs(removed_objects) do
			   if model == value then 
			      if doesObjectExist(v) then deleteObject(v) end 
			   end 
			end
		 end
	  end
	  
	  -- disable visual damage on gm car
	  if ini.settings.vehvisualdmg then
	     if isCharInAnyCar(PLAYER_PED) then
		    local car = getCarCharIsUsing(PLAYER_PED)
			local health = getCarHealth(car)
			if health > 1000.0 then
		       setCarCanBeVisiblyDamaged(car, false)
			end
		 end
	  end
	  
      -- Absolute Play Key Binds
      -- Sets hotkeys that are only available with the samp addon
      if ini.settings.keybinds then
	     -- fix Y menu call on spectate mode 
	     if isKeyJustPressed(VK_Y) and isPlayerSpectating and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
		    sampSendChat("/menu")
		 end
         
		 -- When switching the language Alt+Shift Shift is no longer triggered and the player does not jump
		 if isKeyDown(VK_LSHIFT) and isKeyJustPressed(VK_LMENU) and sampIsChatInputActive() and not isPauseMenuActive() and not isCharInAnyCar(PLAYER_PED) then
		    clearCharTasksImmediately(PLAYER_PED)
			setPlayerControl(playerHandle, 1)
			freezeCharPosition(PLAYER_PED, false)
         end		 
		 
		 -- The Tab key does not trigger a shot when aiming
		 if isKeyDown(VK_RBUTTON) and isKeyDown(VK_TAB) and not isCharInAnyCar(PLAYER_PED) then
		    clearCharTasksImmediately(PLAYER_PED)
		 end 
		 
		 -- Open last chosen player dialog (only if samp addon not installed)
	     if not isSampAddonInstalled and isKeyJustPressed(VK_B)
	     and not sampIsChatInputActive() and not isPauseMenuActive()
	     and not sampIsDialogActive() and not isSampfuncsConsoleActive() then 
		    if clickedplayerid then
		       if sampIsPlayerConnected(clickedplayerid) then 
			      sampSendChat("/и " .. clickedplayerid)
			   end
		    end
	     end 
		 
		 -- ALT + RMB show player stats
		 if isKeyDown(VK_RBUTTON) and isKeyJustPressed(VK_MENU) and not sampIsChatInputActive() and not isPauseMenuActive() and isCharInAnyCar(PLAYER_PED) then
		    if(getClosestPlayerId() ~= -1) then
			   sampSendChat(string.format("/cnfn %i", getClosestPlayerId()))
			end
         end	
		 
		 if isAbsoluteRoleplay then
            if isKeyJustPressed(VK_K) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then sampSendChat("/gps") end
		 else
		    if isKeyJustPressed(VK_K) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then sampSendChat("/vfibye2") end
		 end	
         
		 if isAbsoluteRoleplay then
            if isKeyJustPressed(VK_P) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then sampSendChat("/phone") end
		 
            if isKeyJustPressed(VK_I) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then sampSendChat("/inv") end
		 end
		 
         if isPlayerSpectating then
            if isKeyJustPressed(VK_N) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
               if lastObjectId ~= nil then
                  editObjectBySampId(lastObjectId, false)
               end
            end
         end
         
         if isKeyJustPressed(VK_M) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then sampSendChat("/vfibye") end
      
         if isKeyJustPressed(VK_U) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then sampSendChat("/anim") end
      
         if isKeyJustPressed(VK_J) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then sampSendChat("/gjktn") end
	     
		 -- if Player in Vehicle
	     if isCharInAnyCar(PLAYER_PED) then
	        if isKeyJustPressed(VK_L) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then sampSendChat("/lock") end
	        
            if not isAbsoluteRoleplay then
               if isKeyJustPressed(VK_H) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then  sampSendChat("/f") end
               
			   if isKeyJustPressed(VK_Z) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then sampSendChat("/xbybnm") end
            end   
		 end
		 
		 -- Switching textdraws with arrow buttons, mouse buttons, pgup-pgdown keys
	     if isKeyJustPressed(VK_LEFT) or isKeyJustPressed(VK_XBUTTON1) or isKeyJustPressed(VK_PRIOR) and sampIsCursorActive() and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then sampSendClickTextdraw(36) end
	  
	     if isKeyJustPressed(VK_RIGHT) or isKeyJustPressed(VK_XBUTTON2) or isKeyJustPressed(VK_NEXT) and sampIsCursorActive() and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then sampSendClickTextdraw(37) end
      end 
	  
      -- END main
   end
end

-- Macro
function doesFileExist(path)
   -- work like doesDirectoryExist(string directory)
   -- result: ans = file_exists("sample.txt")
   local f=io.open(path,"r")
   if f~=nil then io.close(f) return true else return false end
end

function getClosestPlayerId()
    local closestId = -1
    mydist = 30
    local x, y, z = getCharCoordinates(PLAYER_PED)
    for i = 0, 999 do
        local streamed, pedID = sampGetCharHandleBySampPlayerId(i)
        if streamed and getCharHealth(pedID) > 0 and not sampIsPlayerPaused(pedID) then
            local xi, yi, zi = getCharCoordinates(pedID)
            local dist = getDistanceBetweenCoords3d(x, y, z, xi, yi, zi)
            if dist <= mydist then
                mydist = dist
                closestId = i
            end
        end
    end
    return closestId
end

function editObjectBySampId(id, playerobj) 
   if isSampAvailable() then
      ffi.cast("void (__thiscall*)(unsigned long, short int, unsigned long)", sampGetBase() + 0x6DE40)(readMemory(sampGetBase() + 0x21A0C4, 4), id, playerobj and 1 or 0)
   end
end

-- Hooks
function sampev.onServerMessage(color, text)
   -- Some functions are prohibited on Arizona
   if text:find('Добро пожаловать на Arizona Role Play!') then
      thisScript():unload()
   end
   
   if ini.settings.chatfilter then 
      if text:find("подключился к серверу") or text:find("вышел с сервера") then
         chatlog = io.open(getFolderPath(5).."\\GTA San Andreas User Files\\SAMP\\chatlog.txt", "a")
         chatlog:write(os.date("[%H:%M:%S] ")..text)
         chatlog:write("\n")
         chatlog:close()
         return false
      end
   end
   
   if ini.settings.disablenotifications then
	  -- ignore various server flood mesages
	  if text:find("не засчитан") then
         return false
      end
	  
      if text:find("выхода из читмира") then
         return false
      end
      
      if text:find("выпустить могут только админы") then
         return false
      end
   
      if text:find("Ни 1 клан не создан") then
         return false
      end
      
      if text:find("Громкость музыки зависит от громкости радио") then
         return false
      end
      
      if text:find("Рекорд игроков на сервере") then
         return false
      end
      
      if text:find("Ты слишком далеко от транспорта") then
         return false
      end
      
      if text:find("Вконтакте") then
         return false
      end

      if text:find("У тебя устаревшая версия клиента") then
         return false
      end
      
      if text:find("Рекомендуется скачать последнюю версию с нашего сайта") then
         return false
      end
      
      if text:find("Никто не смог решить вопрос терминала загадок") then
         return false
      end
      
      -- if text:find("Ты не можешь уйти в АФК на улице") then
         -- return {color, text.." (Тут кругом маньяки)"}
      -- end
      
      if text:find("Клавиша Y") then
         if text:find("Основное меню") then
            return false
         end
      end
      
   end
   
   if ini.settings.disablerecordnotifications then
      -- ignore record flood mesages
   	  if text:find("рекорд дрифта") then
         return false
      end
	  
	  if text:find("рекорд в безумном трюке") then
         return false
      end
	  
	  if text:find("рекорд в трюке") then
         return false
      end
   end
   
   if ini.settings.pmsoundfix then
      if text:find("{00FF00}ЛС") then
	     addOneOffSound(0.0, 0.0, 0.0, 1138) -- CHECKPOINT_GREEN
         return true
	  end
   end
end

function sampev.onTogglePlayerSpectating(state)
   isPlayerSpectating = state
end

function sampev.onDisplayGameText(style, time, text)
   -- hide /dv message (Транспорт восстановлен 1000$)
   if style == 3 and text:find("1000$") then
      return false
   end
   if ini.settings.nogametext then 
      return false
   end
end

function sampev.onCreatePickup(id, model, pickupType, position)
   -- disable weapon pickups (exclude jetpack, armour, parachute)
   if ini.settings.noweaponpickups and model >= 325 and model <= 373 then
      if model ~= 370 and model ~= 371 and model ~= 373 then 
	     return false
	  end
   end
end 

function sampev.onSetMapIcon(iconId, position, type, color, style)
   if ini.settings.hidehousesmapicons then
	-- hide free houses mapicons
	  if(style == 0 and type == 31) then 
	     return false
	  end
   end
   
   if ini.settings.anticrash then
      local MAX_SAMP_MARKERS = 63
      if type > MAX_SAMP_MARKERS then
         return false
      end
   end
end

function sampev.onSendDialogResponse(dialogId, button, listboxId, input)
   if ini.settings.gamefixes then
      dialogs[dialogId] = {listboxId, input}
   end
   
   if dialogId == 100 and listboxId == 2 and button == 1 then
      sampAddChatMessage("Примечание: Стоимость 500$ за любой", -1)
   end
   
end

function sampev.onShowDialog(dialogId, style, title, button1, button2, text)
   if ini.settings.dialogfix then
      dialogIncoming = dialogId
   end
   
   if dialogId == 1496 then
      randomcolor = string.sub(text, string.len(text)-6, #text-1)
	  setClipboardText(randomcolor)
   end

   if dialogId == 43 then
      randomcolor = string.sub(text, string.len(text)-36, #text-30)
	  setClipboardText(randomcolor)
   end
   
   if ini.settings.dialogfix then
      -- hide buy a house dialog 
      if dialogId == 118 then
	     sampSendDialogResponse(118, 0, 1)
		 sampCloseCurrentDialogWithButton(0)
         return false
      end
      
      -- hide aftercrash dialog
      if dialogId == 931 then
         sampSendDialogResponse(931, 0, 1)
         sampCloseCurrentDialogWithButton(0)
         return false
      end
   end
   
   -- hide change nickname dialog after login with non-RP nickname
   if isAbsoluteRoleplay and ini.settings.dialogfix then
      if dialogId == 20153 then
         sampSendDialogResponse(20153, 0, 1)
         sampCloseCurrentDialogWithButton(0)
         return false
      end
   end
   
   if dialogId == 14 then
      local newtext = 
      "Оружие при появлении\t\n"..
      "Цвет\t\n"..
      "Регенерация здоровья\t\n"..
      "Ремонт авто 'На ходу'\t\n"..
      "Слежка за игроком\t\n"..
      "Заказ транспорта\t\n"..
      "Регенерация брони\t\n"..
      "Прикрепление транспорта\t\n"..
      "Улучшение Дома - Бизнеса\t\n"..
      "Бесконечный бег\t"..(ini.settings.infinityrun and '{00FF00}(Включено)' or '{555555}Отключено').."{00FF00}\n"..
      "Стрельба с JetPack\t{555555}(SA-MP Addon не установлен){00FF00}\n"..
      "Уровень бизнеса\t\n"..
      "Улучшенный бег\t"..(ini.settings.improvedrun and '{00FF00}(Включено)' or '{555555}Отключено').."{00FF00}\n"..
      "Вождение 2-х колёсного транспорта\t"..(ini.settings.improvedbike and '{00FF00}(Включено)' or '{555555}Отключено').."{00FF00}\n"..
      "Вождение воздушного транспорта\t"..(ini.settings.improvedairvehheight and '{00FF00}(Включено)' or '{555555}Отключено').."{00FF00}\n"..
      "Улучшенный JetPack\t"..(ini.settings.improvedjetpack and '{00FF00}(Включено)' or '{555555}Отключено').."{00FF00}\n"
      return {dialogId, 4, title, button1, button2, newtext}
   end
   
   if dialogId == 24 then 
      return {dialogId, style, title, button1, button2, text.."\nДля того чтобы быстро отцепить транспорт войди в наблюдение (/набл 0)"}
   end
   
   if dialogId == 1700 then
      local newtext = "Интерфейс\nЦвет интерфейса\nЗвук\nГрафика\nInternet радио\nЧат\nАккаунт\nДругое"
      return {dialogId, style, title, button1, button2, newtext}
   end
   
end

function sampev.onSendClickPlayer(playerId, source)
   clickedplayerid = playerId
end

function round(num, idp)
   local mult = 10^(idp or 0)
   return math.floor(num * mult + 0.5) / mult
end

function sampev.onCreateObject(objectId, data)
   -- Fix Crash the game when creating a crane object 1382
   if data.modelId == 1382 then return false end
   
   if ini.settings.mapfixes then 
      -- Fix double created objects 
      if data.modelId == 16563 and round(data.position.x, 3) == -222.195 then 
         return false
      end
      
      if data.modelId == 6431 and round(data.position.x, 4) == -233.8828 then 
         return false
      end
       
      if data.modelId == 6421 and round(data.position.x, 4) == 137.3984 then
         return false
      end
      
      if data.modelId == 8849 and round(data.position.x, 4) == 2764.1797 then
         return false
      end
      
      if data.modelId == 1344 and round(data.position.x, 4) == 2764.9766 then
         return false
      end
      
      if data.modelId == 6399 and round(data.position.x, 4) == 552.4297 then
         return false
      end
      
      if data.modelId == 7510 and round(data.position.x, 4) == 1370.3594 then
         return false
      end
      
      if data.modelId == 640 then
         if round(data.position.x, 4) == 1335.8281 or
            round(data.position.x, 4) == 1302.2266 then
            return false
         end
      end
       
      -- Debug
      -- if data.modelId == 7510 then
         -- local px, py, pz = getCharCoordinates(PLAYER_PED)
         -- local distance = string.format("%.0f", getDistanceBetweenCoords3d(data.position.x, data.position.y, data.position.z, px, py, pz))
         -- print(distance, data.position.x, round(data.position.x, 4))
      -- end
   end
end

function sampev.onSendEditObject(playerObject, objectId, response, position, rotation)
   lastObjectId = objectId
end
 
function sampev.onRemoveBuilding(modelId, position, radius)
   if ini.settings.restoreremovedobjects then
	  return false
   else 
      for key, value in ipairs(restored_objects) do
         if modelId == value then 
            return false
         end
      end   
   end
end

function sampev.onSetVehicleVelocity(turn, velocity)
   if ini.setting.anticrash then
      if velocity.x ~= velocity.x or velocity.y ~= velocity.y or velocity.z ~= velocity.z then
         sampAddChatMessage("Warning: ignoring invalid SetVehicleVelocity", -1)
         return false
      end
   end
end

-- END hooks

-- Thanks Heroku for this function on !SAPatcher
function onSendRpc(id, bs, priority, reliability, channel, shiftTimestamp)
   if ini.settings.anticrash then
       -- Fix ClickMap height detection when setting a placemark on the game map
      if id == 119 then
         local posX, posY, posZ = raknetBitStreamReadFloat(bs), raknetBitStreamReadFloat(bs), raknetBitStreamReadFloat(bs)
         requestCollision(posX, posY)
         loadScene(posX, posY, posZ)
         local res, x, y, z = getTargetBlipCoordinates()
         if res then
              local new_bs = raknetNewBitStream()
              raknetBitStreamWriteFloat(new_bs, x)
              raknetBitStreamWriteFloat(new_bs, y)
              raknetBitStreamWriteFloat(new_bs, z + 0.5)
           raknetSendRpcEx(119, new_bs, priority, reliability, channel, shiftTimestamp)
           raknetDeleteBitStream(new_bs)
         end
         return false
      end

      if id == 153 then
         local playerId = raknetBitStreamReadInt32(bs)
         local modelId = raknetBitStreamReadInt32(bs)
         
         -- Fixes a SAMP crash related to the installation of an invalid player skin model.
         -- works only on the R1 version of the client, Kalcor has already built this fix into R3.
         if modelId < 0 or modelId == 65535 then
            sampAddChatMessage("Warning: The server is trying to set invalid skin model (model: "
            .. modelId .. ")", -1)
            return false
         end
         
         -- Fixes the crash of SA-MP (0x006E3D17) associated with the installation of the skin in the car.	  
         local result, myId = sampGetPlayerIdByCharHandle(PLAYER_PED)
         if result then
            if playerId == myId then
               if isCharInAnyCar(PLAYER_PED) then
                  sampAddChatMessage("Warning: The server is trying to set the skin in the car.", -1)
                  return false
               end
            end
         end
      end
   end
end
