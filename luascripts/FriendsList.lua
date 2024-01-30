require "moonloader"
sampev = require("lib.samp.events")
samp = require "sampfuncs"
encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8

script_name("FriendsList")
script_description("It notifies you when a friend comes online or quits")
-- fork of SA:MP Player Notifer (Author Nisad Rahman)
-- https://github.com/newnishad/SAMP-0.3.7-Player-Notifier
-- https://www.blast.hk/threads/66784/

-- Activation: Auto
-- Commands:
-- /friends add Nickname or ID - to add new friend
-- /friends del Nickname or ID - to remove friend
-- /friends list - show all friend list
-- /friends help - to check notify list

dbloc = "moonloader/config/flist.cfg"
friendsList = {}
friendsdb = io.open(dbloc, "a+")
for name in friendsdb:lines() do
   table.insert(friendsList, name:lower())
end
io.close(friendsdb)

function main()
   while not isSampAvailable() do wait(50) end
   sampRegisterChatCommand("friends", friends)
end

function friends(args)
   if args:find('(.+) (.+)') then
      local cmd, name = args:match('(.+) (.+)')
	  if cmd:find("add") then
	     if name and string.len(name) < 3 then 
		    local id = tonumber(name)
		    if sampIsPlayerConnected(id) then
		       local nickname = sampGetPlayerNickname(id)
			   addfriend(nickname)
			   return
			end
		 end
	     addfriend(name)
	  end
	  if cmd:find("del") then
	  	 if name and string.len(name) < 3 then 
		    local id = tonumber(name)
		    if sampIsPlayerConnected(id) then
		       local nickname = sampGetPlayerNickname(id)
			   delfriend(nickname)
			   return
			end
		 end
	     delfriend(name)
	  end
   else
      if args:find('(.+)') then
	     local cmd = args:match('(.+)')
         if cmd then
	  	    if cmd:find("list") then
               onlinefriends()
			   return
	        end
	        if cmd:find("help") then
               friendshelp()
			   return
	        end
		    sampAddChatMessage("Доступные команды:",0xCDCDCD)
            friendshelp()
	     end
	  end
	  sampAddChatMessage("Доступные команды:",0xCDCDCD)
      friendshelp()
   end
end

function friendshelp()
   sampAddChatMessage("{00FF00}/friends add Никнейм/ID - {FFFFFF}добавить в список друзей",0xCDCDCD)
   sampAddChatMessage("{00FF00}/friends del Никнейм/ID - {FFFFFF}удалить из списка друзей",0xCDCDCD)
   sampAddChatMessage("{00FF00}/friends list - {FFFFFF}список друзей",0xCDCDCD)
   sampAddChatMessage("{00FF00}/friends help - {FFFFFF}помощь",0xCDCDCD)
end

function sampev.onPlayerJoin(id, color, isNPC, nickname)
   for k,n in pairs(friendsList) do
      if (nickname:lower() == n:lower()) then
         sampAddChatMessage("{00FF00}" .. nickname .. " (" .. id .. ")" .. " подключен к серверу!", 0xFFFFFF)
         return
      end
   end
end

function sampev.onPlayerQuit(id, reason)
   local name = sampGetPlayerNickname(id)
   local exitreasons = {"Таймаут/Краш", "Выход", "Кик/Бан"}
   for k,n in pairs(friendsList) do
      if (name:lower() == n:lower()) then
         sampAddChatMessage("{00FF00}" .. name .. " вышел с сервера (" .. exitreasons[reason] .. ")",0xFFFFFF)
         return
      end
   end
end

function addfriend(name)
   if string.len(name) < 3 then
      sampAddChatMessage("Пример: /friends add Никнейм либо ID",0xCDCDCD)
      return
   end
   for k,n in pairs(friendsList) do
     if(n:lower() == name:lower()) then
        sampAddChatMessage("{E61920}" .. name .. "{FFFFFF} уже есть в списке друзей!", 0xFFFFFF)
        return
     end
   end
   for k,n in pairs(friendsList) do
      if(n:lower() == name) then
         table.remove(friendsList,i)
         sampAddChatMessage("{E61920}" .. name .. "{{FFFFFF}} удален из списка друзей!", 0xFFFFFF)
      end
   end
   friendsdb = io.open(dbloc, "a+")
   io.output(friendsdb)
   io.write(name .. "\n")
   io.close(friendsdb)
   table.insert(friendsList, name:lower())
   sampAddChatMessage("{FFFFFF}Вы добавили {00FF00}" .. name .. "{FFFFFF} в список друзей",0xFFFFFF)
end

function delfriend(name)
   if string.len(name) < 3 then
       sampAddChatMessage("Пример: /friends del Никнейм либо ID",0xCDCDCD)
       return
   end
   i = 1
   for k,n in pairs(friendsList) do
      if(n:lower() == name) then
         table.remove(friendsList,i)
         sampAddChatMessage("{E61920}" .. name .. "{FFFFFF} удален из списка друзей" , 0xFFFFFF)
      end
      i = i+1
   end
   
   friendsdb = io.open(dbloc, "w")
   io.output(friendsdb)
   for k,n in pairs(friendsList) do
      io.write(n .. "\n")
   end
   io.close(friendsdb)
end

function onlinefriends()
   sampAddChatMessage("Список друзей:", 0xFFFFFF)
   tempList = {}
   friendsdb = io.open(dbloc, "r")
   for name in friendsdb:lines() do
      table.insert(tempList, name:lower())
   end
   io.close(friendsdb)
   maxPlayerOnline = sampGetMaxPlayerId(false)
   s = 1
   for i = 0, maxPlayerOnline do
      if sampIsPlayerConnected(i) then
         name = sampGetPlayerNickname(i)
         c = 1
         for k,n in pairs(tempList) do
            if(name:lower() == n:lower()) then
               sampAddChatMessage("{FFFFFF}" .. s .. ". {34EB46}" .. name .. " (" .. i .. ")", 0xFFFFFF)
               table.remove(tempList,c)
               s = s + 1
            end
	        c = c + 1
         end
      end
   end

   for k,n in pairs(tempList) do
      sampAddChatMessage("{FFFFFF}" .. s .. ". {CDCDCD}" .. n .. " {E61920}(OFFLINE)", 0xFFFFFF)
      s = s + 1
   end
end