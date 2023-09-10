require "lib.moonloader"
local imgui = require('imgui')
script_description("IO and filesystem snippets")

-- Description: Removes all lines with the desired text from a text file
function deleteLine(filePath, text)
   local tableOfLines = {}

   for line in io.lines(filePath) do
      if not u8:decode(line):find(text) then
        table.insert(tableOfLines, line)
      end
   end

   local file = io.open(filePath, 'w')
   file:write('')
   file:close()

   local file = io.open(filePath, 'a')
   for i = 1, #tableOfLines do
      file:write(tableOfLines[i]..'\n')
   end
   file:close()
end

-- Description: Checks the existence of the file
function doesFileExist(path)
   local f=io.open(path,"r")
   if f~=nil then io.close(f) return true else return false end
end

-- Description: Gets the file size in bytes
function getFileSize(path)
    local file=io.open(path,"r")
    local current = file:seek()      -- get current position
    local size = file:seek("end")    -- get file size
    file:seek("set", current)        -- restore position
    return size
end

-- Description: learns the player's ID by nickname (modified version of the @imring function)
function sampGetPlayerIdByNickname(nick)
   local result, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
   if nick == sampGetPlayerNickname(id) then return id end
   for i = 0, sampGetMaxPlayerId(false) do
       if sampIsPlayerConnected(i) and sampGetPlayerNickname(i) == nick then return i end
   end
end