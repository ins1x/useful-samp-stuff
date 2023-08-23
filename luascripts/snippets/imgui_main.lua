require "lib.moonloader"
local imgui = require('imgui')
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
     
local window = imgui.ImBool(false)
     
function main()
    while not isSampAvailable() do wait(200) end
    imgui.Process = false
    window.v = true  --show window on start
    while true do
        wait(0)
        imgui.Process = window.v
    end
end
     
function imgui.OnDrawFrame()
    if window.v then
        local resX, resY = getScreenResolution()
        local sizeX, sizeY = 300, 300 -- WINDOW SIZE
        imgui.SetNextWindowPos(imgui.ImVec2(resX / 2 - sizeX / 2, resY / 2 - sizeY / 2), imgui.Cond.FirstUseEver)
        imgui.SetNextWindowSize(imgui.ImVec2(sizeX, sizeY), imgui.Cond.FirstUseEver)
        imgui.Begin('Window Title', window)
        --window code
    
        imgui.End()
    end
end