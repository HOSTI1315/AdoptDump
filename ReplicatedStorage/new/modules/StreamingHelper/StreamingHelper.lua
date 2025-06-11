--// ReplicatedStorage.new.modules.StreamingHelper (ModuleScript)

local v_u_1 = require(script.Parent.LegacyLoad)
local v_u_2 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v_u_3 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_4 = game:GetService("CollectionService")
local v_u_5 = game:GetService("HttpService")
local v_u_6 = game:GetService("RunService")
local v_u_7 = {}
local v_u_8 = {}
function v_u_7.is_streaming_id(p9)
    local v10
    if typeof(p9) == "string" then
        v10 = p9:find("^StreamingId_") ~= nil
    else
        v10 = false
    end
    return v10
end
function v_u_7.assign_new_streaming_id(p11)
    local v12 = v_u_6:IsServer()
    assert(v12, "server only")
    if p11 == nil then
        return nil
    end
    if p11:GetAttribute("StreamingId") ~= nil then
        v_u_7.remove_streaming_id(p11)
    end
    local v13 = v_u_5:GenerateGUID(false):lower():gsub("%W", "")
    local v14 = ("StreamingId_%*_%*"):format(p11.Name:sub(1, 40), v13)
    p11:SetAttribute("StreamingId", v14)
    p11:AddTag(v14)
    p11:AddTag("HasStreamingId")
    return v14
end
function v_u_7.assign_or_get_streaming_id(p15)
    local v16 = v_u_6:IsServer()
    assert(v16, "server only")
    if p15 == nil then
        return nil
    elseif p15:GetAttribute("StreamingId") == nil then
        return v_u_7.assign_new_streaming_id(p15)
    else
        return p15:GetAttribute("StreamingId")
    end
