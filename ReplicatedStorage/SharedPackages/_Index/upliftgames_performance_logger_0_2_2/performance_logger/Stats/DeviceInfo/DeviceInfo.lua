--// ReplicatedStorage.SharedPackages._Index.upliftgames_performance-logger@0.2.2.performance-logger.Stats.DeviceInfo (ModuleScript)

local v1 = require(script.Parent.Parent.Class)
local v_u_2 = require(script.Parent.Parent.Parent.t)
local v_u_3 = v_u_2.numberConstrainedExclusive((-1 / 0), (1 / 0))
local v_u_4 = game:GetService("UserInputService")
local v_u_5 = game:GetService("GuiService")
local v_u_6 = {
    "isTouchEnabled",
    "isGyroscopeEnabled",
    "isAccelerometerEnabled",
    "isKeyboardEnabled",
    "isMouseEnabled",
    "isVrEnabled",
    "isTenFootInterface"
}
local v7 = v1("DeviceInfo")
function v7.__init(p8)
    p8.stats = {}
    p8.stats.initialized = false
    p8.stats.viewportSizeX = 0
    p8.stats.viewportSizeY = 0
    p8.stats.viewportSize = "0x0"
    p8.stats.isTouchEnabled = false
    p8.stats.isGamepadEnabled = false
    p8.stats.isGyroscopeEnabled = false
    p8.stats.isAccelerometerEnabled = false
    p8.stats.isKeyboardEnabled = false
    p8.stats.isMouseEnabled = false
    p8.stats.isVrEnabled = false
    p8.stats.isTenFootInterface = false
    p8.stats.deviceConfig = "none"
    local v9 = {}
    for v10, v11 in pairs(p8.stats) do
        if typeof(v11) == "boolean" then
            v9[v10] = v_u_2.boolean
        elseif typeof(v11) == "number" then
            v9[v10] = v_u_2.every(v_u_3, v_u_2.numberMin(0))
        elseif typeof(v11) == "string" then
            v9[v10] = v_u_2.every(v_u_2.string, function(p12)
                return #p12 < 100
            end)
        end
    end
    p8.isSerializedData = v_u_2.strictInterface(v9)
end
function v7.updateStats(p13)
    p13.stats.initialized = true
    p13.stats.viewportSizeX = workspace.CurrentCamera.ViewportSize.x
    p13.stats.viewportSizeY = workspace.CurrentCamera.ViewportSize.y
    p13.stats.viewportSize = workspace.CurrentCamera.ViewportSize.x .. "x" .. workspace.CurrentCamera.ViewportSize.y
    p13.stats.isTouchEnabled = v_u_4.TouchEnabled
    p13.stats.isGamepadEnabled = v_u_4.GamepadEnabled
    p13.stats.isGyroscopeEnabled = v_u_4.GyroscopeEnabled
    p13.stats.isAccelerometerEnabled = v_u_4.AccelerometerEnabled
    p13.stats.isKeyboardEnabled = v_u_4.KeyboardEnabled
    p13.stats.isMouseEnabled = v_u_4.MouseEnabled
    p13.stats.isVrEnabled = v_u_4.VREnabled
    p13.stats.isTenFootInterface = v_u_5:IsTenFootInterface()
    local v14 = {}
    local v15 = p13.stats.viewportSize
    table.insert(v14, v15)
    table.insert(v14, ":")
    for _, v16 in ipairs(v_u_6) do
        local v17 = p13.stats[v16] and "t" or "f"
        table.insert(v14, v17)
    end
    p13.stats.deviceConfig = table.concat(v14)
end
function v7.serialize(p18)
    local v19 = {}
    for v20, v21 in pairs(p18.stats) do
        v19[v20] = v21
    end
    return v19
end
function v7.deserializeReplace(p22, p23)
    local v24 = p22.isSerializedData
    assert(v24(p23))
    for v25, v26 in pairs(p23) do
        p22.stats[v25] = v26
    end
end
v7.deserializeAdd = v7.deserializeReplace
function v7.describe(p27, p28, p29)
    if p27.stats.initialized then
        for v30, v31 in pairs(p27.stats) do
            if v30 ~= "initialized" then
                p28[p29 .. "." .. v30] = v31
            end
        end
    end
end
return v7