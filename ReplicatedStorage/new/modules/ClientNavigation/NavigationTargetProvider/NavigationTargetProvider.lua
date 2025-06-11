--// ReplicatedStorage.new.modules.ClientNavigation.NavigationTargetProvider (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v_u_2 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_3 = require(script.Parent.Parent.LegacyLoad)
local v_u_4 = v_u_3("ClientData")
local v_u_5 = v_u_3("Graph")
local v_u_6 = v_u_3("LiveOpsMapSwap")
local v_u_7 = v_u_3("Maid")
local v_u_8 = v_u_3("new:NavigationHelper")
local v_u_9 = v_u_3("RouterClient")
local v_u_10 = v_u_3("Signal")
local v_u_11 = nil
local v_u_12 = nil
local v_u_13 = nil
local v_u_14 = {}
v_u_14.__index = v_u_14
function v_u_14.new(p15)
    local v16 = {
        ["options"] = p15,
        ["destination_id"] = nil,
        ["target_position_changed"] = v_u_10.new(),
        ["path"] = {},
        ["_target_position"] = nil,
        ["_map_graph"] = nil,
        ["_door_links"] = nil,
        ["_maid"] = v_u_7.new(),
        ["_destroyed"] = false
    }
    local v17 = v_u_14
    return setmetatable(v16, v17)
end
function v_u_14.start(p_u_18)
    local v_u_19 = v_u_3("InteriorsM")
    local v20
    if v_u_12 and v_u_13 then
        v20 = v_u_1.resolve()
    else
        if not v_u_11 then
            v_u_11 = v_u_1.try(function()
                local v21, v22 = v_u_9.get("GuideArrowAPI/GetGraph"):InvokeServer()
                v_u_12 = v21
                v_u_13 = v22
            end)
        end
        v20 = v_u_11
    end
    local v37 = v20:andThen(function()
        return v_u_5.new(v_u_2.Dictionary.copyDeep(v_u_12)), v_u_2.Dictionary.copyDeep(v_u_13)
    end):andThen(function(p23, p24)
        p_u_18._map_graph = p23
        p_u_18._door_links = p24
        p_u_18:_add_destination_house_to_map_graph()
        p_u_18.destination_id = p_u_18:_get_destination_id()
        p_u_18.path = p_u_18:_get_path()
        p_u_18:_update_target_position()
        p_u_18._maid:GiveTask(v_u_19.on_location_changed:Connect(function()
            p_u_18:_update_target_position()
        end))
        p_u_18._maid:GiveTask(v_u_4.register_callback("house_exteriors", function(p25, p26, p27)
            if p25 ~= game.Players.LocalPlayer then
                return
            end
            local v28 = p_u_18:get_destination_house_owner()
            local v29 = nil
            local v30 = nil
            local v31 = nil
            local v32 = nil
            for v33, v34 in p26 do
                if v34.player == v28 then
                    v32 = v34.plot_parent
                    v31 = v33
                    break
                end
            end
            for v35, v36 in p27 do
                if v36.player == v28 then
                    v30 = v36.plot_parent
                    v29 = v35
                    break
                end
            end
            if v31 ~= v29 or v32 ~= v30 then
                p_u_18:_add_destination_house_to_map_graph()
                p_u_18:_update_target_position()
            end
        end))
    end)
    p_u_18._maid:GiveTask(v37)
    return v37
end
function v_u_14.get_target_position(p38)
    if p38:is_within_destination_interior() then
        local v39 = p38:_get_destination_position_vector3()
        if v39 ~= p38._target_position then
            p38._target_position = v39
            p38.target_position_changed:Fire(p38._target_position)
        end
    end
    return p38._target_position
end
function v_u_14.get_destination_house_owner(p40)
    local v41 = p40.options.destination_interior
    if typeof(v41) == "function" then
        v41 = v41()
    end
    return typeof(v41) == "table" and (v41.destination_house_owner or v41.house_owner) or game.Players.LocalPlayer
end
function v_u_14.is_within_destination_interior(p42)
    return p42:_find_destination_interior_under_workspace() ~= nil
