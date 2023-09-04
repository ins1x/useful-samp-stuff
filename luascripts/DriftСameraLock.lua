script_name("DriftСameraLock")
script_description("Lock camera behind player on vehicle (DriftCam)")
script_url("https://github.com/ins1x/useful-samp-stuff")
script_version(0.1)
-- script_moonloader(16) moonloader v.0.26
-- in-game deactivation: ALT + C
require "lib.moonloader"

-- change to false if you need to disable automatic activation
local lockCameraMode = true 

function main()
   while not isSampAvailable() do wait(100) end
   restoreCamera()
   while true do 
      if isKeyDown(VK_MENU) and wasKeyPressed(VK_C) then
         restoreCamera()
		 lockCameraMode = not lockCameraMode
      end

      if isCharInAnyCar(PLAYER_PED) and lockCameraMode then
         setCameraBehindPlayer()
	  else 
	     restoreCamera()
      end
	  
      wait(0) 
   end
end
