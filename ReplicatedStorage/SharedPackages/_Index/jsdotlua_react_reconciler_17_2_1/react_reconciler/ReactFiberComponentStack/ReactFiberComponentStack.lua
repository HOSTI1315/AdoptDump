--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberComponentStack (ModuleScript)

require(script.Parent.Parent:WaitForChild("luau-polyfill"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v1 = require(script.Parent:WaitForChild("ReactWorkTags"))
local v_u_2 = v1.HostComponent
local v_u_3 = v1.LazyComponent
local v_u_4 = v1.SuspenseComponent
local v_u_5 = v1.SuspenseListComponent
local v_u_6 = v1.FunctionComponent
local v_u_7 = v1.IndeterminateComponent
local v_u_8 = v1.ForwardRef
local v_u_9 = v1.SimpleMemoComponent
local v_u_10 = v1.ClassComponent
local v11 = require(script.Parent.Parent:WaitForChild("shared")).ReactComponentStackFrame
local v_u_12 = v11.describeBuiltInComponentFrame
local v_u_13 = v11.describeFunctionComponentFrame
local v_u_14 = v11.describeClassComponentFrame
local function v_u_19(p15)
    local v16 = nil
    if _G.__DEV__ then
        local v17 = p15._debugOwner
        if v17 then
            v16 = v17.type
        end
    end
    local v18
    if _G.__DEV__ then
        v18 = p15._debugSource
    else
        v18 = nil
    end
    if p15.tag == v_u_2 then
        return v_u_12(p15.type, v18, v16)
    elseif p15.tag == v_u_3 then
        return v_u_12("Lazy", v18, v16)
    elseif p15.tag == v_u_4 then
        return v_u_12("Suspense", v18, v16)
    elseif p15.tag == v_u_5 then
        return v_u_12("SuspenseList", v18, v16)
    elseif p15.tag == v_u_6 or (p15.tag == v_u_7 or p15.tag == v_u_9) then
        return v_u_13(p15.type, v18, v16)
    elseif p15.tag == v_u_8 then
        return v_u_13(p15.type.render, v18, v16)
    else
        return p15.tag ~= v_u_10 and "" or v_u_14(p15.type, v18, v16)
    end
end
return {
    ["getStackByFiberInDevAndProd"] = function(p_u_20)
        local v23, v24 = pcall(function()
            local v21 = p_u_20
            local v22 = ""
            repeat
                v22 = v22 .. v_u_19(v21)
                v21 = v21.return_
            until v21 == nil
            return v22
        end)
        if v23 then
            return v24
        end
        if typeof(v24) ~= "table" or not (v24.message and v24.stack) then
            return "\nError generating stack: " .. tostring(v24)
        end
        local v25 = v24.message
        local v26 = v24.stack
        return "\nError generating stack: " .. v25 .. "\n" .. tostring(v26)
    end
}