end
function v_u_14._get_path(p43)
    local v44 = (v_u_3("InteriorsM").get_current_location() or {}).destination_id
    return p43._map_graph:depth_first_search(v44, p43.destination_id)
end
function v_u_14._update_target_position(p_u_45)
    local v46
    if p_u_45:is_within_destination_interior() then
        v46 = p_u_45:_get_destination_position_vector3()
    else
        v46 = nil
    end
    if not v46 then
        local v47 = p_u_45:_get_next_door()
        if not v47 then
            task.delay(0, function()
                if not p_u_45._destroyed then
                    p_u_45:_update_target_position()
                end
            end)
            return p_u_45._target_position
        end
        local v48 = v47:FindFirstChild("TouchToEnter", true)
        local v49 = v48.CFrame
        local v50 = -v48.Size.Y / 2 + 0.5
        v46 = v49 * Vector3.new(0, v50, 0)
    end
    p_u_45._target_position = v46
    p_u_45.target_position_changed:Fire(p_u_45._target_position)
    return p_u_45._target_position
end
function v_u_14._get_next_door(p51)
    local v52 = (v_u_3("InteriorsM").get_current_location() or {}).destination_id
    if v52 == "housing" then
        return p51:_get_house_interior_door()
    end
    local v53 = v_u_2.List.find(p51.path, v52)
    if not v53 then
        p51.path = p51:_get_path()
        v53 = v_u_2.List.find(p51.path, v52)
    end
    if not v53 then
        return nil
    end
    local v54 = p51.path[v53 + 1]
    if v54 then
        local v55 = p51._door_links[v52 .. "-to-" .. v54]
        if typeof(v55) == "function" then
            return v55()
        end
        if typeof(v55) == "string" then
            local v56 = v_u_6.get_full_interior_name(v52)
            local v57 = workspace:WaitForChild("Interiors"):FindFirstChild(v56)
            if v57 then
                v57 = v57.Doors:FindFirstChild(v55)
            end
            return v57
        end
    end
    return nil
end
function v_u_14._add_destination_house_to_map_graph(p_u_58)
    local v59 = p_u_58:_get_destination_house_location()
    p_u_58._map_graph:set_additional_connections_list({
        ["housing"] = { v59 },
        [v59] = { "housing" }
    })
    p_u_58._door_links["housing-to-" .. v59] = function()
        return p_u_58:_get_house_interior_door()
    end
    p_u_58._door_links[v59 .. "-to-housing"] = function()
        return p_u_58:_get_house_exterior_door()
    end
end
function v_u_14._get_house_interior_door(_)
    local v60 = workspace.HouseInteriors.blueprint:GetChildren()[1]
    if v60 then
        return v60.Doors.MainDoor
    else
        return nil
    end
end
function v_u_14._get_house_exterior_door(p61)
    local v62 = p61:get_destination_house_owner()
    return v_u_8.get_house_exterior_main_door_for_player(v62)
end
function v_u_14._get_destination_house_location(p63)
    local v64 = p63:get_destination_house_owner()
    return v_u_8.get_house_location_for_player(v64)
end
function v_u_14._get_destination_id(p65)
    local v66 = p65.options.destination_interior
    if typeof(v66) == "function" then
        v66 = v66()
    end
    if typeof(v66) == "table" then
        v66 = v66.destination_id
    end
    return v66
end
function v_u_14._get_destination_position_vector3(p67)
    local v68 = p67.options.destination_position
    if typeof(v68) == "function" then
        v68 = v68(p67:_find_destination_interior_under_workspace())
    end
    return v68
end
function v_u_14._find_destination_interior_under_workspace(p69)
    local v70 = v_u_6.get_full_interior_name(p69.destination_id)
    if v70 == "housing" then
        return workspace.HouseInteriors.blueprint:FindFirstChild(p69:get_destination_house_owner().Name)
    else
        return workspace.Interiors:FindFirstChild(v70)
    end
end
function v_u_14.destroy(p71)
    p71._maid:DoCleaning()
    p71._destroyed = true
end
return v_u_14