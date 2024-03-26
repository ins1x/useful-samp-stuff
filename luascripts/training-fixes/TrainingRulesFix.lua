script_name("TrainingRulesFix")
script_author("1NS")
script_url("https://training-server.com/")
script_description("Skip rules dialog on connect to TRAINING")

local sampev = require 'lib.samp.events'
-- Change Server IP here
-- NOTE: samp.training-server.com:7777 not working, need IP address!!
local ipTraining = "46.174.50.168"

function main()
   if not isSampLoaded() or not isSampfuncsLoaded() then return end
   while not isSampAvailable() do wait(100) end
   -- unload script if connected another server
   local ip, port = sampGetCurrentServerAddress()
   if not ip:find(ipTraining) then
	  thisScript():unload()
   end
end

function sampev.onShowDialog(dialogId, style, title, button1, button2, text)
   -- TRAINING Skip rules dialog
   if dialogId == 32700 and style == 0 and button1 == "РџСЂРёРЅРёРјР°СЋ" then
      sampSendDialogResponse(32700, 1, nil)
      sampCloseCurrentDialogWithButton(1)
   end
end