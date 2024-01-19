script_author("1NS")
script_name("AbsoluteFix")
script_description("Set of fixes for Absolute Play servers")
script_dependencies('imgui', 'lib.samp.events', 'vkeys')
script_properties("work-in-pause")
script_url("https://github.com/ins1x/useful-samp-stuff/tree/main/luascripts/absolutefix")
script_version("1.9.9")

-- script_moonloader(16) moonloader v.0.26
-- forked from https://github.com/ins1x/AbsEventHelper v1.5

-- If your don't play on Absolute Play servers
-- recommend use more functional script GameFixer by Gorskin
-- https://vk.com/@gorskinscripts-gamefixer-obnovlenie-30

require 'lib.moonloader'
local keys = require 'vkeys'
local sampev = require 'lib.samp.events'
local imgui = require 'imgui'
local memory = require 'memory'
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8

------------------------[ cfg ] -------------------
local inicfg = require 'inicfg'
local configIni = "AbsoluteFix.ini"
local ini = inicfg.load({
   settings =
   {
      antiafk = true,
      chatfilter = true,
      keybinds = true,
      gamefixes = true,
      noeffects = false,
      nologo = false,
	  nopostfx = false,
	  noradio = false,
      nogametext = false,
	  fastload = true,
	  menupatch = true,
	  noweaponpickups = true,
	  hideattachesonaim = true,
	  hidehousesmapicons = true,
	  fixdarktimecyc = false,
	  restoreremovedobjects = false,
	  vehvisualdmg = false,
	  fixtimecycvalue = 0.2,
	  recontime = 10000,
      addonupgrades = true,
	  autoreconnect = true,
	  pmsoundfix = true,
	  disablenotifications = true,
	  invalidmodelsfix = true
   },
}, configIni)
inicfg.save(ini, configIni)

function save()
    inicfg.save(ini, configIni)
end
---------------------------------------------------------

local sizeX, sizeY = getScreenResolution()
local v = nil

local dialog = {
   settings = imgui.ImBool(false)
}

local checkbox = {
   antiafk = imgui.ImBool(ini.settings.antiafk),
   chatfilter = imgui.ImBool(ini.settings.chatfilter),
   keybinds = imgui.ImBool(ini.settings.keybinds),
   gamefixes = imgui.ImBool(ini.settings.gamefixes),
   noeffects = imgui.ImBool(ini.settings.noeffects),
   nologo = imgui.ImBool(ini.settings.nologo),
   nopostfx = imgui.ImBool(ini.settings.nopostfx),
   noweaponpickups = imgui.ImBool(ini.settings.noweaponpickups),
   hideattachesonaim = imgui.ImBool(ini.settings.hideattachesonaim),
   hidehousesmapicons = imgui.ImBool(ini.settings.hidehousesmapicons),
   fixdarktimecyc = imgui.ImBool(ini.settings.fixdarktimecyc),
   restoreremovedobjects = imgui.ImBool(ini.settings.restoreremovedobjects),
   addonupgrades = imgui.ImBool(ini.settings.addonupgrades)
}

-- If the server changes IP, change it here
local hostip = "193.84.90.23"
local dialogs = {}
local removed_objects = {647, 1410, 1412, 1413, 1447} -- exclude objects here
local attached_objects = {}
local teammatesTable = {}
local teammatesTag = "brutal" -- example team tag
local showReconnectedTeammates = false
local isPlayerSpectating = false
local dialogRestoreText = false
local dialogIncoming = 0
local isTabmenuActive = false
local clickedplayerid = nil
-- mods finder
local ENBSeries = false
local FastloadAsi = false
local SAMPFUNCS = false

