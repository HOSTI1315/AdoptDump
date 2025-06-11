--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberSuspenseContext.new (ModuleScript)

require(script.Parent:WaitForChild("ReactInternalTypes"))
local v1 = require(script.Parent:WaitForChild("ReactFiberStack.new"))
local v2 = v1.createCursor
local v_u_3 = v1.push
local v_u_4 = v1.pop
local v5 = {
    ["InvisibleParentSuspenseContext"] = 1,
    ["ForceSuspenseFallback"] = 2
}
local v_u_6 = v2(0)
v5.suspenseStackCursor = v_u_6
function v5.hasSuspenseContext(p7, p8)
    return bit32.band(p7, p8) ~= 0
end
function v5.setDefaultShallowSuspenseContext(p9)
    return bit32.band(p9, 1)
end
function v5.setShallowSuspenseContext(p10, p11)
    local v12 = bit32.band(p10, 1)
    return bit32.bor(v12, p11)
end
function v5.addSubtreeSuspenseContext(p13, p14)
    return bit32.bor(p13, p14)
end
function v5.pushSuspenseContext(p15, p16)
    v_u_3(v_u_6, p16, p15)
end
function v5.popSuspenseContext(p17)
    v_u_4(v_u_6, p17)
end
return v5