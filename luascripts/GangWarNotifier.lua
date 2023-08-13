script_name("GangWarNotifier")
script_author("1NS")
script_description("Notifies if a war has started in the zone")

require 'lib.moonloader'
local sampev = require 'lib.samp.events'

function sampev.onGangZoneFlash(zoneid, color)
   sampAddChatMessage(string.format("[GangWar] on zone: %i", zoneid), -1)
end