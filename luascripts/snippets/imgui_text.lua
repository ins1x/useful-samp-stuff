require "lib.moonloader"
local imgui = require('imgui')
script_description("Text snippets")

-- Example:
-- imgui.CenterText("demo")
function imgui.CenterText(text)
    imgui.SetCursorPosX(imgui.GetWindowSize().x / 2 - imgui.CalcTextSize(text).x / 2)
    imgui.Text(text)
end

-- Description: imgui.inputText() with a hint inside
-- Example: 
-- imgui.NewInputText('##SearchBar', sBuffer, 300, u8'Поиск по списку', 2)
function imgui.NewInputText(lable, val, width, hint, hintpos)
    local hint = hint and hint or ''
    local hintpos = tonumber(hintpos) and tonumber(hintpos) or 1
    local cPos = imgui.GetCursorPos()
    imgui.PushItemWidth(width)
    local result = imgui.InputText(lable, val)
    if #val.v == 0 then
        local hintSize = imgui.CalcTextSize(hint)
        if hintpos == 2 then imgui.SameLine(cPos.x + (width - hintSize.x) / 2)
        elseif hintpos == 3 then imgui.SameLine(cPos.x + (width - hintSize.x - 5))
        else imgui.SameLine(cPos.x + 5) end
        imgui.TextColored(imgui.ImVec4(1.00, 1.00, 1.00, 0.40), tostring(hint))
    end
    imgui.PopItemWidth()
    return result
end

-- Description: Splits a string into an array.
-- Example: 
-- local tbl = stringToArray("Hello world")
-- print(table.concat(tbl, " "))
function stringToArray(str)
   local t = {}
   for i = 1, #str do
      t[i] = str:sub(i, i)
   end
   return t
end

-- Description: a compact function for splitting a string into tokens by separator.
-- Example: 
-- local strings = split('A b c.123.Defghk..heh.', '.')
function split(str, delim, plain)
    local tokens, pos, plain = {}, 1, not (plain == false) --[[ delimiter is plain text by default ]]
    repeat
        local npos, epos = string.find(str, delim, pos, plain)
        table.insert(tokens, string.sub(str, pos, npos and npos - 1))
        pos = epos and epos + 1
    until not pos
    return tokens
end

-- Description: converts a string to lowercase
function string.rlower(s)
	s = s:lower()
	local strlen = s:len()
	if strlen == 0 then return s end
	s = s:lower()
	local output = ''
	for i = 1, strlen do
		local ch = s:byte(i)
		if ch >= 192 and ch <= 223 then
			output = output .. russian_characters[ch + 32]
		elseif ch == 168 then
			output = output .. russian_characters[184]
		else
			output = output .. string.char(ch)
		end
	end
	return output
end

-- Description: converts a string to uppercase
function string.rupper(s)
	s = s:upper()
	local strlen = s:len()
	if strlen == 0 then return s end
	s = s:upper()
	local output = ''
	for i = 1, strlen do
		local ch = s:byte(i)
		if ch >= 224 and ch <= 255 then
			output = output .. russian_characters[ch - 32]
		elseif ch == 184 then
			output = output .. russian_characters[168]
		else
			output = output .. string.char(ch)
		end
	end
	return output
end

-- Description: Trims spaces at the edges of the string (trimming)
function trim(s)
    return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

-- Description: Draws text colored with a gradient.
-- Example: renderGradientText(font, 'This is a gradient text.', 300, 300, '007FFF', 'FF00FF')
function renderGradientText(font, text, posX, posY, startingColor, endingColor)
    local startingColorComponents = { startingColor:match('(..)(..)(..)') }
    local endingColorComponents = { endingColor:match('(..)(..)(..)') }
    for i = 1, 3 do
        startingColorComponents[i] = tonumber(startingColorComponents[i], 16)
        endingColorComponents[i] = tonumber(endingColorComponents[i], 16)
    end
    local length = text:len()
    local gradient = ''
    local function shift(comp, i)
        return startingColorComponents[comp] + (endingColorComponents[comp] - startingColorComponents[comp]) * ((i - 1) / (length - 1))
    end
    for i = 1, length do
        local R = shift(1, i)
        local G = shift(2, i)
        local B = shift(3, i)
        gradient = gradient .. string.format('{%0.2x%0.2x%0.2x}%s', R, G, B, text:sub(i, i))
    end
    renderFontDrawText(font, gradient, posX, posY, -1)
end

-- Description: Imgui text with shadow
function ColoredTextWithShadow(color, text)
    local pos = imgui.GetCursorPos()
    imgui.SetCursorPos(imgui.ImVec2(pos.x + 1, pos.y + 1))
    imgui.TextColored(imgui.ImVec4(0, 0, 0, 1), text) -- shadow
    imgui.SetCursorPos(pos)
    imgui.TextColored(color, text)
end

-- Description: sending multiline text text to the chat with a certain delay 
-- Example: 
--text = [[Lorem ipsum dolor sit amet,
--consectetur adipiscing elit,
--sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
--]]
--multiStringSendChat(1200, text)
function multiStringSendChat(delay, multiStringText)   
    lua_thread.create(function()
        multiStringText = multiStringText..'\n'
        for s in multiStringText:gmatch('.-\n') do
            sampSendChat(s)
            wait(delay)
        end
    end)
end

-- Description: Converting a hexadecimal/decimal number to binary
function toBinary(dec, bits)
    local bin = ""
    for i = bits - 1, 0, -1 do
        bin = bin..bit.band(bit.rshift(dec, i), 1)
    end
    return bin 
end