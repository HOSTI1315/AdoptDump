--// ReplicatedStorage.SharedPackages._Index.howmanysmall_janitor@1.15.7.janitor (ModuleScript)

local v_u_1
if script.Parent:FindFirstChild("Promise") then
    v_u_1 = require(script.Parent.Promise)
else
    v_u_1 = nil
end
local v_u_2 = setmetatable({}, {
    ["__tostring"] = function()
        return "IndicesReference"
    end
})
local v_u_3 = setmetatable({}, {
    ["__tostring"] = function()
        return "LinkToInstanceIndex"
    end
})
local v_u_4 = {
    ["ClassName"] = "Janitor",
    ["CurrentlyCleaning"] = true,
    ["SuppressInstanceReDestroy"] = false,
    [v_u_2] = nil
}
v_u_4.__index = v_u_4
local v_u_5 = {
    ["function"] = true,
    ["thread"] = true,
    ["RBXScriptConnection"] = "Disconnect"
}
function v_u_4.new()
    local v6 = {
        ["CurrentlyCleaning"] = false,
        [v_u_2] = nil
    }
    local v7 = v_u_4
    return setmetatable(v6, v7)
end
function v_u_4.Is(p8)
    local v9
    if type(p8) == "table" then
        v9 = getmetatable(p8) == v_u_4
    else
        v9 = false
    end
    return v9
end
v_u_4.instanceof = v_u_4.Is
function v_u_4.Add(p10, p11, p12, p13)
    if p13 then
        p10:Remove(p13)
        local v14 = p10[v_u_2]
        if not v14 then
            v14 = {}
            p10[v_u_2] = v14
        end
        v14[p13] = p11
    end
    local v15 = typeof(p11)
    local v16 = p12 or (v_u_5[v15] or "Destroy")
    if v15 == "function" or v15 == "thread" then
        if v16 ~= true then
            warn(string.format("Object is a %* and as such expected `true?` for the method name and instead got %*. Traceback: %*", v15, tostring(v16), debug.traceback(nil, 2)))
        end
    elseif not p11[v16] then
        warn(string.format("Object %* doesn\'t have method %*, are you sure you want to add it? Traceback: %*", tostring(p11), tostring(v16), debug.traceback(nil, 2)))
    end
    p10[p11] = v16
    return p11
end
function v_u_4.AddPromise(p17, p_u_18)
    if not v_u_1 then
        return p_u_18
    end
    if not v_u_1.is(p_u_18) then
        error(string.format("Invalid argument #1 to \'Janitor:AddPromise\' (Promise expected, got %* (%*)) Traceback: %*", typeof(p_u_18), tostring(p_u_18), debug.traceback(nil, 2)))
    end
    if p_u_18:getStatus() ~= v_u_1.Status.Started then
        return p_u_18
    end
    local v19 = newproxy(false)
    local v22 = p17:Add(v_u_1.new(function(p20, _, p21)
        if not p21(function()
            p_u_18:cancel()
        end) then
            p20(p_u_18)
        end
    end), "cancel", v19)
    v22:finallyCall(p17.Remove, p17, v19)
    return v22
end
function v_u_4.Remove(p23, p24)
    local v25 = p23[v_u_2]
    local v_u_26 = v25 and v25[p24]
    if v_u_26 then
        local v27 = p23[v_u_26]
        if v27 then
            if v27 == true then
                if type(v_u_26) == "function" then
                    v_u_26()
                else
                    local v28
                    if coroutine.running() == v_u_26 then
                        v28 = nil
                    else
                        v28 = pcall(function()
                            task.cancel(v_u_26)
                        end)
                    end
                    if not v28 then
                        task.defer(function()
                            if v_u_26 then
                                task.cancel(v_u_26)
                            end
                        end)
                    end
                end
            else
                local v29 = v_u_26[v27]
                if v29 then
                    if p23.SuppressInstanceReDestroy and (v27 == "Destroy" and typeof(v_u_26) == "Instance") then
                        pcall(v29, v_u_26)
                    else
                        v29(v_u_26)
                    end
                end
            end
            p23[v_u_26] = nil
        end
        v25[p24] = nil
    end
    return p23
