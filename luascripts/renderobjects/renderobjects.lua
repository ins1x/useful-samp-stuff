script_name("Renderobjects")
script_description("Visual objects render")
script_dependencies("inicfg", "imgui")
script_url("https://github.com/ins1x/useful-samp-stuff")
script_version("0.1")
-- script_moonloader(16) moonloader v.0.26
-- script forked of original version and updated by 1NS: https://www.blast.hk/threads/24320/

local imgui = require("imgui")
local inicfg = require("inicfg")

local x2, y2 = getScreenResolution()
local checkboxRenderAll = imgui.ImBool(false)
local checkboxShowIDs = imgui.ImBool(false)
local checkboxRenderIDsByRule = imgui.ImBool(false)
local traser = imgui.ImBool(false)
local rgbtraser = imgui.ImBool(false)
local mainWindow = imgui.ImBool(false)
local removeObject = imgui.ImInt(0)

-- imgui style
local style = imgui.GetStyle()
local colors = style.Colors
local clr = imgui.Col
local ImVec4 = imgui.ImVec4
local ImVec2 = imgui.ImVec2

-- setiings and tables
local defaultConfig = {
    {false},
    {19481, "BigTextBox", false},
    {19477, "MiddleTextBox", false}
}

sortedObjectsTable = {}

function main()
    while not isSampAvailable() do
        wait(100)
    end
	
    if not doesDirectoryExist("moonloader//config") then
        createDirectory("moonloader//config")
        inicfg.save(defaultConfig, "renderobjects")
    end
    sortedObjectsData = inicfg.load(nil, "renderobjects")
    if not sortedObjectsData then
        inicfg.save(defaultConfig, "renderobjects")
        sortedObjectsData = inicfg.load(nil, "renderobjects")
    end
	
    for i, value in ipairs(sortedObjectsData) do
        if #value == 3 then
            table.insert(
                sortedObjectsTable,
                {imgui.ImInt(value[1]), 
				imgui.ImBuffer((tostring(value[2])), 20),
				imgui.ImBool(value[3])}
            )
        else
            checkboxRenderByRule = imgui.ImBool(value[1])
        end
    end
	
    local font = renderCreateFont("Arial", 8, 4)
    sampRegisterChatCommand(
        "renderob",
        function()
            mainWindow.v = not mainWindow.v
        end
    )
			
    while true do
        wait(0)
        imgui.Process = mainWindow.v
	  
        if checkboxRenderAll.v or checkboxRenderByRule.v then
            for _, v in pairs(getAllObjects()) do
                local objectid
				
                if sampGetObjectSampIdByHandle(v) ~= -1 then
                    objectid = sampGetObjectSampIdByHandle(v)
                end
				
                if isObjectOnScreen(v) and not isPauseMenuActive() then
                    local _, x, y, z = getObjectCoordinates(v)
                    local x1, y1 = convert3DCoordsToScreen(x, y, z)
                    local model = getObjectModel(v)
                    local x2, y2, z2 = getCharCoordinates(PLAYER_PED)
                    local x10, y10 = convert3DCoordsToScreen(x2, y2, z2)
                    local distance = getDistanceBetweenCoords3d(x, y, z, x2, y2, z2)
					local r, g, b, a = rainbow(0.5, 255)
                    local color = string.format("0xFF%s", rgbToHex(r,g,b))
					local mindistance = 0.8 
					
					-- mindistance used to ignore player attached objects
					-- isObjectAttached(object) not working in moonloader 026					
                    if checkboxRenderAll.v and distance > mindistance then
                        renderFontDrawText(
                            font,
                            (checkboxShowIDs.v and objectid 
							and "model = " .. model .. "; id = " .. objectid
							or "model = " .. model) .. "; distance: "
							.. string.format("%.1f", distance),
                            x1, y1, -1
                        )
                        if traser.v then 
						   if rgbtraser.v then 
						      renderDrawLine(x10, y10, x1, y1, 1.0, color)
						   else
						      renderDrawLine(x10, y10, x1, y1, 1.0, -1)
						   end
						end
						
                    elseif checkboxRenderByRule.v then
                        for _, v2 in ipairs(sortedObjectsTable) do
                            if v2[1].v == model and v2[3].v then
                                renderFontDrawText(
                                    font,
                                    (v2[2].v:find(".+") and v2[2].v or
                                        checkboxRenderIDsByRule.v and objectid 
										and "model = " .. model .. "; id = " .. objectid
										or "model = " .. model) .. "; distance: " 
										.. string.format("%.1f", distance),
                                    x1, y1, -1
                                )
                                if traser.v then
								   if rgbtraser.v then 
						              renderDrawLine(x10, y10, x1, y1, 1.0, color)
						           else
						              renderDrawLine(x10, y10, x1, y1, 1.0, -1)
						           end
								end
                            end
                        end
                    end
                end
            end
        end
    end
end

