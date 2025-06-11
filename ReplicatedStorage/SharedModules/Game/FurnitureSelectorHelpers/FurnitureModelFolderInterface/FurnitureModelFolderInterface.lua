--// ReplicatedStorage.SharedModules.Game.FurnitureSelectorHelpers.FurnitureModelFolderInterface (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("Class")
local v_u_3 = v_u_1("FurnitureUseDB")
local v_u_4 = v_u_1("Maid")
local v_u_5 = v_u_1("Signal")
local v6 = v2("FurnitureModelFolderInterface")
function v6.get_furniture_models(p7)
    return p7.watched_furniture_models
end
function v6.get_furniture_by_unique(p8, p9)
    return p8.watched_furniture_models[p9]
end
function v6._watch_furniture_model(p10, p11)
    local v12 = p11:GetAttribute("furniture_kind")
    if v12 and not (v_u_3[v12] and v_u_3[v12].placeable) then
        local v13 = p11:GetAttribute("furniture_unique")
        if v13 and not p10.watched_furniture_models[v13] then
            p10.watched_furniture_models[v13] = p11
            p10.furniture_changed:Fire(p11, true)
        end
    else
        return
    end
end
function v6._unwatch_furniture_model(p14, p15)
    local v16 = p15:GetAttribute("furniture_kind")
    if v16 and not (v_u_3[v16] and v_u_3[v16].placeable) then
        local v17 = p15:GetAttribute("furniture_unique")
        if v17 and p14.watched_furniture_models[v17] then
            p14.watched_furniture_models[v17] = nil
            p14.furniture_changed:Fire(p15, false)
        end
    end
end
function v6._unwatch_all_furniture_models(p18)
    p18.watch_maid:DoCleaning()
    for _, v19 in p18.watched_furniture_models do
        p18:_unwatch_furniture_model(v19)
    end
end
function v6._watch_furniture(p_u_20)
    local v_u_21 = workspace.HouseInteriors.furniture
    for _, v22 in v_u_21:GetChildren() do
        if v22:IsA("Folder") then
            local v23 = v22:GetChildren()[1]
            if v23 then
                p_u_20:_watch_furniture_model(v23)
            end
        end
    end
    p_u_20.watch_maid:GiveTask(v_u_21.DescendantAdded:Connect(function(p24)
        if p24.Parent.Parent == v_u_21 then
            p_u_20:_watch_furniture_model(p24)
        end
    end))
    p_u_20.watch_maid:GiveTask(v_u_21.DescendantRemoving:Connect(function(p25)
        if p25.Parent.Parent == v_u_21 then
            p_u_20:_unwatch_furniture_model(p25)
        end
    end))
end
function v6._is_interior_valid(p26, p27)
    if p27 then
        return not p26.valid_interiors and true or p26.valid_interiors[p27.destination_id]
    else
        return false
    end
end
function v6.__init(p_u_28, p29)
    p_u_28.valid_interiors = p29 or nil
    p_u_28.furniture_changed = v_u_5.new()
    p_u_28.watched_furniture_models = {}
    p_u_28.cleanup = v_u_4.new()
    p_u_28.watch_maid = v_u_4.new()
    task.spawn(function()
        local v_u_30 = v_u_1("InteriorsM")
        if p_u_28:_is_interior_valid(v_u_30.get_current_location()) then
            p_u_28:_watch_furniture()
        end
        p_u_28.location_changed_connection = v_u_30.on_location_changed:Connect(function()
            p_u_28:_unwatch_all_furniture_models()
            if p_u_28:_is_interior_valid(v_u_30.get_current_location()) then
                p_u_28:_watch_furniture()
            end
        end)
        p_u_28.cleanup:GiveTask(p_u_28.location_changed_connection)
    end)
end
function v6.destroy(p31)
    p31.cleanup:DoCleaning()
    p31:_unwatch_all_furniture_models()
end
return v6