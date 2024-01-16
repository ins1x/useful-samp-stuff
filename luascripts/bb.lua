script_name("Bye-bye")
script_description("It's crash yourself when you type /bb")

function main()
   sampRegisterChatCommand('bb', function() deleteChar(1) end)
   -- Variant 2
   -- callFunction(0x823BDB , 3, 3, 0, 0, 0)
   wait(-1)
end