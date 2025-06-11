--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberHostContext.new (ModuleScript)

require(script.Parent:WaitForChild("ReactInternalTypes"))
local v1 = require(script.Parent:WaitForChild("ReactFiberStack.new"))
local v2 = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
local v_u_3 = v2.getChildHostContext
local v_u_4 = v2.getRootHostContext
local v5 = v1.createCursor
local v_u_6 = v1.push
local v_u_7 = v1.pop
local v_u_8 = {}
local v_u_9 = v5(v_u_8)
local v_u_10 = v5(v_u_8)
local v_u_11 = v5(v_u_8)
function requiredContext(p12)
    return p12
end
function getRootHostContainer()
    return v_u_11.current
end
function pushHostContainer(p13, p14)
    v_u_6(v_u_11, p14, p13)
    v_u_6(v_u_10, p13, p13)
    v_u_6(v_u_9, v_u_8, p13)
    local v15 = v_u_4(p14)
    v_u_7(v_u_9, p13)
    v_u_6(v_u_9, v15, p13)
end
function popHostContainer(p16)
    v_u_7(v_u_9, p16)
    v_u_7(v_u_10, p16)
    v_u_7(v_u_11, p16)
end
function getHostContext()
    return v_u_9.current
end
function pushHostContext(p17)
    local v18 = requiredContext(v_u_11.current)
    local v19 = requiredContext(v_u_9.current)
    local v20 = v_u_3(v19, p17.type, v18)
    if v19 ~= v20 then
        v_u_6(v_u_10, p17, p17)
        v_u_6(v_u_9, v20, p17)
    end
end
function popHostContext(p21)
    if v_u_10.current == p21 then
        v_u_7(v_u_9, p21)
        v_u_7(v_u_10, p21)
    end
end
return {
    ["getHostContext"] = getHostContext,
    ["getRootHostContainer"] = getRootHostContainer,
    ["popHostContainer"] = popHostContainer,
    ["popHostContext"] = popHostContext,
    ["pushHostContainer"] = pushHostContainer,
    ["pushHostContext"] = pushHostContext
}