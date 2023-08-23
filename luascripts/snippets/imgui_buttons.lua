script_description("Imgui buttons snippets")
require "lib.moonloader"
local imgui = require 'imgui'

-- Description: Default button with size param 
if imgui.Button(u8"Default button", imgui.ImVec2(250, 25)) then
   print("Button size 250x25")
end

-- Description: Incative button
-- Example: 
-- local text = "test"
-- if imgui.Button(text=="test", "Label## ID") then
--   print("TEST")
-- end

function imgui.ButtonClickable(clickable, ...)
    if clickable then
        return imgui.Button(...)

    else
        local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
        imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
        imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
        imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
        imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
            imgui.Button(...)
        imgui.PopStyleColor()
        imgui.PopStyleColor()
        imgui.PopStyleColor()
        imgui.PopStyleColor()
    end
end

-- Description: Link button
-- Example: 
-- if imgui.Link("Download## ID", "Description") then
--    os.execute(('explorer.exe "%s"'):format("http://www.blast.hk"))
-- end
function imgui.Link(label, description)

    local size = imgui.CalcTextSize(label)
    local p = imgui.GetCursorScreenPos()
    local p2 = imgui.GetCursorPos()
    local result = imgui.InvisibleButton(label, size)

    imgui.SetCursorPos(p2)

    if imgui.IsItemHovered() then
        if description then
            imgui.BeginTooltip()
            imgui.PushTextWrapPos(600)
            imgui.TextUnformatted(description)
            imgui.PopTextWrapPos()
            imgui.EndTooltip()

        end

        imgui.TextColored(imgui.GetStyle().Colors[imgui.Col.CheckMark], label)
        imgui.GetWindowDrawList():AddLine(imgui.ImVec2(p.x, p.y + size.y), imgui.ImVec2(p.x + size.x, p.y + size.y), imgui.GetColorU32(imgui.GetStyle().Colors[imgui.Col.CheckMark]))

    else
        imgui.TextColored(imgui.GetStyle().Colors[imgui.Col.CheckMark], label)
    end

    return result
end

-- Description: Highlighted button (tab)
function imgui.ButtonActivated(activated, ...)
    if activated then
        imgui.PushStyleColor(imgui.Col.Button, imgui.GetStyle().Colors[imgui.Col.CheckMark])
        imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.GetStyle().Colors[imgui.Col.CheckMark])
        imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.GetStyle().Colors[imgui.Col.CheckMark])

            imgui.Button(...)

        imgui.PopStyleColor()
        imgui.PopStyleColor()
        imgui.PopStyleColor()

    else
        return imgui.Button(...)
    end
end

-- Description: A simple button that is painted depending on the variable.
-- Example: imgui.SelectButton('Health', health, imgui.ImVec2(100, 30))
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

-- Outdated! Better way use imgui_addons library: https://blast.hk/threads/27544/
-- Description: Draws the on/off switch button.
-- Example:
-- if imgui.ToggleButton("Test##1", imBool) then
--    sampAddChatMessage("You change status, new status: " .. tostring(imBool.v), -1)
-- end
function imgui.ToggleButton(str_id, bool)

   local rBool = false

   if LastActiveTime == nil then
      LastActiveTime = {}
   end
   if LastActive == nil then
      LastActive = {}
   end

   local function ImSaturate(f)
      return f < 0.0 and 0.0 or (f > 1.0 and 1.0 or f)
   end
 
   local p = imgui.GetCursorScreenPos()
   local draw_list = imgui.GetWindowDrawList()

   local height = imgui.GetTextLineHeightWithSpacing() + (imgui.GetStyle().FramePadding.y / 2)
   local width = height * 1.55
   local radius = height * 0.50
   local ANIM_SPEED = 0.15

   if imgui.InvisibleButton(str_id, imgui.ImVec2(width, height)) then
      bool.v = not bool.v
      rBool = true
      LastActiveTime[tostring(str_id)] = os.clock()
      LastActive[str_id] = true
   end

   local t = bool.v and 1.0 or 0.0

   if LastActive[str_id] then
      local time = os.clock() - LastActiveTime[tostring(str_id)]
      if time <= ANIM_SPEED then
         local t_anim = ImSaturate(time / ANIM_SPEED)
         t = bool.v and t_anim or 1.0 - t_anim
      else
         LastActive[str_id] = false
      end
   end

   local col_bg
   if imgui.IsItemHovered() then
      col_bg = imgui.GetColorU32(imgui.GetStyle().Colors[imgui.Col.FrameBgHovered])
   else
      col_bg = imgui.GetColorU32(imgui.GetStyle().Colors[imgui.Col.FrameBg])
   end

   draw_list:AddRectFilled(p, imgui.ImVec2(p.x + width, p.y + height), col_bg, height * 0.5)
   draw_list:AddCircleFilled(imgui.ImVec2(p.x + radius + t * (width - radius * 2.0), p.y + radius), radius - 1.5, imgui.GetColorU32(bool.v and imgui.GetStyle().Colors[imgui.Col.ButtonActive] or imgui.GetStyle().Colors[imgui.Col.Button]))

   return rBool
end