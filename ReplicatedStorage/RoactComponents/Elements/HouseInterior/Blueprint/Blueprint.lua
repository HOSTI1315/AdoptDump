--// ReplicatedStorage.RoactComponents.Elements.HouseInterior.Blueprint (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Roact")
local v_u_3 = v1("DownloadClient")
local v4 = v1("CriticalSection")
local v_u_5 = v1("HouseDB")
v1("ClientData")
local v_u_6 = v1("HouseRenderHelper")
local v_u_7 = v1("TerrainHelper")
local v_u_8 = v1("TexturesDB")
local v_u_9 = v1("ClientStore")
local v_u_10 = v1("package:Sift")
local v11 = {}
local v_u_12 = v_u_2.createElement
v11.Blueprint = v_u_2.Component:extend("Blueprint")
function v11.Blueprint.delete_blueprint(p13)
    if p13.interior then
        p13.interior:Destroy()
        p13.interior = nil
        if p13.revert_water then
            p13.revert_water()
            p13.revert_water = nil
        end
    end
end
function v11.Blueprint.add_textures(p14)
    local v15 = p14.interior
    local v16 = p14.props.texture_preview
    local v17 = v_u_6.get_textures_by_name(v15, "Floors")
    local v18 = v_u_6.get_textures_by_name(v15, "Walls")
    local v19 = p14.props.textures or {}
    if v16 then
        local v20 = v19[v16.room_id]
        if v20 then
            v20 = v20[v16.texture_type]
        end
        if v20 and v20 == v16.texture_id then
            v_u_9.store:dispatch({
                ["type"] = "set_texture_preview",
                ["value"] = "NONE"
            })
        end
        v19 = v_u_10.Dictionary.copyDeep(v19)
        v19[v16.room_id] = v19[v16.room_id] or {}
        v19[v16.room_id][v16.texture_type] = v16.texture_id
    end
    for v21, v22 in pairs(v19) do
        local v23 = v22.walls
        local v24 = v22.floors
        local v25 = v_u_8.walls[v23]
        local v26 = v_u_8.floors[v24]
        v_u_6.change_textures(v17[v21] or {}, v26)
        v_u_6.change_textures(v18[v21] or {}, v25)
    end
end
function v11.Blueprint.format_interior(p27)
    local v28 = p27.interior
    local v29 = p27.props.player
    local v30 = p27.props.building_type
    local v31 = p27.props.active_addons
    local v32 = v_u_5[v30]
    local v33 = p27.props.house_pos
    v28.PrimaryPart = v28.SpecialParts.FurnitureOrigin
    v28:SetPrimaryPartCFrame(CFrame.new(v33 or Vector3.new()))
    local v34, v35 = v32.get_exterior()
    local v36 = { "MainDoor" }
    if not v35 then
        if v32.additional_doors then
            v36 = v_u_10.List.concat(v36, v32.additional_doors)
        end
        if v32.addons then
            local v37 = {}
            for _, v38 in v28.Doors:GetChildren() do
                if v32.addons[v38.Name] and v31[v38.Name] then
                    local v39 = v38.Name
                    table.insert(v37, v39)
                end
            end
            v36 = v_u_10.List.concat(v36, v37)
        end
    end
    for _, v40 in pairs(v36) do
        local v41 = v34.Doors:FindFirstChild(v40).WorkingParts.Configuration:FindFirstChild("destination_door_id")
        local v42
        if v41 and v41.Value ~= "" then
            v42 = v28:WaitForChild("Doors"):WaitForChild(v41.Value)
        else
            v42 = v28:WaitForChild("Doors"):WaitForChild(v40)
        end
        local v43 = v42:WaitForChild("WorkingParts"):WaitForChild("Configuration")
        local v44 = v43:FindFirstChild("destination_door_id") or Instance.new("StringValue")
        v44.Name = "destination_door_id"
        v44.Value = v40
        v44.Parent = v43
        local v45 = v43:FindFirstChild("destination_id") or Instance.new("StringValue")
        v45.Name = "destination_id"
        v45.Value = "exit_housing"
        v45.Parent = v43
        local v46 = v43:FindFirstChild("house_owner") or Instance.new("StringValue")
        v46.Value = v29 and (v29.Name or "") or ""
        v46.Name = "house_owner"
        v46.Parent = v43
        local v47 = v43:FindFirstChild("NoAutoOpen") or Instance.new("BoolValue")
        v47.Name = "NoAutoOpen"
        v47.Parent = v43
        if v32.allow_touch_door_leaving then
            v47:Destroy()
        end
    end
end
local v_u_48 = v4.new()
function v11.Blueprint.update_blueprint(p_u_49, p_u_50, _)
    local v_u_51 = p_u_49.props.building_type
    local v_u_52 = v_u_5[v_u_51]
    task.spawn(function()
        v_u_48:wait()
        if v_u_51 == nil then
            p_u_49:delete_blueprint()
            return v_u_48:signal()
        end
        local v53 = nil
        if p_u_49.interior_name == v_u_52.model_name and v_u_10.Dictionary.equals(p_u_49.props.active_addons, p_u_50.active_addons) then
            v53 = p_u_49.interior
        else
            p_u_49:delete_blueprint()
        end
        p_u_49.interior = v53 or v_u_3.promise_download_copy("Interiors", v_u_52.model_name):expect()
        p_u_49.interior.Name = p_u_49.props.player and p_u_49.props.player.Name or ""
        p_u_49.interior_name = v_u_52.model_name
        if not v53 then
            v_u_6.apply_addons_to_interior(p_u_49.interior, v_u_52, p_u_49.props.active_addons)
        end
        p_u_49:format_interior()
        p_u_49:add_textures()
        p_u_49.revert_water = v_u_7.add_housing_terrain_water(p_u_49.interior, CFrame.new(p_u_49.props.house_pos))
        p_u_49.interior.Parent = p_u_49.folder
        v_u_48:signal()
    end)
end
function v11.Blueprint.shouldUpdate(p54, p55, _)
    return p54.props.textures_hash ~= p55.textures_hash and true or (p54.props.building_type ~= p55.building_type and true or (p54.props.player ~= p55.player and true or (p54.props.house_pos ~= p55.house_pos and true or (p54.props.texture_preview ~= p55.texture_preview and true or (p54.props.house_id ~= p55.house_id and true or not v_u_10.Dictionary.equals(p54.props.active_addons, p55.active_addons))))))
end
v11.Blueprint.didUpdate = v11.Blueprint.update_blueprint
v11.Blueprint.didMount = v11.Blueprint.update_blueprint
function v11.Blueprint.willUnmount(p_u_56)
    spawn(function()
        v_u_48:wait()
        p_u_56:delete_blueprint()
        v_u_48:signal()
    end)
end
function v11.Blueprint.render(p_u_57)
    return v_u_12("Folder", {
        [v_u_2.Ref] = function(p58)
            p_u_57.folder = p58
        end
    })
end
return v11