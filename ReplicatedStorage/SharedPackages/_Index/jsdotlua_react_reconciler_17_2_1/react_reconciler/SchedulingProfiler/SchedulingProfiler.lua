--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.SchedulingProfiler (ModuleScript)

local v1 = {}
local v2 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).WeakMap
require(script.Parent:WaitForChild("ReactFiberLane"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
require(script.Parent.Parent:WaitForChild("shared"))
local v_u_3 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableSchedulingProfiler
local v4 = require(script.Parent.Parent:WaitForChild("shared")).ReactVersion
local v_u_5 = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local v_u_6 = _G.performance ~= nil
local v_u_8 = _G.performance or {
    ["mark"] = function(p7)
        debug.profilebegin(p7)
        debug.profileend()
    end
}
function formatLanes(p9)
    return tostring(p9)
end
if v_u_3 and v_u_6 then
    v_u_8.mark("--react-init-" .. tostring(v4))
end
function v1.markCommitStarted(p10)
    if v_u_3 and v_u_6 then
        v_u_8.mark("--commit-start-" .. formatLanes(p10))
    end
end
function v1.markCommitStopped()
    if v_u_3 and v_u_6 then
        v_u_8.mark("--commit-stop")
    end
end
local v_u_11 = v2.new()
local v_u_12 = 0
function getWakeableID(p13)
    if not v_u_11:has(p13) then
        v_u_11:set(p13, v_u_12)
        v_u_12 = v_u_12 + 1
    end
    return v_u_11:get(p13)
end
function v1.markComponentSuspended(p14, p15)
    if v_u_3 and v_u_6 then
        local v_u_16 = getWakeableID(p15)
        local v_u_17 = v_u_5(p14.type) or "Unknown"
        v_u_8.mark("--suspense-suspend-" .. tostring(v_u_16) .. "-" .. v_u_17)
        p15:andThen(function()
            local v18 = v_u_16
            v_u_8.mark("--suspense-resolved-" .. tostring(v18) .. "-" .. v_u_17)
        end, function()
            local v19 = v_u_16
            v_u_8.mark("--suspense-rejected-" .. tostring(v19) .. "-" .. v_u_17)
        end)
    end
end
function v1.markLayoutEffectsStarted(p20)
    if v_u_3 and v_u_6 then
        v_u_8.mark("--layout-effects-start-" .. formatLanes(p20))
    end
end
function v1.markLayoutEffectsStopped()
    if v_u_3 and v_u_6 then
        v_u_8.mark("--layout-effects-stop")
    end
end
function v1.markPassiveEffectsStarted(p21)
    if v_u_3 and v_u_6 then
        v_u_8.mark("--passive-effects-start-" .. formatLanes(p21))
    end
end
function v1.markPassiveEffectsStopped()
    if v_u_3 and v_u_6 then
        v_u_8.mark("--passive-effects-stop")
    end
end
function v1.markRenderStarted(p22)
    if v_u_3 and v_u_6 then
        v_u_8.mark("--render-start-" .. formatLanes(p22))
    end
end
function v1.markRenderYielded()
    if v_u_3 and v_u_6 then
        v_u_8.mark("--render-yield")
    end
end
function v1.markRenderStopped()
    if v_u_3 and v_u_6 then
        v_u_8.mark("--render-stop")
    end
end
function v1.markRenderScheduled(p23)
    if v_u_3 and v_u_6 then
        v_u_8.mark("--schedule-render-" .. formatLanes(p23))
    end
end
function v1.markForceUpdateScheduled(p24, p25)
    if v_u_3 and v_u_6 then
        local v26 = v_u_5(p24.type) or "Unknown"
        v_u_8.mark("--schedule-forced-update-" .. formatLanes(p25) .. "-" .. v26)
    end
end
function v1.markStateUpdateScheduled(p27, p28)
    if v_u_3 and v_u_6 then
        local v29 = v_u_5(p27.type) or "Unknown"
        v_u_8.mark("--schedule-state-update-" .. formatLanes(p28) .. "-" .. v29)
    end
end
return v1