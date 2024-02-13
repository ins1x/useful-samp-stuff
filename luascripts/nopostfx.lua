script_author("1NS")
script_name("nopostfx")
script_description("Disables post-processing (Post-FX) and fix dark timecycle")
script_url("https://github.com/ins1x/useful-samp-stuff/tree/main/luascripts/")
script_version("1.0")
-- Tsi script is improved version classic nopostfx.asi
-- include fixes for the dark timecycle
-- Activation: Auto

-- script_moonloader(16) moonloader v.0.26
require 'lib.moonloader'
local memory = require 'memory'
local fixdarktimecyc = true
local nopostfxasi = false
local timecycratio = 0.2

function main()
   if not isSampLoaded() or not isSampfuncsLoaded() then return end
      while not isSampAvailable() do wait(100) end
	  
	  if doesFileExist(getGameDirectory() .. "\\nopostfx.asi") then
	     nopostfxasi = true
	     thisScript():unload()
	  end
	  
	  -- toggle postfx
	  if not nopostfxasi then
	     memory.write(7358318, 1448280247, 4, false)
         memory.write(7358314, -988281383, 4, false)
	  end

      while true do
      wait(0)
      
	  -- fix dark timecyc (gammafix) 
	  if fixdarktimecyc then
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
         
		 if not nopostfxasi then
            memory.setfloat(9228384, 1.0, false) -- allambient
		    memory.setfloat(12044024, timecycratio*2, false) -- objambient
		    memory.setfloat(12044048, timecycratio*2, false) -- worldambientR
            memory.setfloat(12044072, timecycratio*2, false) -- worldambientG
            memory.setfloat(12044096, timecycratio*2, false) -- worldambientB
		 else
		 -- the second version, a darker preset
            memory.setfloat(9228384, 0.8, false) -- allambient
		    memory.setfloat(12044024, timecycratio, false) -- objambient
		    memory.setfloat(12044048, timecycratio, false) -- worldambientR
            memory.setfloat(12044072, timecycratio, false) -- worldambientG
            memory.setfloat(12044096, timecycratio, false) -- worldambientB
		 end
		 
	  end
   end
end
