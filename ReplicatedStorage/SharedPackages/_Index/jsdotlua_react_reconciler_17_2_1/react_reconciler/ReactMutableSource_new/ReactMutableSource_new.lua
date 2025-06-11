--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactMutableSource.new (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("shared")).console
local v2 = {}
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v_u_3 = require(script.Parent:WaitForChild("ReactFiberHostConfig")).isPrimaryRenderer
local v_u_4 = {}
local v_u_5 = _G.__DEV__ and {} or nil
function v2.markSourceAsDirty(p6)
    local v7 = v_u_4
    table.insert(v7, p6)
end
function v2.resetWorkInProgressVersions()
    for _, v8 in v_u_4 do
        if v_u_3 then
            v8._workInProgressVersionPrimary = nil
        else
            v8._workInProgressVersionSecondary = nil
        end
    end
    table.clear(v_u_4)
end
function v2.getWorkInProgressVersion(p9)
    if v_u_3 then
        return p9._workInProgressVersionPrimary
    else
        return p9._workInProgressVersionSecondary
    end
end
function v2.setWorkInProgressVersion(p10, p11)
    if v_u_3 then
        p10._workInProgressVersionPrimary = p11
    else
        p10._workInProgressVersionSecondary = p11
    end
    local v12 = v_u_4
    table.insert(v12, p10)
end
function v2.warnAboutMultipleRenderersDEV(p13)
    if _G.__DEV__ then
        if v_u_3 then
            if p13._currentPrimaryRenderer == nil then
                p13._currentPrimaryRenderer = v_u_5
                return
            end
            if p13._currentPrimaryRenderer ~= v_u_5 then
                v_u_1.error("Detected multiple renderers concurrently rendering the same mutable source. This is currently unsupported.")
                return
            end
        else
            if p13._currentSecondaryRenderer == nil then
                p13._currentSecondaryRenderer = v_u_5
                return
            end
            if p13._currentSecondaryRenderer ~= v_u_5 then
                v_u_1.error("Detected multiple renderers concurrently rendering the same mutable source. This is currently unsupported.")
            end
        end
    end
end
function v2.registerMutableSourceForHydration(p14, p15)
    local v16 = p15._getVersion(p15._source)
    if p14.mutableSourceEagerHydrationData == nil then
        p14.mutableSourceEagerHydrationData = { p15, v16 }
    end
end
return v2