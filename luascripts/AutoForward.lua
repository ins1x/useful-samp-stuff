script_name('AutoForward')
script_author('Morj')
script_description("Script for automatic movement by car (cruise control), and autoforward on foot.")
script_version_number(2)
script_version("2.1")
require 'lib.moonloader'
local mem = require 'memory'
local font_flag = require('moonloader').font_flag

-- script modified by 1NS. Original script (https://www.blast.hk/threads/22082/)
-- Changes:
-- fixed traffic when the auto cruise is turned off and the chat is open
-- fixed a bug with maintaining the speed limit when the cruise is disabled
-- fixed script crash when player teleporting, or leaving the vehicle for spectating
-- fixed broken limit on case script reloading or terminating
-- Use on foot:
-- Numpad / - enable automatic walking.
-- Numpad + - switch the walking mode to a faster one (Three modes in total).
-- Numpad - - switch the walking mode back.

-- Use in transport:
-- Numpad / - turn on the speed limit mode, if pressed a second time, the car will drive automatically at the set speed (the initial speed is taken from the current speed of movement).
-- Numpad + - increases the maximum speed at which the car can drive (It cannot be set higher than the standard one).
-- Numpad - - reduces the maximum speed of the car.
-- When you press the "S" and "Space" buttons in Auto Cruise mode, the car stops moving while you hold the buttons.

-- Change keybinds here
KeyActive = VK_DIVIDE -- Activation button, when changing the button, do not forget to write "VK_BUTTON" (Uppercase).
KeyAddSpeed = VK_ADD -- The speed increase button, when changing the button, do not forget to write "VK_BUTTON" (Uppercase).
KeySubSpeed = VK_SUBTRACT -- Speed reduction button, when changing the button, do not forget to write "VK_BUTTON" (Uppercase).
-- All possible buttons are stored in the folder with the game \mod loader\lib\keys.lua.

local walk = 0
local forward = 0
local vehicle = -1
local maxspeed = -1
local speed = 0
local stop = false

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(100) end
	local font = renderCreateFont('Arial', 16, font_flag.BOLD + font_flag.SHADOW)
	lua_thread.create(ChangeSpeed)

	while true do 
		wait(0)
		local sw, sh = getScreenResolution()
		if isKeyJustPressed(KeyActive) and isCharOnFoot(playerPed) and not sampIsChatInputActive() then 
		if walk < 1 then walk = 1 else walk = 0 end end
		if walk > 3 then walk = 3 end if walk < 0 then walk = 0 end 
		if walk == 1 then setGameKeyState(1, -255) setGameKeyState(21, 128) end
		if walk == 2 then setGameKeyState(1, -255) end
	    if walk == 3 then setGameKeyState(1, -255) setGameKeyState(16, 255) end
		if not isCharOnFoot(playerPed) then walk = 0 end
		if isCharInAnyCar(playerPed) and isKeyJustPressed(KeyActive) and not sampIsChatInputActive() then
			if maxspeed <= 0 then maxspeed = mem.getfloat(GetVehicleHeader() * 0xE0 + 0xC2B9DC + 0x84, false) * 100 end
			if forward < 2 then  forward = forward + 1 else forward = 0 end
			if forward == 1 then
				vehicle = storeCarCharIsInNoSave(playerPed)
				speed = getCarSpeed(vehicle) / 0.5
			end
			if forward == 2 then
				vehicle = storeCarCharIsInNoSave(playerPed)
				speed = getCarSpeed(vehicle) / 0.5
			end
			if forward == 0 then stop = false mem.setfloat(GetVehicleHeader() * 0xE0 + 0xC2B9DC + 0x84, maxspeed / 100, false) end
		end
		if isCharInAnyCar(playerPed) and isKeyJustPressed(VK_SPACE) and not sampIsChatInputActive() then stop = not stop end
		if isCharInAnyCar(playerPed) then
			if forward == 1 then
				if speed > maxspeed then speed = maxspeed end
				mem.setfloat(GetVehicleHeader() * 0xE0 + 0xC2B9DC + 0x84, speed / 100, false)
			end
			if forward == 2 then
				if speed > maxspeed then speed = maxspeed end
				if sampIsChatInputActive() and speed ~= 0 and not stop then
					setGameKeyState(16, 255)
					mem.setfloat(GetVehicleHeader() * 0xE0 + 0xC2B9DC + 0x84, speed / 100, false)
				end
				if speed ~= 0 and not isKeyDown(VK_S) and not isKeyDown(VK_S) and not stop then
					setGameKeyState(16, 255)
					mem.setfloat(GetVehicleHeader() * 0xE0 + 0xC2B9DC + 0x84, speed / 100, false)
				end
			end
			for f = 1, 2 do 
				if forward == 1 then renderFontDrawText(font, string.format('{66CDAA}Cruise Speed: {FFFFFF}%d', speed), sw / 19, sh-40, -1) end
				if forward == 2 and not stop then renderFontDrawText(font, string.format('{66CDAA}Auto Cruise Speed: {FFFFFF}%d', speed), sw / 21, sh-40, -1) end
				if stop and forward == 2 then renderFontDrawText(font, '{66CDAA}Cruise Stopped', 80, sh-40, -1) end
			end
		else forward = 0 end
		if vehicle ~= -1 and maxspeed ~= -1 and isCharOnFoot(playerPed) then
			if isCharInAnyCar(playerPed) then 
			    vehicle = getCarModel(vehicle)
				vehicle = mem.getint32(vehicle * 0x4 + 0xA9B0C8, false)
				vehicle = mem.getint16(vehicle + 0x4A, false)
				mem.setfloat(vehicle * 0xE0 + 0xC2B9DC + 0x84, maxspeed / 100, false)
				vehicle = -1 maxspeed = -1 forward = 0 stop = false
			end
		end
	end
end

function onExitScript()
   if isCharInAnyCar(playerPed) then 
      maxspeed = mem.getfloat(GetVehicleHeader() * 0xE0 + 0xC2B9DC + 0x84, false) * 100
      mem.setfloat(GetVehicleHeader() * 0xE0 + 0xC2B9DC + 0x84, maxspeed / 100, false)
   else
      maxspeed = 60
   end
end

function GetVehicleHeader()
	local value = 0
	local car = storeCarCharIsInNoSave(playerPed)
	if car then
		value = getCarModel(car)
		value = mem.getint32(value * 0x4 + 0xA9B0C8, false)
		value = mem.getint16(value + 0x4A, false)
	end
	return value
end

function ChangeSpeed()
	while true do
		wait(0)
		if forward and not stop and isKeyDown(KeyAddSpeed) and not sampIsChatInputActive() then
			if speed > maxspeed then if maxspeed ~= -1 then speed = maxspeed end 
			else if speed ~= maxspeed then speed = speed + 1 end end
			wait(100) 
		end
		if forward and not stop and isKeyDown(KeySubSpeed) and not sampIsChatInputActive() then
			if speed < 0 then speed = 0 end
			if speed ~= 0 then speed = speed - 1 end
			wait(100) 
		end
		if isKeyJustPressed(KeyAddSpeed) and isCharOnFoot(playerPed) and not sampIsChatInputActive() and walk > 0 then 
			walk = walk + 1
		end
		if isKeyJustPressed(KeySubSpeed) and isCharOnFoot(playerPed) and not sampIsChatInputActive() and walk > 0 then 
			walk = walk - 1
		end
	end
end