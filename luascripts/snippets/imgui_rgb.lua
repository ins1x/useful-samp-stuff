require "lib.moonloader"
local imgui = require('imgui')
script_description("RGB functions snippet")

-- Description: Colored text
-- Example: imgui.TextColoredRGB("{FF0000}T{FFFF00}E{FFF000}S{FFFFF0}T")
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
                    imgui.TextColored(colors_[i] or colors[1], u8(text[i]))
                    imgui.SameLine(nil, 0)
                end
                imgui.NewLine()
            else imgui.Text(u8(w)) end
        end
    end

    render_text(text)
end

-- Description: random rgb color
-- Example: 
-- local r, g, b, a = rainbow(3, 255)
-- local color = rgbToHex(r,g,b)
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

-- Description: splits into components the color represented as a whole (alpha, red, green, blue)
function explode_argb(argb)
   local a = bit.band(bit.rshift(argb, 24), 0xFF)
   local r = bit.band(bit.rshift(argb, 16), 0xFF)
   local g = bit.band(bit.rshift(argb, 8), 0xFF)
   local b = bit.band(argb, 0xFF)
   return a, r, g, b
end

-- Description: reverse operation - converts the color alpha, red, green, blue into an integer
-- Example: 
-- imgui.Text("HEX: " ..intToHex(join_argb(color.v[4] * 255,
-- color.v[1] * 255, color.v[2] * 255, color.v[3] * 255)))
function join_argb(a, r, g, b)
    local argb = b  -- b
    argb = bit.bor(argb, bit.lshift(g, 8))  -- g
    argb = bit.bor(argb, bit.lshift(r, 16)) -- r
    argb = bit.bor(argb, bit.lshift(a, 24)) -- a
    return argb
end

-- Description: the function converts the ARGB color represented as an integer to RGBA as an integer
function argb_to_rgba(argb)
   local a, r, g, b = explode_argb(argb)
   return join_argb(r, g, b, a)
end

function intToHex(int)
    return '{'..string.sub(bit.tohex(int), 3, 8)..'}'
end

-- Description: colored Separator
-- Example: imgui.ColSeparator("FF0000")
function imgui.ColSeparator(hex,trans)
    local r,g,b = tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))
    if tonumber(trans) ~= nil and tonumber(trans) < 101 and tonumber(trans) > 0 then
        a = trans
    else a = 100 end
    imgui.PushStyleColor(imgui.Col.Separator, imgui.ImVec4(r/255, g/255, b/255, a/100))
    local colsep = imgui.Separator()
    imgui.PopStyleColor(1)
    return colsep
end