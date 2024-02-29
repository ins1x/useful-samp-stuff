script_name("bunnyhopfix")
script_description("Allow bunnyhop for roleplay servers")

local sampev = require 'lib.samp.events'
function sampev.onSendPlayerSync(data)
   if data.keysData == 40 then data.keysData = 0 end
end