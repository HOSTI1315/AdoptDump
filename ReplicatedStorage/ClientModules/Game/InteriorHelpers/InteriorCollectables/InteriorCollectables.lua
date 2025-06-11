--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.InteriorCollectables (ModuleScript)

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v3 = require(v2.Fsys).load
local v_u_4 = v3("Maid")
local v_u_5 = v3("package:Sift")
local v6 = v3("Class")("InteriorCollectables")
local v_u_7 = Instance.new("Folder")
v_u_7.Name = "Collectables"
v_u_7.Parent = workspace
function v6.get_selected_ids(p8)
    if not p8.get_random_seed_callback then
        return p8.collectable_spawn_to_id_map
    end
    local v9 = p8.get_random_seed_callback()
    local v10 = p8.get_spawn_limit_callback()
    if p8.random_seed ~= v9 or p8.spawn_limit ~= v10 then
        p8.random_seed = v9
        p8.spawn_limit = v10
        p8.selected_spawn_locations = {}
        local v11 = v_u_5.Array.copy(p8.sorted_spawn_locations)
        local v12 = 1
        local v13 = 0
        while v12 < #v11 do
            local v14 = v11[v12]
            local v15 = v14:FindFirstChild("ForcedSpawn")
            if v15 and v15.Value == true then
                local v16 = p8.selected_spawn_locations
                table.insert(v16, v14)
                table.remove(v11, v12)
                v13 = v13 + 1
                if v13 == p8.spawn_limit then
                    break
                end
            else
                v12 = v12 + 1
            end
        end
        if v13 < p8.spawn_limit then
            local v17 = Random.new(v9)
            for v18 = #v11, 1, -1 do
                local v19 = v17:NextInteger(1, v18)
                local v20 = v11[v19]
                local v21 = v11[v18]
                v11[v18] = v20
                v11[v19] = v21
            end
            for v22 = 1, v10 - v13 do
                local v23 = p8.selected_spawn_locations
                local v24 = v11[v22]
                table.insert(v23, v24)
            end
        end
        p8.selected_spawn_locations = v_u_5.Set.fromArray(p8.selected_spawn_locations)
    end
    return p8.selected_spawn_locations
end
function v6.get_collectable_model(p25, p26)
    return p25.collectable_id_to_model[p26]
end
function v6.refresh_collectables(p_u_27)
    for v28, v_u_29 in p_u_27.collectable_spawn_to_id_map do
        local v30 = p_u_27:get_selected_ids()
        if v30[v28] and p_u_27.should_create_callback(v_u_29) then
            local v31 = p_u_27.collectable_model
            local v32
            if typeof(v31) == "function" then
                v32 = p_u_27.collectable_model(v28, v30)
            else
                v32 = p_u_27.collectable_model
            end
            if p_u_27.collectable_id_to_model_template[v_u_29] ~= v32 then
                p_u_27.maid[v_u_29] = nil
            end
            if not p_u_27.collectable_id_to_model[v_u_29] then
                p_u_27.collectable_id_to_model_template[v_u_29] = v32
                local v_u_33 = v32:Clone()
                v_u_33.Name = v28.Name
                v_u_33:PivotTo(v28:GetPivot())
                v_u_33.Parent = v_u_7
                p_u_27.collectable_id_to_model[v_u_29] = v_u_33
                local v_u_34
                if p_u_27.on_create_callback then
                    v_u_34 = v_u_4.new()
                    p_u_27.on_create_callback(v_u_34, v_u_29, v_u_33, v28)
                else
                    v_u_34 = nil
                end
                local v_u_35 = false
                local v_u_37 = v_u_33.PrimaryPart.Touched:Connect(function(p36)
                    if v_u_35 then
                        return
                    elseif v_u_1:GetPlayerFromCharacter(p36.Parent) == v_u_1.LocalPlayer then
                        v_u_35 = true
                        p_u_27.on_collect_callback(v_u_29)
                        p_u_27.maid[v_u_29] = nil
                    end
                end)
                p_u_27.maid[v_u_29] = function()
                    p_u_27.collectable_id_to_model[v_u_29] = nil
                    p_u_27.collectable_id_to_model_template[v_u_29] = nil
                    v_u_33:Destroy()
                    v_u_37:Disconnect()
                    if v_u_34 then
                        v_u_34:Destroy()
                    end
                end
            end
        else
            p_u_27.maid[v_u_29] = nil
        end
    end
end
function v6.__init(p_u_38, p39)
    p_u_38.maid = v_u_4.new()
    p_u_38.collectable_spawn_to_id_map = v_u_5.Dictionary.map(p39.spawn_locations, function(p40)
        p40.Transparency = 1
        return p40.Name, p40
    end)
    p_u_38.collectable_id_to_model = {}
    p_u_38.collectable_id_to_model_template = {}
    p_u_38.collectable_model = p39.collectable_model
    p_u_38.on_create_callback = p39.on_create
    p_u_38.on_collect_callback = p39.on_collect
    p_u_38.should_create_callback = p39.should_create
    if p39.spawn_limit_options then
        p_u_38.sorted_spawn_locations = v_u_5.Array.sort(p39.spawn_locations, function(p41, p42)
            return p41.Name < p42.Name
        end)
        p_u_38.get_spawn_limit_callback = p39.spawn_limit_options.get_spawn_limit
        p_u_38.get_random_seed_callback = p39.spawn_limit_options.get_random_seed
    end
    if v_u_5.Dictionary.count(p_u_38.collectable_spawn_to_id_map) ~= #p39.spawn_locations then
        warn("[InteriorCollectables]: Duplicate collectable ids exist")
    end
    if p39.refresh_collectables_signal then
        p_u_38.maid:GiveTask(p39.refresh_collectables_signal:Connect(function()
            p_u_38:refresh_collectables()
        end))
    end
    p_u_38:refresh_collectables()
end
function v6.destroy(p43)
    p43.maid:Destroy()
end
return v6