function imgui.OnDrawFrame()    
    
   if dialog.settings.v then      
      imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 7, sizeY / 4),
      imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
     
      imgui.Begin(u8"AbsoluteFix", dialog.settings)
       
      imgui.TextColoredRGB("Набор исправлений и дополнений для серверов {007DFF}Absolute Play")
	  if imgui.IsItemClicked() then
         setClipboardText("gta-samp.ru")
         printStringNow("Url copied to clipboard", 1000)
      end
	  
	  imgui.Text(u8" ")

      if imgui.Checkbox(u8("Фикс горячих клавиш аддона"), checkbox.keybinds) then 
         if checkbox.keybinds.v then
            ini.settings.keybinds = not ini.settings.keybinds
         end
		 save()
      end
      imgui.SameLine()
      imgui.TextQuestion("( ? )", u8"Восстанавливает стандартные горячие клавиши доступные с samp addon")

      if imgui.Checkbox(u8("Включить фиксы игры"), checkbox.gamefixes) then 
        if checkbox.gamefixes.v then
            ini.settings.gamefixes = not ini.settings.gamefixes
         end
		 save()
      end
      imgui.SameLine()
      imgui.TextQuestion("( ? )", u8"Включает некоторые фиксы багов игры (Нужен релог для применения)")
      
      if imgui.Checkbox(u8("Включить работу апгрейдов"), checkbox.addonupgrades) then 
        if checkbox.addonupgrades.v then
            ini.settings.addonupgrades = not ini.settings.addonupgrades
         end
		 save()
      end
      imgui.SameLine()
      imgui.TextQuestion("( ? )", u8"Включает улучшения - бесконечный бег, бег в интерьере, анти падение с байка")
       
      if imgui.Checkbox(u8"Отключить эффекты", checkbox.noeffects) then
         if checkbox.noeffects.v then
            ini.settings.noeffects = not ini.settings.noeffects
         end
		 save()
      end
       
      imgui.SameLine()
      imgui.TextQuestion("( ? )", u8"Отключает эффекты дыма, пыли, тени (требуется релог)")

	  if imgui.Checkbox(u8"Активировать nopostfx", checkbox.nopostfx) then
	     ini.settings.nopostfx = not ini.settings.nopostfx
		 if ini.settings.nopostfx then 
	        memory.write(7358318, 2866, 4, false) --postfx off
            memory.write(7358314, -380152237, 4, false) --postfx off
	     else
 		    memory.write(7358318, 1448280247, 4, false) --postfx on
            memory.write(7358314, -988281383, 4, false) --postfx on
		 end 
		 save()
	  end
      imgui.SameLine()
      imgui.TextQuestion("( ? )", u8"Отключает пост-обработку (PostFX)")
	  
	  if imgui.Checkbox(u8"Исправить темный таймцикл", checkbox.fixdarktimecyc) then
	     ini.settings.fixdarktimecyc = not ini.settings.fixdarktimecyc
		 if not ini.settings.fixdarktimecyc then
	        memory.write(6359759, 217, 1, false)
            memory.write(6359760, 21, 1, false)
            memory.write(6359761, 96, 1, false)
            memory.write(6359762, 208, 1, false)
            memory.write(6359763, 140, 1, false)
            memory.write(6359764, 0, 1, false)
            memory.write(6359778, 199, 1, false)
            memory.write(6359779, 5, 1, false)
            memory.write(6359780, 96, 1, false)
            memory.write(6359781, 208, 1, false)
            memory.write(6359782, 140, 1, false)
            memory.write(6359783, 0, 1, false)
            memory.write(6359784, 0, 1, false)
            memory.write(6359785, 0, 1, false)
            memory.write(6359786, 128, 1, false)
            memory.write(6359787, 63, 1, false)
            memory.write(5637016, 12043448, 4, false)
            memory.write(5637032, 12043452, 4, false)
            memory.write(5637048, 12043456, 4, false)
            memory.write(5636920, 12043424, 4, false)
            memory.write(5636936, 12043428, 4, false)
            memory.write(5636952, 12043432, 4, false)
			
			memory.setfloat(9228384, 0.0, false) -- allambient
		    memory.setfloat(12044024, 0.0, false) -- objambient
		    memory.setfloat(12044048, 0.0, false) -- worldambientR
            memory.setfloat(12044072, 0.0, false) -- worldambientG
            memory.setfloat(12044096, 0.0, false) -- worldambientB
		 end
		 save()
	  end
      imgui.SameLine()
      imgui.TextQuestion("( ? )", u8"Исправляет темные текстуры и освещение игры (аналог gammafix)")
	  
	  if imgui.Checkbox(u8("Фильтр подключений в чате"), checkbox.chatfilter) then
         if checkbox.chatfilter.v then
            ini.settings.chatfilter = not ini.settings.chatfilter
         end
		 save()
      end
	  
      imgui.SameLine()
      imgui.TextQuestion("( ? )", u8"Убирает сообщения о подключениях-отключениях игроков в общем чате")
      
      if imgui.Checkbox(u8("Анти-афк"), checkbox.antiafk) then 
         if checkbox.antiafk.v then
            ini.settings.antiafk = not ini.settings.antiafk
         end
		 save()
      end
       
      imgui.SameLine()
      imgui.TextQuestion("( ? )", u8"При сворачивании окна игрок не будет уходить в афк")
	  
	  if imgui.Checkbox(u8("Скрывать пикапы оружия"), checkbox.noweaponpickups) then 
         if checkbox.noweaponpickups.v then
            ini.settings.noweaponpickups = not ini.settings.noweaponpickups
         end
		 save()
      end
       
      imgui.SameLine()
      imgui.TextQuestion("( ? )", u8"Удаляет пикапы оружия из зоны стрима (Повышает FPS)")
	  
	  if imgui.Checkbox(u8("Скрывать иконки свободных домов"), checkbox.hidehousesmapicons) then 
         if checkbox.hidehousesmapicons.v then
            ini.settings.hidehousesmapicons = not ini.settings.hidehousesmapicons
         end
		 save()
      end
       
      imgui.SameLine()
      imgui.TextQuestion("( ? )", u8"Удаляет иконки свободных домов (Повышает FPS)")
	  
	  if imgui.Checkbox(u8("Скрывать аттачи при прицеливании"), checkbox.hideattachesonaim) then 
         if checkbox.hideattachesonaim.v then
            ini.settings.hideattachesonaim = not ini.settings.hideattachesonaim
         end
		 save()
      end
	  
      imgui.SameLine()
      imgui.TextQuestion("( ? )", u8"Скрывает аттачи(аксессуары) с игрока при прицеливании c кемпы, рпг или использовании фотоаппарата")
	  
	  if imgui.Checkbox(u8("Восстановить удаленные объекты"), checkbox.restoreremovedobjects) then 
         if checkbox.restoreremovedobjects.v then
            ini.settings.restoreremovedobjects = not ini.settings.restoreremovedobjects
			if ini.settings.restoreremovedobjects then
			   sampAddChatMessage("Для применения данной опции необходимо перезайти", -1)
			end
         end
		 save()
      end
	  
      imgui.SameLine()
      imgui.TextQuestion("( ? )", u8"Восстанавливает удаленные объекты деревьев и столбов с улиц (требуется релог)")
        
	  imgui.Text(" ")
      imgui.End()
   end
