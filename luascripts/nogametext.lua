script_name("nogametext")
script_author("1NS")
script_url("play.uifserver.net")
script_description("Hide all annoying gametexts on UIF server")

local sampev = require 'lib.samp.events'

-- auto activation
nogametext = true
-- If the server changes IP, change it here
local hostip = "51.254.85.134"

function main()
   if not isSampLoaded() or not isSampfuncsLoaded() then return end
   while not isSampAvailable() do wait(100) end
   -- unload script if connected another server
   local ip, port = sampGetCurrentServerAddress()
   if not ip:find(hostip) then
	  thisScript():unload()
   end
end

function sampev.onDisplayGameText(style, time, text)
   if nogametext then 
      return false
   end
end