script_name("AutoRob")
script_author("1NS")
script_url("https://github.com/ins1x/useful-samp-stuff")
script_description("Auto rob player every 5 min")
script_properties("work-in-pause")

local autorob = false

function main()
   if not isSampLoaded() or not isSampfuncsLoaded() then return end
   while not isSampAvailable() do wait(100) end
   -- Change default activation command here
   sampRegisterChatCommand("rob", activateRobPlayer)
   wait(-1)
end

function activateRobPlayer(id)
   autorob = not autorob
   if autorob then 
      thread = lua_thread.create(autoRobPlayer, id)
      printStringNow("Autorob ~g~Activated", 3000)
   else 
      thread:terminate()
      printStringNow("Autorob ~r~Deactivated", 3000)
   end
end

function autoRobPlayer(id)
   if autorob then
     if id ~= nil then
        local handle,_ = sampGetCharHandleBySampPlayerId(id)
        if handle then
           sampSendChat('/rob '..id)
        else 
           sampSendChat('/rob')
        end
     else
        sampSendChat('/rob')
     end
     -- Change default delay here
     wait(375000) -- 375000 ms. == 6,25 min.
     return true
   end
end
