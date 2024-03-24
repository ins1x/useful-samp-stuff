script_name("TrainingSpawnPresets")
script_author("1NS")
script_url("https://training-server.com/")
script_description("After first spawn it sets the skin, weather and time on TRAINING")

local sampev = require 'lib.samp.events'
-- Change Server IP here
-- NOTE: samp.training-server.com:7777 not working, need IP address!!
local ipTraining = "46.174.50.168"
local firstSpawn = true

-- Default values can be changed here
local skinid = 160
local weatherid = 1
local time = 12

function main()
   if not isSampLoaded() or not isSampfuncsLoaded() then return end
   while not isSampAvailable() do wait(100) end
   -- unload script if connected another server
   local ip, port = sampGetCurrentServerAddress()
   if not ip:find(ipTraining) then
	  thisScript():unload()
   end
end

function sampev.onSendSpawn()
   if firstSpawn then 
      sampSendChat("/skin "..skinid)
      sampSendChat("/weather "..weatherid)
      sampSendChat("/time "..time)
      firstSpawn = false
   end
end