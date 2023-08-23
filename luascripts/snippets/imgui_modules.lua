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