require "lib.moonloader"
local imgui = require('imgui')
script_description("various unusual elements")

-- Description: Shows a hint on mouse hover
function imgui.TextQuestion(label, description)
    imgui.TextDisabled(label)

    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
            imgui.PushTextWrapPos(600)
                imgui.TextUnformatted(description)
            imgui.PopTextWrapPos()
        imgui.EndTooltip()
    end
end

-- Description: Draws a vertical separator (imgui.Separator)
function imgui.VerticalSeparator()
    local p = imgui.GetCursorScreenPos()
    imgui.GetWindowDrawList():AddLine(imgui.ImVec2(p.x, p.y), imgui.ImVec2(p.x, p.y + imgui.GetContentRegionMax().y), imgui.GetColorU32(imgui.GetStyle().Colors[imgui.Col.Separator]))
end

-- Description: Customizing text in the img user interface.Columns(number) 
-- of imgui.SetColumnWidth(start, _end)
-- Example: imgui.SetColumnWidth(-1, 77); imgui.CenterColumnText(u8'Рация'); imgui.NextColumn()
function imgui.CenterColumnText(text)
    imgui.SetCursorPosX((imgui.GetColumnOffset() + (imgui.GetColumnWidth() / 2)) - imgui.CalcTextSize(text).x / 2)
    imgui.Text(text)
end

-- Description: CheckComboBox for imgui (not in regular ImGui)
-- Example: imgui.CheckComboBox('CheckComboBox1', items, chosen_items)
function imgui.CheckComboBox(str_id, array, chosen_array) -- by aurora
    local p = imgui.GetCursorScreenPos()
    local pos = imgui.GetWindowPos()
    local choose = imgui.ImInt(0)
    local textbuffer = table.concat(chosen_array, ", ", 1,#chosen_array)
    local buf = imgui.ImBuffer(textbuffer,256)
    for i = 1, #chosen_array do
        if chosen_array[i]:find('[+]') then
            chosen_array[i] = chosen_array[i]:match("%p+%p(.+)")
        end
    end
    if imgui.Combo(str_id, choose, array) then
        for i = 0, #array do
            if choose.v == i then
                chosen.v = false
                for k,v in ipairs(chosen_array) do
                    if '[+]' .. v == array[i+1] then
                        chosen.v = true
                        table.remove(chosen_array,k)
                        array[i+1] = array[i+1]:match("%p+%p(.+)")
                    end
                end
                if not chosen.v then
                    table.insert(chosen_array, array[i+1])
                    table.remove(array, i+1)
                    table.insert(array,i+1,'[+]' .. chosen_array[#chosen_array])
                end
            end
        end
    end
    imgui.SameLine()
    imgui.SetCursorPosX(p.x-pos.x)
    imgui.PushItemWidth(imgui.CalcItemWidth()-20)
    imgui.InputText("##" .. str_id,buf)
    imgui.NewLine()
end

-- Description: A simple button that is painted depending on the variable.
-- Example: 
-- if imgui.SelectButton('Health', health, imgui.ImVec2(100, 30)) then
--    SampAddChatMessage('Вы нажали на кнопку, переменная сейчас'..heath.v, -1)
-- end
function imgui.SelectButton(name, bool, size)
    if bool.v then
        imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.0, 0.6, 0.0, 0.40))
        imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.0, 0.8, 0.0, 1.0))
        imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(0.0, 1.0, 0.0, 1.0))
    else
        imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.6, 0.0, 0.0, 0.40))
        imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.8, 0.0, 0.0, 1.0))
        imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(1.0, 0.0, 0.0, 1.0))
    end
    if not size then size = imgui.ImVec2(0, 0) end
    local result = imgui.Button(name, size)
    imgui.PopStyleColor(3)
    if result then bool.v = not bool.v end
    return result
end