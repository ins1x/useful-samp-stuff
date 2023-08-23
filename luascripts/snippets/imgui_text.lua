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