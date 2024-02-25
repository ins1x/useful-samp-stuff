script_author("1NS")
script_name("ModCompatibilityChecker")
script_description("Checks the mods that can cause crashes")
script_url("https://github.com/ins1x/useful-samp-stuff/tree/main/luascripts")
script_version("1.2")
-- script_moonloader(16) moonloader v.0.26
      
require 'lib.moonloader'

-- Do not change booleans here
local ENBSeries = false
local FastloadAsi = false
local SAMPFUNCS = false
local ModTimecyc = false
local SampAddon = false

function main()
   if not isSampLoaded() or not isSampfuncsLoaded() then return end
      while not isSampAvailable() do wait(100) end
      
      -- ENB check
      if doesFileExist(getGameDirectory() .. "\\enbseries.asi") or 
      doesFileExist(getGameDirectory() .. "\\d3d9.dll") then
         ENBSeries = true
      end
      
      if doesFileExist(getGameDirectory() .. "\\FastLoad.asi") then
         FastloadAsi = true
      end
      
      if doesFileExist(getGameDirectory() .. "\\SAMPFUNCS.asi") then
         SAMPFUNCS = true
      end
     
	  if doesFileExist(getGameDirectory() .. "\\audio.asi") then
	     SampAddon = true
	  end
	  
	  if getFileSize(getGameDirectory() .. "\\data\\timecyc.dat") ~= 40037 or 
	  doesFileExist(getGameDirectory() .. "\\timecycle24.asi") or
      doesFileExist(getGameDirectory() .. "\\data\\timecyc_24h.dat") then
         ModTimecyc = true
      end
	  
      -- broken files checker work if samp addon not installed
	  -- check old version shadows asi
	  if doesFileExist(getGameDirectory() .. "\\shadows.asi") and
	  getFileSize(getGameDirectory() .. "\\shadows.asi") == 52224 then
		 sampAddChatMessage("У вас устаревшая версия shadows.asi которая может вызывать краши", 0xFF00000)
	  end
	
	  -- newopcodes
	  if doesFileExist(getGameDirectory() .. "\\cleo\\newOpcodes.cleo") and
	  getFileSize(getGameDirectory() .. "\\cleo\\newOpcodes.cleo") < 161280 then
		 sampAddChatMessage("У вас устаревшая версия NewOpcodes которая может вызывать краши", 0xFF00000)
	  end
	
	  if doesFileExist(getGameDirectory() .. "\\cleo\\NewOpcodes.cleo") and
	  getFileSize(getGameDirectory() .. "\\cleo\\NewOpcodes.cleo") < 161280 then
		 sampAddChatMessage("У вас устаревшая версия NewOpcodes которая может вызывать краши", 0xFF00000)
	  end
	
	  -- streammemfix checker
	  if doesFileExist(getGameDirectory() .. "\\streammemfix.asi") then
		 print("ModChecker warning: streammemfix incompatible with windows 10+")
	  end  
	
	  if doesFileExist(getGameDirectory() .. "\\StreamMemFix.asi") and 
	  getFileSize(getGameDirectory() .. "\\StreamMemFix.asi") == 27648 then
		 print("ModChecker warning: streammemfix incompatible with windows 10+")
	  end
	 
	  -- exdisp
	  if doesFileExist(getGameDirectory() .. "\\exdisp.asi") then
		 sampAddChatMessage("exdisp.asi может вызывать краши при снятом ограничителе фпс", 0xFF00000)
		 print("ModChecker warning: exdisp.asi can cause crashes when the fps limiter is removed")
		 print("ModChecker warning: install widescreen fix asi instead of exdisp.asi")
	  end
	
	  -- GFXHack
	  if doesFileExist(getGameDirectory() .. "\\GFXHack.asi") then
		 sampAddChatMessage("GFXHack устарел, используйте SilentPatch вместо него", 0xFF00000)
		 print("ModChecker warning: GFXHack Outdated. (SILENT PATCH already contains this fix)")
	  end
	
	  -- III.VC.SA.LimitAdjuster
	  if doesFileExist(getGameDirectory() .. "\\III.VC.SA.LimitAdjuster.asi") then
		 sampAddChatMessage("SA.LimitAdjuster плагин вызывает проблемы со стабильность и производительностью", 0xFF00000)
		 print("ModChecker warning: SA.LimitAdjuster plugin causes stability and performance issues")
	  end
	 
	  -- newCoronaLimit
	  if doesFileExist(getGameDirectory() .. "\\newCoronaLimit.asi") then
		 sampAddChatMessage("newCoronaLimit.asi приводит к сбою в отображении шейдера ENB на автомобилях.", 0xFF00000)
		 print("ModChecker warning: newCoronaLimit causes the ENB shader to fail to display on cars")
	  end
	 
	  -- SA_Lightning
	  if doesFileExist(getGameDirectory() .. "\\SA_Lightning.asi") then
		 sampAddChatMessage("SA_Lightning.asi устарел, не работает на WIn7/10", 0xFF00000)
		 print("ModChecker warning: SA_Lightning outdated, does not work on WIn7/10")
 	  end
	 
	  -- SCMDirectDrawing
	  if doesFileExist(getGameDirectory() .. "\\SCMDirectDrawing.asi") then
		 sampAddChatMessage("SCMDirectDrawing Конфликтует с другими плагинами, и приводит к тому, что шрифты и информационное поле не отображаются.", 0xFF00000)
		 print("ModChecker warning: SCMDirectDrawing сonflicts with other plugins, and leads to the fact that fonts and the information field are not displayed.")
	  end
	 
	  -- Searchlights
	  if doesFileExist(getGameDirectory() .. "\\Searchlights.asi") then
		 sampAddChatMessage("Searchlights крашит на новых версиях клиента.", 0xFF00000)
		 print("ModChecker warning: Searchlights crashes on new versions of samp client.")
	  end
	 
	  -- SuperVars
	  if doesFileExist(getGameDirectory() .. "\\SuperVars.asi") then
		 sampAddChatMessage("SuperVars устарел может вызывать краши на новых версиях клиентах.", 0xFF00000)
		 print("ModChecker warning: SuperVars outdated may cause crashes on new versions of clients.")
	  end
	 
	  -- GTA.SA.WideScreen.Fix.asi
	  if doesFileExist(getGameDirectory() .. "\\GTA.SA.WideScreen.Fix.asi") then
		 sampAddChatMessage("GTA.SA.WideScreen.Fix Сбрасывает разрешение до разрешения рабочего стола, при нулевых параметрах ResX и ResY", 0xFF00000)
		 print("ModChecker warning: GTA.SA.WideScreen.Fix Resets the resolution to desktop resolution, with zero ResX and ResY parameters.")
	  end
	 
     -- DwmComposition
      if doesFileExist(getGameDirectory() .. "\\DwmComposition.asi") then
		 sampAddChatMessage("DwmComposition Вызывает проблемы с запуском и сворачиванием игры на Windows 10.", 0xFF00000)
		 print("ModChecker warning: DwmComposition causes problems with starting and minimizing the game on Windows 10.")
	  end
	  -- crc32ffi
	  if doesFileExist(getGameDirectory() .. "\\moonloader\\crc32ffi.lua") then
		 sampAddChatMessage("crc32ffi.lua приводит к мгновенному закрытию игры без каких-либо ошибок или журнала", 0xFF00000)
		 print("ModChecker warning: crc32ffi results in instant closure of the game without any errors or log")
	  end
	 
	  -- maplimit260
	  if doesFileExist(getGameDirectory() .. "\\moonloader\\maplimit260.lua") then
		 sampAddChatMessage("maplimit260 Вызывает сбой после загрузки", 0xFF00000)
		 print("ModChecker warning: maplimit260 Causes a crash after loading")
	  end
	 
	  if doesFileExist(getGameDirectory() .. "\\moonloader\\chatNopFlood.lua") and 
	  doesFileExist(getGameDirectory() .. "\\moonloader\\antiscrollingchat.lua") then
		 sampAddChatMessage("chatNopFlood.lua и antiscrollingchat.lua несовместимы", 0xFF00000)
		 print("ModChecker warning: chatNopFlood.lua and antiscrollingchat.lua are incompatible")
	  end
	  -- skybox
	  if doesFileExist(getGameDirectory() .. "\\cleo\\cleoskybox.cs") then
		 sampAddChatMessage("cleoskybox.cs устарел и может вызывать краши и некорректное отображение текстур", 0xFF00000)
		 print("ModChecker warning: cleoskybox.cs is outdated and can cause crashes and incorrect show server textures")
		 print("ModChecker warning: install RealSkybox.SA.asi instead of skybox.cleo")
	  end
	 
	  -- skygrad
	  if ENBSeries and doesFileExist(getGameDirectory() .. "\\skygrad.asi") then
		 print("ModChecker warning: incorrect skygrad.asi incompatible with ENB")
      end
	
	  -- RealSkybox.SA and skygrad
	  if doesFileExist(getGameDirectory() .. "\\RealSkybox.SA.asi") and 
	  doesFileExist(getGameDirectory() .. "\\skygrad.asi") then
		 sampAddChatMessage("Одновременное использование модов skygrad.asi и RealSkybox.SA.asi вызывает глитчи", 0xFF00000)
		 print("ModChecker warning: using mods skygrad.asi and RealSkybox.SA.asi simultaneously causes glitches")
	  end
	
	  -- timecycle24 and Real Linear Graphics
	  if doesFileExist(getGameDirectory() .. "\\timecycle24.asi") and 
	  doesFileExist(getGameDirectory() .. "\\data\\timecyc_24h.dat") then 
		 sampAddChatMessage("Мод 24H Timecycle устанавливается без файла timecyc_24h.dat", 0xFF00000)
		 print("ModChecker warning: The 24H Timecycle mod shoud be installed without the timecyc_24h.dat file")
	  end
	
	  -- SAMPFUNCS and skygfx
	  if SAMPFUNCS and doesFileExist(getGameDirectory() .. "\\SkyGfx.asi") then
		 sampAddChatMessage("SkyGFX is incompatible with SAMPFUNCS", 0xFF00000)
		 print("ModChecker warning: SkyGfx несовместим с SAMPFUNCS")
	  end
	 
	  -- fixtimecyc.cs
	  if doesFileExist(getGameDirectory() .. "\\cleo\\fixtimecyc.cs") 
	  and doesFileExist(getGameDirectory() .. "\\LightMap.asi") then
		 sampAddChatMessage("fixtimecyc.cs несовместим с LightMap.asi", 0xFF00000)
		 print("ModChecker warning: fixtimecyc.cs is incompatible with LightMap.asi")
	  end
	 
	  -- FixDIST.cs
	  if ModTimecyc and doesFileExist(getGameDirectory() .. "\\cleo\\FixDIST.cs") then
		 sampAddChatMessage("FixDIST.cs может неккоректно работать на нестандартном таймцикле", 0xFF00000)
		 print("ModChecker warning: FixDIST.cs may not work correctly on a non-standard timecycle")
	  end
	 
	  -- language files check
	  if doesFileExist(getGameDirectory() .. "\\data\\fonts\\fp_font.dat") and 
	  getFileSize(getGameDirectory() .. "\\data\\fonts\\fp_font.dat") ~= 979 then
		sampAddChatMessage("Некорректный fp_font.dat может выдавать неверную ширину некоторых символов", 0xFF00000)
		print("ModChecker warning: incorrect fp_font.dat may output incorrect width of some characters")
	  end
   -- END MAIN
end

-- Extended filesystem functions
function doesFileExist(path)
   -- work like doesDirectoryExist(string directory)
   -- result: ans = file_exists("sample.txt")
   local f=io.open(path,"r")
   if f~=nil then io.close(f) return true else return false end
end

function getFileSize(path)
    local file=io.open(path,"r")
    local current = file:seek()      -- get current position
    local size = file:seek("end")    -- get file size
    file:seek("set", current)        -- restore position
    return size
end