end

function main()
   if not isSampLoaded() or not isSampfuncsLoaded() then return end
      while not isSampAvailable() do wait(100) end
	  -- unload script if not Absolute play server
      local ip, port = sampGetCurrentServerAddress()
      if not ip:find(hostip) then
         thisScript():unload()
	  else
	     sampAddChatMessage("{00BFFF}Absolute {FFD700}Fix. {FFFFFF}Открыть настройки {FFD700}/absfix", 0xFFFFFF)
      end
	  
	  -- ENB check
	  if doesFileExist(getGameDirectory() .. "\\enbseries.asi") or 
	  doesFileExist(getGameDirectory() .. "\\d3d9.dll") then
	     ENBSeries = true
	  end
	  
	  if doesFileExist(getGameDirectory() .. "\\FastLoad.asi") then
	     FastloadAsi = true
	  end
	  
      -- commands section
      sampRegisterChatCommand("absfix", function ()
	     if not ENBSeries then dialog.settings.v = not dialog.settings.v end
      end)
			
	  -- remove "open Y menu" textdraw
      sampTextdrawDelete(423)
	  -- remove server site textdraw
	  sampTextdrawDelete(418)
	  -- remove server logo
	  if ini.settings.nologo then            
         sampTextdrawDelete(2048)
         sampTextdrawDelete(420)
      end
	  
	  if(ini.settings.antiafk) then
         -- dirty hack nop F1 and F4 keys functions
         memory.setuint8(getModuleHandle('samp.dll') + 0x67450, 0xC3, true)
         memory.write(sampGetBase()+0x797E, 0, 1, true)
	  end
      
	  -- fastload (Hide default loading screen like fastload.asi)
	  if(ini.settings.fastload) and not FastloadAsi then 
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
	  if(ini.settings.menupatch) then
	     memory.copy(0x8D0444, memory.strptr("\x36\x46\x45\x50\x5F\x52\x45\x53\x00\x0B\x00\x00\x40\x01\xAA\x00\x03\x00\x05\x46\x45\x48\x5F\x4D\x41\x50\x00\x0B\x05\x00\x40\x01\xC8\x00\x03\x00\x05\x46\x45\x50\x5F\x4F\x50\x54\x00\x0B\x21\x00\x40\x01\xE6\x00\x03\x00\x05\x46\x45\x50\x5F\x51\x55\x49\x00\x0B\x23\x00\x40\x01\x04\x01\x03\x00"), 72)
         memory.fill(0x8D048C, 0, 144)
         memory.write(0x8CE47B, 1, 1)
         memory.write(0x8CFD33, 2, 1)
         memory.write(0x8CFEF7, 3, 1)
	  end
	  
      if(ini.settings.gamefixes) then	 
		 -- SADisplayResolutions(1920x1080// 16:9)
         memory.write(0x745BC9, 0x9090, 2, false) 
		 -- CJFix
         memory.fill(0x460773, 0x90, 7, false)
		 -- the helicopter doesn't explode many times
         memory.setuint32(0x736F88, 0, false) 
		 -- fix blackroads
         memory.write(8931716, 0, 4, false) 
         -- Afk shift fix by FYP
		 memory.fill(0x00531155, 0x90, 5, true)
		 -- nop gamma 
		 --memory.hex2bin('E9D200000090', 0x0074721C, 5)
		 
         -- fps fix
         memory.write(0x53E94C, 0, 1, false) --del fps delay 14 ms
         memory.setuint32(12761548, 1051965045, false) -- car speed fps fix
         
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
      
      if(ini.settings.addonupgrades) then
         -- interior run
         memory.write(5630064, -1027591322, 4, false)
         memory.write(5630068, 4, 2, false)
         
         -- infinity run
         memory.setint8(0xB7CEE4, 1)
      end
	  
      if(ini.settings.noeffects) then
         -- no smoke and decorative flame
         memory.hex2bin('8B4E08E88B900000', 0x4A125D, 8)
         
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
      end
      
	  if (ini.settings.nopostfx) then
	     --memory.fill(0x53EAD3, 0x90, 5, true)
		 memory.write(7358318, 1448280247, 4, false)--postfx on
         memory.write(7358314, -988281383, 4, false)--postfx on
	  end
	  
	  if (ini.settings.noradio) then
	     memory.copy(0x4EB9A0, memory.strptr('\xC2\x04\x00'), 3, true)
	  end
	  
      --- END init
      while true do
      wait(0)
	  
	  -- Autoreconnect
	  -- Required use reset_remove.asi fix
	  if ini.settings.autoreconnect then
	     local chatstring = sampGetChatString(99)
         if chatstring == "Server closed the connection." 
		 or chatstring == "You are banned from this server." then
	        sampDisconnectWithReason(false)
            sampAddChatMessage("Wait reconnecting...", -1)
            wait(ini.settings.recontime)
            sampSetGamestate(1)-- GAMESTATE_WAIT_CONNECT
         end
	  end
	  
      -- Run imgui menu if no ENB
      if not ENBSeries then imgui.Process = dialog.settings.v end
      
      -- chatfix
      if isKeyJustPressed(0x54) and not sampIsDialogActive() and not sampIsScoreboardOpen() and not isSampfuncsConsoleActive() then
         sampSetChatInputEnabled(true)
      end
      
      -- nobike
      if ini.settings.addonupgrades then
         if isCharInAnyCar(PLAYER_PED) then
            setCharCanBeKnockedOffBike(PLAYER_PED, true)
         else
            setCharCanBeKnockedOffBike(PLAYER_PED, false)
         end
         if isCharInAnyCar(PLAYER_PED) and isCarInWater(storeCarCharIsInNoSave(PLAYER_PED)) then
            setCharCanBeKnockedOffBike(PLAYER_PED, false)
         end
      end
      
	  -- fix dark timecyc (gammafix) thanks Black Jesus
	  if ini.settings.fixdarktimecyc then
	     memory.write(6359759, 144, 1, false)
         memory.write(6359760, 144, 1, false)
         memory.write(6359761, 144, 1, false)
         memory.write(6359762, 144, 1, false)
         memory.write(6359763, 144, 1, false)
         memory.write(6359764, 144, 1, false)
         memory.write(6359778, 144, 1, false)
         memory.write(6359779, 144, 1, false)
         memory.write(6359780, 144, 1, false)
         memory.write(6359781, 144, 1, false)
         memory.write(6359782, 144, 1, false)
         memory.write(6359783, 144, 1, false)
         memory.write(6359784, 144, 1, false)
         memory.write(6359785, 144, 1, false)
         memory.write(6359786, 144, 1, false)
         memory.write(6359787, 144, 1, false)
         memory.write(5637016, 12044024, 4, false)
         memory.write(5637032, 12044024, 4, false)
         memory.write(5637048, 12044024, 4, false)
         memory.write(5636920, 12044048, 4, false)
         memory.write(5636936, 12044072, 4, false)
         memory.write(5636952, 12044096, 4, false)
		 		 
         if ini.settings.nopostfx then
            memory.setfloat(9228384, 1.0, false) -- allambient
		    memory.setfloat(12044024, ini.settings.fixtimecycvalue*2, false) -- objambient
		    memory.setfloat(12044048, ini.settings.fixtimecycvalue*2, false) -- worldambientR
            memory.setfloat(12044072, ini.settings.fixtimecycvalue*2, false) -- worldambientG
            memory.setfloat(12044096, ini.settings.fixtimecycvalue*2, false) -- worldambientB
		 else
            memory.setfloat(9228384, 0.8, false) -- allambient
		    memory.setfloat(12044024, ini.settings.fixtimecycvalue, false) -- objambient
		    memory.setfloat(12044048, ini.settings.fixtimecycvalue, false) -- worldambientR
            memory.setfloat(12044072, ini.settings.fixtimecycvalue, false) -- worldambientG
            memory.setfloat(12044096, ini.settings.fixtimecycvalue, false) -- worldambientB
		 end
	  end
	  
      -- antiafk 
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
	  if dialogIncoming ~= 0 and dialogs[dialogIncoming] then
         local data = dialogs[dialogIncoming]
         if data[1] and not dialogRestoreText then
		    sampSetCurrentDialogListItem(data[1])
		 end
		 if data[2] then
            sampSetCurrentDialogEditboxText(data[2])
		 end
		 dialogIncoming = 0
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
	  
	  -- Fix movements PED if tabmenu opened
	  if ini.settings.gamefixes then
	     if wasKeyPressed(VK_TAB) and not isPauseMenuActive() then
		    isTabmenuActive = not isTabmenuActive
		    -- if isTabmenuActive then
		       -- setPlayerControl(playerHandle, false)
		    -- else
		       -- setPlayerControl(playerHandle, true)
		    -- end
	     end
	     if isKeyJustPressed(VK_ESCAPE) and not isPauseMenuActive() then
		    if isTabmenuActive then
		       isTabmenuActive = false
			   setPlayerControl(playerHandle, true)
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
		 
         if isKeyJustPressed(VK_K) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then sampSendChat("/vfibye2") end

         if isKeyJustPressed(VK_M) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then sampSendChat("/vfibye") end
      
         if isKeyJustPressed(VK_U) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then sampSendChat("/anim") end
      
         if isKeyJustPressed(VK_J) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then sampSendChat("/gjktn") end
	     
		 -- if Player in Vehicle
	     if isCharInAnyCar(PLAYER_PED) then
	        if isKeyJustPressed(VK_L) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then sampSendChat("/lock") end
	  
            if isKeyJustPressed(VK_H) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then  sampSendChat("/f") end
			
			if isKeyJustPressed(VK_Z) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then sampSendChat("/xbybnm") end
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

-- Hooks
function sampev.onServerMessage(color, text)
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
	  -- ignore server flood mesages
	  if text:find("рекорд дрифта") then
         return false
      end
	  
	  if text:find("не засчитан") then
         return false
      end
	  
      if text:find("выхода из читмира") then
         return false
      end
   
      if text:find("Ни 1 клан не создан") then
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

function sampev.onPlayerJoin(id, color, isNpc, nickname)
	if sampIsLocalPlayerSpawned() and showReconnectedTeammates then
	   if nickname:lower():find(teammatesTag) then
          table.insert(teammatesTable, id)
		  sampAddChatMessage("Соклан " .. nickname .. " подключился к серверу.", 0x00FFFF)
	   end
	end
end

function sampev.onPlayerQuit(id, reason)
   local nick = sampGetPlayerNickname(id)
   
   if reason == 0 then reas = 'Выход'
   elseif reason == 1 then reas = 'Кик/бан'
   elseif reason == 2 then reas = 'Вышло время подключения'
   end
   
   if showReconnectedTeammates then
      for key, value in ipairs(teammatesTable) do
	     if value == id then 
	        sampAddChatMessage("Соклан " .. nick .. " вышел по причине: " .. reas, 0x00FFFF)
		    table.remove(teammatesTable, key)
		 end
	  end
   end
end

function sampev.onScriptTerminate(script, quitGame)
    if script == thisScript() then
        if not sampIsDialogActive() then
            showCursor(false)
        end
        sampAddChatMessage("Скрипт AbsoluteFix аварийно завершил свою работу.", -1)
        sampAddChatMessage("Для перезагрузки нажмите CTRL + R.", -1)
    end
end

function sampev.onDisplayGameText(style, time, text)
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
    -- local hideonradius = false
	-- local pX, pY, pZ = getCharCoordinates(PLAYER_PED)
	-- local icondrawdist = 0.5
	-- hide free houses mapicons
	  if(style == 0 and type == 31) then 
	   -- if(pX-position.x > icondrawdist and pY-position.y > icondrawdist) then 
	     return false
	  end
   end
end

function sampev.onSendDialogResponse(dialogId, button, listboxId, input)
   if ini.settings.gamefixes then
      dialogs[dialogId] = {listboxId, input}
   end
end

function sampev.onShowDialog(dialogId, style, title, button1, button2, text)
   if ini.settings.gamefixes then
      dialogIncoming = dialogId
   end
   
   -- debug
   -- print(dialogId, style, title, button1, button2, text)
   
   -- hide buy a house dialog
   -- if ini.settings.disablenotifications then
      -- if dialogId == 118 then
	     -- sampSendDialogResponse(118, 0, nil, nil)
		 -- print(dialogId, button1, text)
		 -- sampCloseCurrentDialogWithButton(0)
      -- end
   -- end
end

function sampev.onSendClickPlayer(playerId, source)
   clickedplayerid = playerId
end

function sampev.onRemoveBuilding(modelId, position, radius)
   if ini.settings.restoreremovedobjects then
	  return false
   end
end

-- END hooks

-- Thanks Heroku for this function on !SAPatcher 
function onSendRpc(id, bs, priority, reliability, channel, shiftTimestamp)
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

   if id == 153 and ini.settings.invalidmodelsfix then
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

-- Imgui extended functions
function imgui.TextColoredRGB(text)
    local style = imgui.GetStyle()
    local colors = style.Colors
    local ImVec4 = imgui.ImVec4

    local explode_argb = function(argb)
        local a = bit.band(bit.rshift(argb, 24), 0xFF)
        local r = bit.band(bit.rshift(argb, 16), 0xFF)
        local g = bit.band(bit.rshift(argb, 8), 0xFF)
        local b = bit.band(argb, 0xFF)
        return a, r, g, b
    end

    local getcolor = function(color)
        if color:sub(1, 6):upper() == 'SSSSSS' then
            local r, g, b = colors[1].x, colors[1].y, colors[1].z
            local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
            return ImVec4(r, g, b, a / 255)
        end
        local color = type(color) == 'string' and tonumber(color, 16) or color
        if type(color) ~= 'number' then return end
        local r, g, b, a = explode_argb(color)
        return imgui.ImColor(r, g, b, a):GetVec4()
    end

    local render_text = function(text_)
        for w in text_:gmatch('[^\r\n]+') do
            local text, colors_, m = {}, {}, 1
            w = w:gsub('{(......)}', '{%1FF}')
            while w:find('{........}') do
                local n, k = w:find('{........}')
                local color = getcolor(w:sub(n + 1, k - 1))
                if color then
                    text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
                    colors_[#colors_ + 1] = color
                    m = n
                end
                w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
            end
            if text[0] then
                for i = 0, #text do
                    imgui.TextColored(colors_[i] or colors[1], u8(text[i]))
                    imgui.SameLine(nil, 0)
                end
                imgui.NewLine()
            else imgui.Text(u8(w)) end
        end
    end

    render_text(text)
end

function imgui.TextQuestion(label, description)
    imgui.TextDisabled(label)

    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
            imgui.PushTextWrapPos(600)
                imgui.TextUnformatted(description)
            imgui.PopTextWrapPos()
        imgui.EndTooltip()
    end
end

function apply_custom_style()
   imgui.SwitchContext()
   local style = imgui.GetStyle()
   local colors = style.Colors
   local clr = imgui.Col
   local ImVec4 = imgui.ImVec4

   style.WindowPadding = imgui.ImVec2(15, 15)
   style.WindowRounding = 1.5
   style.FramePadding = imgui.ImVec2(5, 5)
   style.FrameRounding = 4.0
   style.ItemSpacing = imgui.ImVec2(12, 8)
   style.ItemInnerSpacing = imgui.ImVec2(8, 6)
   style.IndentSpacing = 25.0
   style.ScrollbarSize = 15.0
   style.ScrollbarRounding = 9.0
   style.GrabMinSize = 5.0
   style.GrabRounding = 3.0

   colors[clr.Text] = ImVec4(0.80, 0.80, 0.83, 1.00)
   colors[clr.TextDisabled] = ImVec4(0.24, 0.23, 0.29, 1.00)
   colors[clr.WindowBg] = ImVec4(0.06, 0.05, 0.07, 1.00)
   colors[clr.ChildWindowBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
   colors[clr.PopupBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
   colors[clr.Border] = ImVec4(0.80, 0.80, 0.83, 0.88)
   colors[clr.BorderShadow] = ImVec4(0.92, 0.91, 0.88, 0.00)
   colors[clr.FrameBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
   colors[clr.FrameBgHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
   colors[clr.FrameBgActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
   colors[clr.TitleBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
   colors[clr.TitleBgCollapsed] = ImVec4(1.00, 0.98, 0.95, 0.75)
   colors[clr.TitleBgActive] = ImVec4(0.07, 0.07, 0.09, 1.00)
   colors[clr.MenuBarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
   colors[clr.ScrollbarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
   colors[clr.ScrollbarGrab] = ImVec4(0.80, 0.80, 0.83, 0.31)
   colors[clr.ScrollbarGrabHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
   colors[clr.ScrollbarGrabActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
   colors[clr.ComboBg] = ImVec4(0.19, 0.18, 0.21, 1.00)
   colors[clr.CheckMark] = ImVec4(0.80, 0.80, 0.83, 0.31)
   colors[clr.SliderGrab] = ImVec4(0.80, 0.80, 0.83, 0.31)
   colors[clr.SliderGrabActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
   colors[clr.Button] = ImVec4(0.10, 0.09, 0.12, 1.00)
   colors[clr.ButtonHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
   colors[clr.ButtonActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
   colors[clr.Header] = ImVec4(0.10, 0.09, 0.12, 1.00)
   colors[clr.HeaderHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
   colors[clr.HeaderActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
   colors[clr.ResizeGrip] = ImVec4(0.00, 0.00, 0.00, 0.00)
   colors[clr.ResizeGripHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
   colors[clr.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
   colors[clr.CloseButton] = ImVec4(0.40, 0.39, 0.38, 0.16)
   colors[clr.CloseButtonHovered] = ImVec4(0.40, 0.39, 0.38, 0.39)
   colors[clr.CloseButtonActive] = ImVec4(0.40, 0.39, 0.38, 1.00)
   colors[clr.PlotLines] = ImVec4(0.40, 0.39, 0.38, 0.63)
   colors[clr.PlotLinesHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
   colors[clr.PlotHistogram] = ImVec4(0.40, 0.39, 0.38, 0.63)
   colors[clr.PlotHistogramHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
   colors[clr.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43)
   colors[clr.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.73)
end
apply_custom_style()

-- Credits:
-- EvgeN 1137, hnnssy, FYP - Moonloader
-- FYP - imgui, SAMP lua library
-- Gorskin - useful code snippets and memory hacks
-- Black Jesus - timecyc fix functions
-- Heroku - invalid models fix functions 