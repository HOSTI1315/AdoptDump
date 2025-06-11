--// ReplicatedStorage.SharedModules.Maid (ModuleScript)

local v_u_2 = {
    ["new"] = function()
        local v1 = v_u_2
        return setmetatable({
            ["Tasks"] = {}
        }, v1)
    end
}
local function v_u_4(p3)
    if typeof(p3) == "thread" then
        task.cancel(p3)
        return
    elseif type(p3) == "function" then
        p3()
        return
    elseif typeof(p3) == "RBXScriptConnection" then
        p3:Disconnect()
        return
    elseif p3.Destroy then
        p3:Destroy()
        return
    elseif p3.disconnect then
        p3:disconnect()
        return
    elseif p3.destroy then
        p3:destroy()
    elseif p3.cancel then
        p3:cancel()
    end
end
function v_u_2.__index(p5, p6)
    if v_u_2[p6] then
        return v_u_2[p6]
    else
        return p5.Tasks[p6]
    end
end
function v_u_2.__newindex(p7, p8, p9)
    if v_u_2[p8] ~= nil then
        error(("\'%s\' is reserved"):format((tostring(p8))), 2)
    end
    local v10 = p7.Tasks
    local v11 = v10[p8]
    v10[p8] = p9
    if v11 then
        v_u_4(v11)
    end
end
function v_u_2.GiveTask(p12, p13)
    local v14 = #p12.Tasks + 1
    p12[v14] = p13
    return v14
end
function v_u_2.DoCleaning(p15)
    local v16 = p15.Tasks
    for v17, v18 in pairs(v16) do
        if typeof(v18) == "RBXScriptConnection" then
            v16[v17] = nil
            v18:Disconnect()
        end
    end
    local v19, v20 = next(v16)
    while v20 ~= nil do
        v16[v19] = nil
        v_u_4(v20)
        v19, v20 = next(v16)
    end
end
v_u_2.Destroy = v_u_2.DoCleaning
return v_u_2