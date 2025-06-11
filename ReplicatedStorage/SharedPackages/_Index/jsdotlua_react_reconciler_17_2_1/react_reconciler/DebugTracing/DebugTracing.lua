--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.DebugTracing (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("shared")).console
local v2 = {}
local v_u_3 = nil
require(script.Parent:WaitForChild("ReactFiberLane"))
local v_u_4 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableDebugTracing
local v_u_5 = nil
local v_u_6 = {}
local v_u_7 = 0
function decimalToBinaryString(p8)
    local v9 = ""
    repeat
        local v10 = p8 / 2
        local v11
        p8, v11 = math.modf(v10)
        v9 = math.ceil(v11) .. v9
    until p8 == 0
    local v12 = 31 - string.len(v9)
    return string.rep("0", v12) .. v9
end
local function v_u_15(...)
    for _, v13 in { ... } do
        local v14 = v_u_6
        table.insert(v14, v13)
    end
    if v_u_5 == nil then
        v_u_5 = v_u_1.log
        v_u_1.log = v_u_3
    end
end
local function v_u_16()
    table.remove(v_u_6, 1)
    while v_u_7 > #v_u_6 do
        v_u_1.groupEnd()
        v_u_7 = v_u_7 - 1
    end
    if #v_u_6 == 0 then
        v_u_1.log = v_u_5
        v_u_5 = nil
    end
end
v_u_3 = function(...)
    if v_u_7 < #v_u_6 then
        for v17 = v_u_7 + 1, #v_u_6 do
            local v18 = v_u_6[v17]
            v_u_1.group(v18)
        end
        v_u_7 = #v_u_6
    end
    local v19 = v_u_5
    if typeof(v19) == "function" then
        v_u_5(...)
    else
        v_u_1.log(...)
    end
end
function v2.logCommitStarted(p20)
    if _G.__DEV__ and v_u_4 then
        v_u_15(string.format("* commit (%s)", "0b" .. decimalToBinaryString(p20)), "", "", "")
    end
end
function v2.logCommitStopped()
    if _G.__DEV__ and v_u_4 then
        v_u_16()
    end
end
function v2.logComponentSuspended(p_u_21, p22)
    if _G.__DEV__ and v_u_4 then
        v_u_3(string.format("* %s suspended", p_u_21))
        p22:andThen(function()
            v_u_3(string.format("* %s resolved", p_u_21))
        end, function()
            v_u_3(string.format("* %s rejected", p_u_21))
        end)
    end
end
function v2.logLayoutEffectsStarted(p23)
    if _G.__DEV__ and v_u_4 then
        v_u_15(string.format("* layout effects (%s)", "0b" .. decimalToBinaryString(p23)))
    end
end
function v2.logLayoutEffectsStopped()
    if _G.__DEV__ and v_u_4 then
        v_u_16()
    end
end
function v2.logPassiveEffectsStarted(p24)
    if _G.__DEV__ and v_u_4 then
        v_u_15(string.format("* passive effects (%s)", "0b" .. decimalToBinaryString(p24)))
    end
end
function v2.logPassiveEffectsStopped()
    if _G.__DEV__ and v_u_4 then
        v_u_16()
    end
end
function v2.logRenderStarted(p25)
    if _G.__DEV__ and v_u_4 then
        v_u_15(string.format("* render (%s)", "0b" .. decimalToBinaryString(p25)))
    end
end
function v2.logRenderStopped()
    if _G.__DEV__ and v_u_4 then
        v_u_16()
    end
end
function v2.logForceUpdateScheduled(p26, p27)
    if _G.__DEV__ and v_u_4 then
        v_u_3(string.format("* %s forced update (%s)", p26, "0b" .. decimalToBinaryString(p27)))
    end
end
function v2.logStateUpdateScheduled(p28, p29, _)
    if _G.__DEV__ and v_u_4 then
        v_u_3(string.format("* %s updated state (%s)", p28, "0b" .. decimalToBinaryString(p29)))
    end
end
return v2