end
v_u_7.as_id = v_u_7.assign_or_get_streaming_id
function v_u_7.assign_or_get_streaming_ids_for_table(p17)
    local v18 = v_u_6:IsServer()
    assert(v18, "server only")
    local v19 = table.create(#p17)
    for v20, v21 in p17 do
        v19[v20] = v_u_7.assign_or_get_streaming_id(v21)
    end
    return v19
end
v_u_7.as_id_table = v_u_7.assign_or_get_streaming_ids_for_table
function v_u_7.get_streaming_id(p22)
    return p22:GetAttribute("StreamingId")
end
function v_u_7.remove_streaming_id(p23)
    local v24 = p23:GetAttribute("StreamingId")
    if v24 ~= nil then
        p23:RemoveTag("HasStreamingId")
        p23:RemoveTag(v24)
        p23:SetAttribute("StreamingId", nil)
        if v_u_6:IsServer() and p23:IsDescendantOf(game) then
            v_u_1("ServerRouter").get("StreamingAPI/StreamingIdRemoved"):FireAllClients(v24)
        end
    end
end
function v_u_7.get_instance_by_id(p25)
    if p25 == nil then
        return nil
    elseif typeof(p25) == "Instance" then
        return p25
    else
        return v_u_4:GetTagged(p25)[1]
    end
end
v_u_7.get = v_u_7.get_instance_by_id
function v_u_7.promise_await_instance_by_id(p_u_26)
    local v27 = v_u_6:IsClient()
    assert(v27, "client only")
    local v_u_28 = debug.traceback(nil, 2)
    if p_u_26 == nil then
        return v_u_2.reject("id is nil")
    end
    if typeof(p_u_26) == "Instance" then
        return v_u_2.resolve(p_u_26)
    end
    local v_u_29 = nil
    local v_u_35 = v_u_2.new(function(p30, p31, p32)
        v_u_29 = p31
        local v_u_33 = nil
        local v_u_34 = task.delay(10, function()
            if not v_u_33 then
                warn(("[StreamingHelper] We\'ve been waiting for %* for 10 seconds."):format(p_u_26) .. " This may be an infinite wait if the item never appears.\n" .. v_u_28)
            end
        end)
        p32(function()
            if coroutine.status(v_u_34) == "suspended" then
                task.cancel(v_u_34)
            end
        end)
        v_u_33 = v_u_7.get_instance_by_id(p_u_26) or v_u_4:GetInstanceAddedSignal(p_u_26):Wait()
        task.cancel(v_u_34)
        p30(v_u_33)
    end)
    v_u_8[p_u_26] = v_u_8[p_u_26] or {}
    v_u_8[p_u_26][v_u_35] = v_u_29
    return v_u_35:finally(function()
        v_u_8[p_u_26][v_u_35] = nil
        if next(v_u_8[p_u_26]) == nil then
            v_u_8[p_u_26] = nil
        end
    end):andThenReturn(v_u_35)
end
function v_u_7.await_instance_by_id(p36, p37)
    local v38 = v_u_6:IsClient()
    assert(v38, "client only")
    local v39 = v_u_7.promise_await_instance_by_id(p36)
    if p37 then
        v39 = v39:timeout(p37)
    end
    return v39:catch(function(_)
        return nil
    end):expect()
end
v_u_7.await = v_u_7.await_instance_by_id
function v_u_7.await_table_instances_by_id_shallow(p40, p41)
    local v42 = v_u_6:IsClient()
    assert(v42, "client only")
    local v_u_43 = table.create(#p41)
    local v44 = {}
    for v_u_45, v46 in p41 do
        local v47 = v_u_7.promise_await_instance_by_id(v46):timeout(p40):catch(function()
            return nil
        end)
        table.insert(v44, v47:andThen(function(p48)
            v_u_43[v_u_45] = p48
        end))
    end
    v_u_2.all(v44):expect()
    return v_u_43, #p41
end
v_u_7.await_table_shallow = v_u_7.await_table_instances_by_id_shallow
function v_u_7.await_many_instances_by_id(p49, ...)
    local v50 = v_u_6:IsClient()
    assert(v50, "client only")
    local v51 = v_u_7.await_table_instances_by_id_shallow(p49, { ... })
    local v52 = select
    return unpack(v51, 1, v52("#", ...))
end
v_u_7.await_many = v_u_7.await_many_instances_by_id
function v_u_7.set_model_streaming_mode_recursive(p53, p54)
    local v55 = p53:GetDescendants()
    table.insert(v55, p53)
    for _, v56 in v55 do
        if v56:IsA("Model") then
            v56.ModelStreamingMode = p54
        end
    end
end
function v_u_7.attach_descendant_count(p_u_57)
    local v58 = v_u_6:IsServer()
    assert(v58, "server only")
    if not p_u_57:GetAttribute("DescendantCount") then
        local v_u_59 = #p_u_57:GetDescendants()
        p_u_57:SetAttribute("DescendantCount", v_u_59)
        local v_u_60 = p_u_57.DescendantAdded:Connect(function()
            v_u_59 = v_u_59 + 1
            p_u_57:SetAttribute("DescendantCount", v_u_59)
        end)
        local v_u_61 = p_u_57.DescendantRemoving:Connect(function()
            v_u_59 = v_u_59 - 1
            p_u_57:SetAttribute("DescendantCount", v_u_59)
        end)
        local v_u_62 = nil
        v_u_62 = p_u_57:GetAttributeChangedSignal("DescendantCountCancel"):Connect(function()
            if p_u_57:GetAttribute("DescendantCountCancel") then
                v_u_60:Disconnect()
                v_u_61:Disconnect()
                v_u_62:Disconnect()
                p_u_57:SetAttribute("DescendantCountCancel", nil)
                p_u_57:SetAttribute("DescendantCount", nil)
            end
        end)
    end
    return function()
        v_u_7.cancel_descendant_count(p_u_57)
    end
end
function v_u_7.cancel_descendant_count(p63)
    local v64 = v_u_6:IsServer()
    assert(v64, "server only")
    if p63:GetAttribute("DescendantCount") then
        p63:SetAttribute("DescendantCountCancel", true)
    end
end
function v_u_7.does_descendant_count_match(p65)
    local v66 = p65:GetAttribute("DescendantCount")
    return (v66 == nil or typeof(v66) ~= "number") and true or v66 <= #p65:GetDescendants()
end
function v_u_7.nil_on_missing_descenants(p67)
    if p67 == nil then
        return nil
    elseif v_u_7.does_descendant_count_match(p67) then
        return p67
    else
        return nil
    end
end
function v_u_7.await_matching_descendant_count(p_u_68)
    local v69 = v_u_6:IsClient()
    assert(v69, "client only")
    if not p_u_68:IsDescendantOf(game) then
        error("Instance destroyed")
    end
    local v_u_70 = Instance.new("BindableEvent")
    local v_u_71 = #p_u_68:GetDescendants()
    local v72 = p_u_68.DescendantAdded:Connect(function()
        v_u_71 = v_u_71 + 1
        v_u_70:Fire()
    end)
    local v73 = p_u_68.DescendantRemoving:Connect(function()
        v_u_71 = v_u_71 - 1
        v_u_70:Fire()
    end)
    local v74 = p_u_68:GetAttributeChangedSignal("DescendantCount"):Connect(function()
        v_u_70:Fire()
    end)
    local v75 = p_u_68.AncestryChanged:Connect(function()
        v_u_70:Fire()
    end)
    local v76 = task.delay(10, function()
        warn(("[StreamingHelper] We\'ve been waiting for %* to have all descendants for 10 seconds. This may be an infinite wait."):format((p_u_68:GetFullName())) .. ("%*/%* descendants found."):format(v_u_71, (p_u_68:GetAttribute("DescendantCount"))))
    end)
    local v77 = v_u_71
    while true do
        if not p_u_68:IsDescendantOf(game) then
            task.cancel(v76)
            v72:Disconnect()
            v73:Disconnect()
            v74:Disconnect()
            v75:Disconnect()
            v_u_70:Destroy()
            error((("Instance %* removed from the DataModel while waiting for all descendants"):format(p_u_68)))
        end
        local v78 = p_u_68:GetAttribute("DescendantCount")
        if v78 and v78 <= v77 then
            task.cancel(v76)
            v72:Disconnect()
            v73:Disconnect()
            v74:Disconnect()
            v75:Disconnect()
            v_u_70:Destroy()
            return nil
        end
        v_u_70.Event:Wait()
    end
end
function v_u_7.as_id_recursive_mut(p79)
    local v80 = v_u_6:IsServer()
    assert(v80, "server only")
    if typeof(p79) == "Instance" then
        return v_u_7.as_id(p79)
    end
    if typeof(p79) ~= "table" then
        return p79
    end
    for v81, v82 in p79 do
        if typeof(v81) == "Instance" then
            error("Instance keys not supported")
        end
        p79[v81] = v_u_7.as_id_recursive_mut(v82)
    end
    return p79
end
function v_u_7.as_id_recursive_clone(p83)
    if typeof(p83) == "table" then
        return v_u_7.as_id_recursive_mut(v_u_3.Dictionary.copyDeep(p83))
    else
        return v_u_7.as_id_recursive_mut(p83)
    end
end
function v_u_7.await_recursive_mut(p84, p_u_85)
    local v86 = v_u_6:IsClient()
    assert(v86, "client only")
    if typeof(p84) == "table" then
        local v87 = { p84 }
        local v88 = {}
        while v87[1] do
            local v_u_89 = table.remove(v87)
            local v90 = v_u_89 ~= nil
            assert(v90, "analysis hint")
            for v_u_91, v_u_92 in v_u_89 do
                if typeof(v_u_92) == "string" and v_u_92:find("^StreamingId_") then
                    local v93 = v_u_2.try
                    local function v94()
                        v_u_89[v_u_91] = v_u_7.await(v_u_92, p_u_85)
                    end
                    table.insert(v88, v93(v94))
                elseif typeof(v_u_92) == "table" then
                    table.insert(v87, v_u_92)
                end
            end
        end
        v_u_2.all(v88):expect()
        return p84
    else
        if typeof(p84) ~= "string" or not p84:find("^StreamingId_") then
            return p84
        end
        warn("AWAIT RECURSIVE MUT:", p84)
        local v95 = v_u_7.await(p84, p_u_85)
        warn("AWAIT RECURSIVE MUT:", p84, "=>", v95)
        return v95
    end
end
function v_u_7.check_for_bad_instances(p96, p97)
    local v98 = p97 or { "<root>" }
    assert(v98, "analysis hint")
    if typeof(p96) == "Instance" then
        if p96:IsA("BasePart") or (p96:IsA("Model") or p96:FindFirstAncestorOfClass("Model")) then
            return {
                ["path"] = v98,
                ["instance"] = p96
            }
        end
    elseif typeof(p96) == "table" then
        for v99, v100 in p96 do
            local v101 = tostring(v99)
            table.insert(v98, v101)
            local v102 = v_u_7.check_for_bad_instances(v100, v98)
            if v102 then
                return v102
            end
            table.remove(v98)
        end
    end
    return nil
end
function v_u_7.keep_on_fallen_parts(p103)
    if p103:IsA("Model") then
        if not p103:FindFirstChild("KeepOnFallenParts") then
            local v104 = Instance.new("Model")
            v104.Name = "KeepOnFallenParts"
            v104.Parent = p103
        end
    else
        return
    end
end
if v_u_6:IsServer() then
    local v_u_105 = v_u_1("ServerRouter")
    v_u_4:GetInstanceRemovedSignal("HasStreamingId"):Connect(function(p106)
        if not p106:IsDescendantOf(game) then
            v_u_105.get("StreamingAPI/StreamingIdRemoved"):FireAllClients(p106:GetAttribute("StreamingId"))
        end
    end)
else
    v_u_1("RouterClient").get("StreamingAPI/StreamingIdRemoved").OnClientEvent:Connect(function(p107)
        if v_u_8[p107] ~= nil then
            for _, v108 in v_u_8[p107] do
                v108((("StreamingId %* removed while waiting for it"):format(p107)))
            end
        end
    end)
end
function v_u_7.on_item_streamed(p109, p_u_110, p111)
    local v_u_112 = 0
    local v116 = v_u_4:GetInstanceAddedSignal(p109):Connect(function(p113)
        local v114 = os.clock()
        task.wait()
        if p113:IsDescendantOf(game) then
            if p113:GetAttribute("DescendantCount") then
                local v115, _ = pcall(v_u_7.await_matching_descendant_count, p113)
                if not v115 or v114 < v_u_112 then
                    return
                end
            end
            if p113:IsDescendantOf(game) then
                v_u_112 = v114
                p_u_110(p113)
            end
        else
            return
        end
    end)
    local v117 = v_u_4:GetInstanceRemovedSignal(p109):Connect(function(_)
        v_u_112 = os.clock()
        p_u_110(nil)
    end)
    if p111 then
        table.insert(p111, v116)
        table.insert(p111, v117)
    end
    return v116, v117
end
return v_u_7