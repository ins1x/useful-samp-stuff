script_author("1NS")
script_name("ModCompatibilityChecker")
script_description("Checks the mods that can cause crashes")
script_url("https://github.com/ins1x/AbsNoAddonFix")
script_version("1.0")
-- forked from https://github.com/ins1x/AbsNoAddonFix v1.4
-- script_moonloader(16) moonloader v.0.26
      
require 'lib.moonloader'

local ENBSeries = false
local FastloadAsi = false
local SAMPFUNCS = false
local ModTimecyc = false

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
     
	  if getFileSize(getGameDirectory() .. "\\data\\timecyc.dat") ~= 40037 or 
	  doesFileExist(getGameDirectory() .. "\\timecycle24.asi") or
      doesFileExist(getGameDirectory() .. "\\data\\timecyc_24h.dat") then
         ModTimecyc = true
      end
	  
      -- broken files checker work if samp addon not installed
      if not doesFileExist(getGameDirectory() .. "\\audio.asi") then
         -- check old version shadows asi
         if doesFileExist(getGameDirectory() .. "\\shadows.asi") and
         getFileSize(getGameDirectory() .. "\\shadows.asi") == 52224 then
            sampAddChatMessage("� ��� ���������� ������ shadows.asi ������� ����� �������� �����", 0xFF00000)
         end
        
         -- newopcodes
         if doesFileExist(getGameDirectory() .. "\\cleo\\newOpcodes.cleo") and
         getFileSize(getGameDirectory() .. "\\cleo\\newOpcodes.cleo") < 161280 then
            sampAddChatMessage("� ��� ���������� ������ NewOpcodes ������� ����� �������� �����", 0xFF00000)
         end
        
         if doesFileExist(getGameDirectory() .. "\\cleo\\NewOpcodes.cleo") and
         getFileSize(getGameDirectory() .. "\\cleo\\NewOpcodes.cleo") < 161280 then
            sampAddChatMessage("� ��� ���������� ������ NewOpcodes ������� ����� �������� �����", 0xFF00000)
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
             sampAddChatMessage("exdisp.asi ����� �������� ����� ��� ������ ������������ ���", 0xFF00000)
             print("ModChecker warning: exdisp.asi can cause crashes when the fps limiter is removed")
             print("ModChecker warning: install widescreen fix asi instead of exdisp.asi")
         end
        
         -- skybox
         if doesFileExist(getGameDirectory() .. "\\cleo\\cleoskybox.cs") then
             sampAddChatMessage("cleoskybox.cs ������� � ����� �������� ����� � ������������ ����������� �������", 0xFF00000)
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
            sampAddChatMessage("������������� ������������� ����� skygrad.asi � RealSkybox.SA.asi �������� ������", 0xFF00000)
            print("ModChecker warning: using mods skygrad.asi and RealSkybox.SA.asi simultaneously causes glitches")
         end
        
         -- timecycle24 and Real Linear Graphics
         if doesFileExist(getGameDirectory() .. "\\timecycle24.asi") and 
         doesFileExist(getGameDirectory() .. "\\data\\timecyc_24h.dat") then 
            sampAddChatMessage("��� 24H Timecycle ��������������� ��� ����� timecyc_24h.dat", 0xFF00000)
            print("ModChecker warning: The 24H Timecycle mod shoud be installed without the timecyc_24h.dat file")
         end
        
         -- SAMPFUNCS and skygfx
         if SAMPFUNCS and doesFileExist(getGameDirectory() .. "\\SkyGfx.asi") then
            sampAddChatMessage("SkyGFX is incompatible with SAMPFUNCS", 0xFF00000)
            print("ModChecker warning: SkyGfx ����������� � SAMPFUNCS")
         end
         
		 -- fixtimecyc.cs
		 if doesFileExist(getGameDirectory() .. "\\cleo\\fixtimecyc.cs") 
		 and doesFileExist(getGameDirectory() .. "\\LightMap.asi") then
            sampAddChatMessage("fixtimecyc.cs ����������� � LightMap.asi", 0xFF00000)
            print("ModChecker warning: fixtimecyc.cs is incompatible with LightMap.asi")
         end
		 
		 -- FixDIST.cs
		 if ModTimecyc and doesFileExist(getGameDirectory() .. "\\cleo\\FixDIST.cs") then
            sampAddChatMessage("FixDIST.cs ����� ����������� �������� �� ������������� ���������", 0xFF00000)
            print("ModChecker warning: FixDIST.cs may not work correctly on a non-standard timecycle")
         end
		 
         -- language files check
         if doesFileExist(getGameDirectory() .. "\\data\\fonts\\fp_font.dat") and 
         getFileSize(getGameDirectory() .. "\\data\\fonts\\fp_font.dat") ~= 979 then
            sampAddChatMessage("������������ fp_font.dat ����� �������� �������� ������ ��������� ��������", 0xFF00000)
            print("ModChecker warning: incorrect fp_font.dat may output incorrect width of some characters")
         end
		 
	  -- END MAIN
   end
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