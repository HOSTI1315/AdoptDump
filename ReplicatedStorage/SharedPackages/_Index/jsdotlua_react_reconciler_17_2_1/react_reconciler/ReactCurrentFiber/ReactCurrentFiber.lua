--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactCurrentFiber (ModuleScript)

local v_u_1 = _G.__DEV__
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v2 = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals
local v_u_3 = require(script.Parent:WaitForChild("ReactFiberComponentStack")).getStackByFiberInDevAndProd
local v_u_4 = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local v_u_5 = v2.ReactDebugCurrentFrame
local v_u_7 = {
    ["current"] = nil,
    ["isRendering"] = false,
    ["getCurrentFiberOwnerNameInDevOrNull"] = function()
        if v_u_1 then
            if v_u_7.current == nil then
                return nil
            end
            local v6 = v_u_7.current._debugOwner
            if v6 then
                return v_u_4(v6.type)
            end
        end
        return nil
    end
}
local function v_u_8()
    return not v_u_1 and "" or (v_u_7.current == nil and "" or v_u_3(v_u_7.current))
end
function v_u_7.resetCurrentFiber()
    if v_u_1 then
        v_u_5.getCurrentStack = nil
        v_u_7.current = nil
        v_u_7.isRendering = false
    end
end
function v_u_7.setCurrentFiber(p9)
    if v_u_1 then
        v_u_5.getCurrentStack = v_u_8
        v_u_7.current = p9
        v_u_7.isRendering = false
    end
end
function v_u_7.setIsRendering(p10)
    if v_u_1 then
        v_u_7.isRendering = p10
    end
end
function v_u_7.getIsRendering()
    if v_u_1 then
        return v_u_7.isRendering
    else
        return false
    end
end
return v_u_7