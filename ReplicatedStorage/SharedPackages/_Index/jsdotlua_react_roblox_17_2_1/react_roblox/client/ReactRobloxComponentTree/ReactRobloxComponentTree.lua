--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.ReactRobloxComponentTree (ModuleScript)

require(script.Parent:WaitForChild("ReactRobloxHostTypes.roblox"))
require(script.Parent.Parent.Parent:WaitForChild("react-reconciler"))
local v1 = require(script.Parent.Parent.Parent:WaitForChild("shared"))
local v_u_2 = nil
local v_u_3 = nil
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = nil
local v_u_7 = nil
local v_u_8 = v1.invariant
local v9 = {}
local v_u_10 = {}
local v_u_11 = {}
local v_u_12 = {}
local v13 = math.random
local v14 = tostring(v13())
local v15 = string.sub(v14, 3)
local v_u_16 = "__reactFiber$" .. v15
local v_u_17 = "__reactContainer$" .. v15
function v9.precacheFiberNode(p18, p19)
    v_u_11[p19] = p18
end
function v9.uncacheFiberNode(p20)
    v_u_11[p20] = nil
    v_u_12[p20] = nil
end
function v9.markContainerAsRoot(p21, p22)
    v_u_10[p22] = p21
end
function v9.unmarkContainerAsRoot(p23)
    v_u_10[p23] = nil
end
function v9.isContainerMarkedAsRoot(p24)
    return v_u_10[p24] and true or false
end
function v9.getClosestInstanceFromNode(p25)
    local v26 = v_u_11[p25]
    if v26 then
        return v26
    end
    local v27 = p25.Parent
    while v27 do
        local v28 = v_u_11[v27]
        if v28 then
            local v29 = v28.alternate
            if v28.child ~= nil or v29 ~= nil and v29.child ~= nil then
                if v_u_7 == nil then
                    v_u_7 = require(script.Parent.ReactRobloxHostConfig).getParentSuspenseInstance
                end
                local v30 = v_u_7(p25)
                while v30 ~= nil do
                    local v31 = v_u_11[v30]
                    if v31 then
                        return v31
                    end
                    v30 = v_u_7(v30)
                end
            end
            return v28
        end
        local v32 = v27.Parent
        p25 = v27
        v27 = v32
    end
    return nil
end
function v9.getInstanceFromNode(p33)
    if v_u_2 == nil then
        v_u_2 = require(script.Parent.Parent:WaitForChild("ReactReconciler.roblox")).ReactWorkTags
        v_u_3 = v_u_2.HostComponent
        v_u_4 = v_u_2.HostComponent
        v_u_5 = v_u_2.HostComponent
        v_u_6 = v_u_2.HostComponent
    end
    local v34 = p33[v_u_16] or p33[v_u_17]
    if v34 then
        if v34.tag == v_u_3 or (v34.tag == v_u_4 or (v34.tag == v_u_6 or v34.tag == v_u_5)) then
            return v34
        else
            return nil
        end
    else
        return nil
    end
end
function v9.getNodeFromInstance(p35)
    if p35.tag == v_u_3 or p35.tag == v_u_4 then
        return p35.stateNode
    end
    v_u_8(false, "getNodeFromInstance: Invalid argument.")
    error("getNodeFromInstance: Invalid argument.")
end
function v9.getFiberCurrentPropsFromNode(p36)
    return v_u_12[p36]
end
function v9.updateFiberProps(p37, p38)
    v_u_12[p37] = p38
end
return v9