function imgui.OnDrawFrame()
    imgui.SetNextWindowPos(imgui.ImVec2(x2 / 2, y2 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(480, 450), imgui.Cond.FirstUseEver)
    
	imgui.Begin(
        "Render objects",
        mainWindow,
        imgui.WindowFlags.AlwaysAutoResize + imgui.WindowFlags.AlwaysUseWindowPadding + imgui.WindowFlags.NoResize +
            imgui.WindowFlags.AlwaysUseWindowPadding
    )
    
	imgui.Checkbox("Enable tracer", traser)
	if traser.v then
	   imgui.SameLine()
	   imgui.Checkbox("Rainbow line colors", rgbtraser)
	end
	
	imgui.Checkbox("Find all objects", checkboxRenderAll)
    if checkboxRenderAll.v then
        imgui.SameLine()
        imgui.Checkbox("Show id near the model", checkboxShowIDs)
    end
    
	if imgui.Checkbox("Find objects by conditions", checkboxRenderByRule) then
        sortedObjectsData[1][1] = checkboxRenderByRule.v
        inicfg.save(sortedObjectsData, "renderobjects")
    end
    if checkboxRenderByRule.v then
        imgui.SameLine()
        imgui.Checkbox("Show id near the model", checkboxRenderIDsByRule)
    end
    
	imgui.PushItemWidth(50)
    imgui.InputInt("Delete object (visually)", removeObject, 0)
	imgui.PopItemWidth()
	imgui.SameLine()
	imgui.HelpMarker("Enter the object modelid to delete")
	
    if removeObject.v ~= 0 then
        imgui.SameLine()
        if (imgui.Button("Delete") and sampGetObjectHandleBySampId(removeObject.v) ~= -1) then
            deleteObject(sampGetObjectHandleBySampId(removeObject.v))
            removeObject.v = 0
        end
    end
	
	-- Child table
    imgui.BeginChild("sortedObjectsData", imgui.ImVec2(420, 240), true)
	
	imgui.Text("Set conditions ") 
	imgui.SameLine()
    if imgui.Button("Add a new") then
        table.insert(sortedObjectsTable, {imgui.ImInt(#sortedObjectsTable + 1), imgui.ImBuffer("", 20), imgui.ImBool(false)})
        table.insert(sortedObjectsData, {#sortedObjectsData, "", false})
        inicfg.save(sortedObjectsData, "renderobjects")
    end
    imgui.SameLine()
    if #sortedObjectsData > 0 then
        if imgui.Button("Remove last") then
            table.remove(sortedObjectsTable, #sortedObjectsTable)
            table.remove(sortedObjectsData, #sortedObjectsData)
            inicfg.save(sortedObjectsData, "renderobjects")
        end
    end
	
    for i, value in ipairs(sortedObjectsTable) do
	    imgui.PushItemWidth(50)
        if imgui.InputInt("##input" .. i, value[1], 0, -1) then
            sortedObjectsData[i + 1][1] = value[1].v
            inicfg.save(sortedObjectsData, "renderobjects")
        end
		imgui.PopItemWidth()
        imgui.SameLine()
        imgui.HelpMarker("Object Model")
        imgui.SameLine()
        imgui.PushItemWidth(230)
        if imgui.InputText("##name: " .. i, value[2]) then
            sortedObjectsData[i + 1][2] = value[2].v
            inicfg.save(sortedObjectsData, "renderobjects")
        end
        imgui.PopItemWidth()
        imgui.SameLine()
        imgui.HelpMarker("Name for the object (optional)")
        imgui.SameLine()
        if imgui.Checkbox("##isfind" .. i, value[3]) then
            sortedObjectsData[i + 1][3] = value[3].v
            inicfg.save(sortedObjectsData, "renderobjects")
        end
    end	
    imgui.EndChild()
	
	imgui.TextColoredRGB("Didn't find the right object? look at {ff7518}dev.prineside.com")
    if imgui.IsItemClicked() then
       setClipboardText("dev.prineside.com")
       printStringNow("url copied to clipboard", 1000)
    end
	imgui.SameLine()
	imgui.HelpMarker("Click on the link to copy URL")
    imgui.End()
end

-- imgui extended fuctions

function imgui.HelpMarker(param)
    imgui.TextDisabled("(?)")
    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.PushTextWrapPos(imgui.GetFontSize() * 35.0)
        imgui.TextUnformatted(param)
        imgui.PopTextWrapPos()
        imgui.EndTooltip()
    end
end

function imgui.TextColoredRGB(text)
    local style = imgui.GetStyle()
    local colors = style.Colors
    local ImVec4 = imgui.ImVec4

    local explode_argb = function(argb)
        local a = bit.band(bit.rshift(argb, 24), 0xFF)
        local r = bit.band(bit.rshift(argb, 16), 0xFF)
        local g = bit.band(bit.rshift(argb, 8), 0xFF)
        local b = bit.band(argb, 0xFF)
        return a, r, g, b
    end

    local getcolor = function(color)
        if color:sub(1, 6):upper() == 'SSSSSS' then
            local r, g, b = colors[1].x, colors[1].y, colors[1].z
            local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
            return ImVec4(r, g, b, a / 255)
        end
        local color = type(color) == 'string' and tonumber(color, 16) or color
        if type(color) ~= 'number' then return end
        local r, g, b, a = explode_argb(color)
        return imgui.ImColor(r, g, b, a):GetVec4()
    end

    local render_text = function(text_)
        for w in text_:gmatch('[^\r\n]+') do
            local text, colors_, m = {}, {}, 1
            w = w:gsub('{(......)}', '{%1FF}')
            while w:find('{........}') do
                local n, k = w:find('{........}')
                local color = getcolor(w:sub(n + 1, k - 1))
                if color then
                    text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
                    colors_[#colors_ + 1] = color
                    m = n
                end
                w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
            end
            if text[0] then
                for i = 0, #text do
                    imgui.TextColored(colors_[i] or colors[1], text[i])
                    imgui.SameLine(nil, 0)
                end
                imgui.NewLine()
            else imgui.Text(w) end
        end
    end

    render_text(text)
end

function rainbow(speed, alpha) 
	local r = math.floor(math.sin(os.clock() * speed) * 127 + 128)
	local g = math.floor(math.sin(os.clock() * speed + 2) * 127 + 128)
	local b = math.floor(math.sin(os.clock() * speed + 4) * 127 + 128)
	return r,g,b,alpha
end

function rgbToHex(r,g,b)
    local rgb = (r * 0x10000) + (g * 0x100) + b
    return bit.tohex(rgb, 6)
end
-- apply imgui theme 
imgui.SwitchContext()

style.WindowPadding = ImVec2(15, 15)
style.WindowRounding = 6.0
style.FramePadding = ImVec2(5, 5)
style.FrameRounding = 4.0
style.ItemSpacing = ImVec2(12, 8)
style.ItemInnerSpacing = ImVec2(8, 6)
style.IndentSpacing = 25.0
style.ScrollbarSize = 15.0
style.ScrollbarRounding = 9.0
style.GrabMinSize = 5.0
style.GrabRounding = 3.0

colors[clr.Text] = ImVec4(0.80, 0.80, 0.83, 1.00)
colors[clr.TextDisabled] = ImVec4(0.24, 0.23, 0.29, 1.00)
colors[clr.WindowBg] = ImVec4(0.06, 0.05, 0.07, 1.00)
colors[clr.ChildWindowBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
colors[clr.PopupBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
colors[clr.Border] = ImVec4(0.80, 0.80, 0.83, 0.88)
colors[clr.BorderShadow] = ImVec4(0.92, 0.91, 0.88, 0.00)
colors[clr.FrameBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
colors[clr.FrameBgHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
colors[clr.FrameBgActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
colors[clr.TitleBg] = ImVec4(0.76, 0.31, 0.00, 1.00)
colors[clr.TitleBgCollapsed] = ImVec4(1.00, 0.98, 0.95, 0.75)
colors[clr.TitleBgActive] = ImVec4(0.80, 0.33, 0.00, 1.00)
colors[clr.MenuBarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
colors[clr.ScrollbarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
colors[clr.ScrollbarGrab] = ImVec4(0.80, 0.80, 0.83, 0.31)
colors[clr.ScrollbarGrabHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
colors[clr.ScrollbarGrabActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
colors[clr.ComboBg] = ImVec4(0.19, 0.18, 0.21, 1.00)
colors[clr.CheckMark] = ImVec4(1.00, 0.42, 0.00, 0.53)
colors[clr.SliderGrab] = ImVec4(1.00, 0.42, 0.00, 0.53)
colors[clr.SliderGrabActive] = ImVec4(1.00, 0.42, 0.00, 1.00)
colors[clr.Button] = ImVec4(0.10, 0.09, 0.12, 1.00)
colors[clr.ButtonHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
colors[clr.ButtonActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
colors[clr.Header] = ImVec4(0.10, 0.09, 0.12, 1.00)
colors[clr.HeaderHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
colors[clr.HeaderActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
colors[clr.ResizeGrip] = ImVec4(0.00, 0.00, 0.00, 0.00)
colors[clr.ResizeGripHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
colors[clr.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
colors[clr.CloseButton] = ImVec4(0.40, 0.39, 0.38, 0.16)
colors[clr.CloseButtonHovered] = ImVec4(0.40, 0.39, 0.38, 0.39)
colors[clr.CloseButtonActive] = ImVec4(0.40, 0.39, 0.38, 1.00)
colors[clr.PlotLines] = ImVec4(0.40, 0.39, 0.38, 0.63)
colors[clr.PlotLinesHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
colors[clr.PlotHistogram] = ImVec4(0.40, 0.39, 0.38, 0.63)
colors[clr.PlotHistogramHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
colors[clr.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43)
colors[clr.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.73)