end
function v_u_4.RemoveNoClean(p30, p31)
    local v32 = p30[v_u_2]
    if v32 then
        local v33 = v32[p31]
        if v33 then
            p30[v33] = nil
        end
        v32[p31] = nil
    end
    return p30
end
function v_u_4.RemoveList(p34, ...)
    if p34[v_u_2] then
        local v35 = select("#", ...)
        if v35 == 1 then
            return p34:Remove(...)
        end
        for v36 = 1, v35 do
            p34:Remove(select(v36, ...))
        end
    end
    return p34
end
function v_u_4.RemoveListNoClean(p37, ...)
    local v38 = p37[v_u_2]
    if v38 then
        local v39 = select("#", ...)
        if v39 == 1 then
            return p37:RemoveNoClean(...)
        end
        for v40 = 1, v39 do
            local v41 = select(v40, ...)
            local v42 = v38[v41]
            if v42 then
                p37[v42] = nil
            end
            v38[v41] = nil
        end
    end
    return p37
end
function v_u_4.Get(p43, p44)
    local v45 = p43[v_u_2]
    if v45 then
        return v45[p44]
    else
        return nil
    end
end
function v_u_4.GetAll(p46)
    local v47 = p46[v_u_2]
    return not v47 and {} or table.freeze(table.clone(v47))
end
function v_u_4.Cleanup(p_u_48)
    if not p_u_48.CurrentlyCleaning then
        p_u_48.CurrentlyCleaning = nil
        local function v51()
            for v49, v50 in next, p_u_48 do
                if v49 ~= v_u_2 and v49 ~= "SuppressInstanceReDestroy" then
                    return v49, v50
                end
            end
        end
        local v_u_52, v53 = v51()
        while v_u_52 and v53 do
            if v53 == true then
                if type(v_u_52) == "function" then
                    v_u_52()
                else
                    local v54
                    if coroutine.running() == v_u_52 then
                        v54 = nil
                    else
                        v54 = pcall(function()
                            task.cancel(v_u_52)
                        end)
                    end
                    if not v54 then
                        task.defer(function()
                            if v_u_52 then
                                task.cancel(v_u_52)
                            end
                        end)
                    end
                end
            else
                local v55 = v_u_52[v53]
                if v55 then
                    if p_u_48.SuppressInstanceReDestroy and (v53 == "Destroy" and typeof(v_u_52) == "Instance") then
                        pcall(v55, v_u_52)
                    else
                        v55(v_u_52)
                    end
                end
            end
            p_u_48[v_u_52] = nil
            v_u_52, v53 = v51()
        end
        local v56 = p_u_48[v_u_2]
        if v56 then
            table.clear(v56)
            p_u_48[v_u_2] = {}
        end
        p_u_48.CurrentlyCleaning = false
    end
end
function v_u_4.Destroy(p57)
    p57:Cleanup()
    table.clear(p57)
    setmetatable(p57, nil)
end
v_u_4.__call = v_u_4.Cleanup
function v_u_4.LinkToInstance(p_u_58, p59, p60)
    local v61
    if p60 then
        v61 = newproxy(false)
    else
        v61 = v_u_3
    end
    return p_u_58:Add(p59.Destroying:Connect(function()
        p_u_58:Cleanup()
    end), "Disconnect", v61)
end
v_u_4.LegacyLinkToInstance = v_u_4.LinkToInstance
function v_u_4.LinkToInstances(p62, ...)
    local v63 = v_u_4.new()
    for v64 = 1, select("#", ...) do
        local v65 = select(v64, ...)
        if typeof(v65) == "Instance" then
            v63:Add(p62:LinkToInstance(v65, true), "Disconnect")
        end
    end
    return v63
end
function v_u_4.__tostring(_)
    return "Janitor"
end
table.freeze(v_u_4)
return v_u_4