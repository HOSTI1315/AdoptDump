--// ReplicatedStorage.ClientModules.Core.InteriorsM.Location (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("LiveOpsMapSwap")
local v_u_3 = v_u_1("DownloadClient")
local v_u_4 = v_u_1("ClientStore")
local v_u_5 = v_u_1("PlatformM")
local v6 = v_u_1("Class")
local v_u_7 = v_u_1("DynamicLocationDB")
local v_u_8 = v_u_1("InteriorsDB")
local v_u_9 = v_u_1("ClientData")
local v_u_10 = v_u_1("HouseDB")
local v_u_11 = v_u_1("TerrainHelper")
local v_u_12 = v_u_1("TerrainWaterDB")
local v_u_13 = v_u_1("package:Sift")
local v_u_14 = game:FindFirstChild("NetworkClient")
local v_u_15 = workspace:WaitForChild("interior_occupants")
local v16 = v6("Location")
function v16.__init(p17, p18, p19, p20)
    local v21 = p20 or {}
    v_u_11.set_terrain_properties(v_u_12.default)
    p17.house_owner = v21.house_owner
    p17.destination_id = p18
    p17.destination_door_id = p19
    local v22 = v21.exiting_door
    if v22 then
        v22 = v21.exiting_door.Name
    end
    p17.exiting_door_id = v22
    p17.sub_destination_id = nil
    p17.full_destination_id = p18
    local v23 = v_u_7[p17.destination_id]
    if v23 and v23.dynamic_location then
        local v24, v25, v26 = v23.dynamic_location(p17)
        p17.interior = v24
        p17.door = v25
        if v26 then
            p17.destination_id = v26
            p17.full_destination_id = v26
            if v_u_2.is_a_swappable_interior_name(p17.destination_id) then
                p17.sub_destination_id = v_u_2.get_current_map_type()
                p17.full_destination_id = p17.destination_id .. "!" .. p17.sub_destination_id
            end
            if v23.cleanup then
                v23.cleanup(p17)
            end
        end
    else
        if v_u_2.is_a_swappable_interior_name(p17.destination_id) then
            p17.sub_destination_id = v_u_2.get_current_map_type()
            p17.full_destination_id = p17.destination_id .. "!" .. p17.sub_destination_id
        end
        p17.interior = v_u_3.download("Interiors", p17.full_destination_id)
        p17.door = p17.interior.Doors:FindFirstChild(p19) and p17.interior.Doors[p19] or p17.interior.Doors:GetChildren()[1]
    end
    if not p17.interior:IsDescendantOf(workspace:WaitForChild("HouseInteriors")) then
        p17.interior.Parent = workspace:WaitForChild("Interiors")
    end
    v_u_4.store:dispatch({
        ["type"] = "update_loaded_plots",
        ["plots"] = p17.interior:FindFirstChild("Plots") and (p17.interior.Plots:GetChildren() or {}) or {}
    })
    if v_u_14 then
        p17.interior_occupants_folder = v_u_15[p17.destination_id == "housing" and p17.destination_id .. "!" .. p17.house_owner.Name or p17.full_destination_id]
        p17.interior_occupants_folder.Parent = workspace
    end
    local v27 = v_u_8[string.match(p17.full_destination_id, "(.+)::") or p17.full_destination_id] or {}
    if p17.full_destination_id == "housing" then
        local v28 = v_u_10[(v_u_9.get("house_interior") or {}).building_type] or {}
        local v29 = v28.id
        if v29 then
            v29 = v_u_8["housing!" .. v28.id]
        end
        v27 = v29 or v27
    end
    if v27.interactions then
        p17.interactions = v27.interactions(p17.interior, p17)
    end
    local v30 = v_u_1("MinigameClientManager")
    for _, v31 in v30.get_all() do
        if v31.minigame_destination_id == p17.destination_id then
            local v32 = v31:minigame_interior_interactions(p17.interior, p17)
            if v32 then
                p17.interactions = v_u_13.List.concat(p17.interactions or {}, v32)
            end
        end
    end
    local v33 = v_u_1("ContentPackHelper")
    local v34 = v33.interior_interactions(p17.interior, p17)
    if v34 then
        p17.interactions = v_u_13.List.concat(p17.interactions or {}, v34)
    end
    local v35 = v_u_1("ShopInteriorHelper")
    if p17.interior:FindFirstChild("ShopItems") then
        p17.interactions = p17.interactions or {}
        v35.interaction_shop_items(p17.interior, p17.interactions)
    end
    if v27.render then
        v27.render(p17.interior, p17)
    end
    if p17.interior:FindFirstChild("ShopItems") then
        v35.render_accessory_mannequins(p17.interior)
    end
    for _, v36 in v30.get_all() do
        if v36.minigame_destination_id == p17.destination_id then
            v36:minigame_interior_render(p17.interior, p17)
        end
        if v36.join_zone_destination_id == p17.destination_id then
            v36:join_zone_interior_render(p17.interior, p17)
        end
    end
    v33.interior_render(p17.interior, p17)
    return p17
end
function v16.is_exited(p37)
    return p37.exited == true
end
function v16.exit(p_u_38, p39, p40)
    p_u_38.exited = true
    local v41 = v_u_8[p_u_38.full_destination_id] or {}
    if p_u_38.full_destination_id == "housing" then
        local v42 = v_u_10[(v_u_9.get("house_interior") or {}).building_type] or {}
        local v43 = v42.id
        if v43 then
            v43 = v_u_8["housing!" .. v42.id]
        end
        v41 = v43 or v41
    end
    for _, v44 in pairs(p_u_38.interactions or {}) do
        v44:destroy()
    end
    if v41.cleanup then
        v41.cleanup(p_u_38.interior, p_u_38)
    end
    v_u_1("ShopInteriorHelper").cleanup()
    for _, v45 in v_u_1("MinigameClientManager").get_all() do
        if v45.minigame_destination_id == p_u_38.destination_id then
            v45:minigame_interior_cleanup(p_u_38.interior, p_u_38)
        end
        if v45.join_zone_destination_id == p_u_38.destination_id then
            v45:join_zone_interior_cleanup(p_u_38.interior, p_u_38)
        end
    end
    v_u_1("ContentPackHelper").interior_cleanup(p_u_38.interior, p_u_38)
    local v46 = v_u_7[p_u_38.destination_id]
    if v46 then
        if v46.cleanup then
            v46.cleanup(p_u_38, p39, p40)
        end
    elseif p_u_38.interior.Name == "MainMap" and v_u_5.get_platform() == v_u_5.platform.desktop then
        p_u_38.interior.Parent = workspace
    else
        v_u_3.release("Interiors", p_u_38.interior.Name)
    end
    if v_u_14 then
        local v47, v48 = pcall(function()
            p_u_38.interior_occupants_folder.Parent = v_u_15
        end)
        if not v47 then
            warn("Failed to set parent of occupants folder. Is the interior permanently deleted? Interior:", v_u_15.Name, "Error:", v48)
        end
    end
end
return v16