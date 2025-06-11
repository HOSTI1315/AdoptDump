--// ReplicatedStorage.ClientDB.DynamicLocationDB (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("LiveOpsMapSwap")
local v_u_3 = v_u_1("TerrainHelper")
local v_u_4 = v_u_1("TerrainWaterDB")
local v_u_5 = v_u_1("ClientData")
local v_u_6 = v_u_1("HouseDB")
local v_u_7 = v_u_1("Debug").create_log()
local v_u_8 = v_u_1("package:Sift")
local function v_u_26(p9, p10)
    local v11 = v_u_1("ClientStore")
    local v12 = v_u_1("DownloadClient")
    local v13 = v11.store:getState().house_exteriors or {}
    local v14 = nil
    for _, v15 in pairs(v13) do
        if p9 and v15.player_name == p9.Name then
            v14 = v15
            break
        end
    end
    local v16 = v_u_2.get_full_interior_name("Neighborhood")
    if v14 == nil or v14.plot_parent == nil then
        local v17 = v12.download("Interiors", v16)
        return v17, v17.Doors.MainDoor, "Neighborhood"
    end
    local v18 = v14.plot_parent
    local v19 = v_u_2.get_full_interior_name(v18)
    local v20 = v12.download("Interiors", v19)
    v11.store:dispatch({
        ["type"] = "update_loaded_plots",
        ["plots"] = v20.Plots:GetChildren()
    })
    wait(0.1)
    local v21 = nil
    for _, v22 in pairs(workspace:WaitForChild("HouseExteriors"):GetChildren()) do
        local v23 = v22:GetChildren()[1]
        local v24
        if v23 then
            v24 = v23:FindFirstChild("Doors")
        else
            v24 = v23
        end
        if v24 then
            v24 = v24:GetChildren()[1]
        end
        if v24 then
            v24 = v24.WorkingParts.Configuration
        end
        if v24 and (p9 and game.Players:FindFirstChild(v24.house_owner.Value or "") == p9) then
            v21 = v23
        end
    end
    if v21 ~= nil then
        return v20, v21.Doors:FindFirstChild(p10) or v21.Doors.MainDoor, v18
    end
    v12.release("Interiors", v18)
    local v25 = v12.download("Interiors", v16)
    return v25, v25.Doors.MainDoor, "Neighborhood"
end
local function v_u_29(p27)
    local v28 = v_u_1("ClientStore")
    if v28.store:getState().house_editor_state ~= p27 then
        v28.store:dispatch({
            ["type"] = "set_house_edit_mode",
            ["value"] = p27
        })
    end
end
local v62 = {
    ["housing"] = {
        ["dynamic_location"] = function(p_u_30)
            local v31 = v_u_1("RouterClient")
            local v_u_32 = v_u_1("ClientStore")
            local v33 = v_u_1("DownloadClient")
            local v_u_34 = v_u_1("HouseClient")
            local v35 = v_u_1("Maid")
            v31.get("HousingAPI/SubscribeToHouse"):FireServer(p_u_30.house_owner)
            if p_u_30.house_owner == game.Players.LocalPlayer then
                v_u_29("Main")
            else
                local function v_u_39()
                    local v36 = v_u_34.can_edit_current_house()
                    local v37 = v_u_34.is_current_house_listed_for_trade()
                    local v38 = v_u_32.store:getState()
                    if v36 then
                        if v38.house_editor_state == "Disabled" or v38.house_editor_state == "ViewingListedHouse" then
                            v_u_29("Main")
                            return
                        end
                    else
                        if v37 then
                            v_u_29("ViewingListedHouse")
                        else
                            v_u_29("Disabled")
                        end
                        v_u_1("UIManager").apps.HouseEditorWrapperApp:clear_drawer()
                    end
                end
                p_u_30.house_maid = v35.new()
                p_u_30.house_maid.housing_coop = v_u_34.housing_coop_changed:Connect(function(p40, _, _)
                    if p40 == p_u_30.house_owner then
                        v_u_39()
                    end
                end)
                p_u_30.house_maid.interior_house = v_u_34.house_interior_changed:Connect(function(_, _, _)
                    v_u_39()
                end)
                v_u_39()
            end
            local v41 = game.Players.LocalPlayer.Character
            local v42 = tick()
            while true do
                local v43 = workspace:WaitForChild("HouseInteriors"):WaitForChild("blueprint"):GetChildren()[1]
                if v43 and (v43.Name == p_u_30.house_owner.Name or tick() - v42 > 20) or (v41 ~= game.Players.LocalPlayer.Character or (p_u_30.house_owner == nil or p_u_30.house_owner.Parent == nil)) then
                    break
                end
                v_u_7("waiting for housing to be downloaded")
                task.wait()
            end
            if v41 ~= game.Players.LocalPlayer.Character or (p_u_30.house_owner == nil or p_u_30.house_owner.Parent == nil) then
                local v44 = v_u_2.get_full_interior_name("Neighborhood")
                local v45 = v33.download("Interiors", v44)
                return v45, v45.Doors.MainDoor, "Neighborhood"
            end
            local v46 = workspace:WaitForChild("HouseInteriors"):WaitForChild("blueprint"):GetChildren()[1]
            local v47 = v46.Doors:FindFirstChild(p_u_30.destination_door_id) or v46.Doors.MainDoor
            for _, v48 in ipairs(v46.Doors:GetChildren()) do
                local v49 = v48.WorkingParts.Configuration
                local v50 = v49:FindFirstChild("door_connects_to_elsewhere_in_house")
                if v50 and v50.Value == true then
                    local v51 = v49:FindFirstChild("house_owner")
                    if not v51 then
                        v51 = Instance.new("StringValue")
                        v51.Name = "house_owner"
                        v51.Parent = v49
                    end
                    v51.Value = p_u_30.house_owner.Name
                end
            end
            local v52 = v_u_6[(v_u_5.get("house_interior") or {}).building_type] or {}
            v_u_3.set_terrain_properties(v_u_8.Dictionary.merge(v_u_4.housing_default, v52.terrain_properties or {}))
            if v52.render then
                if not p_u_30.house_maid then
                    p_u_30.house_maid = v35.new()
                end
                v52.render(v46, p_u_30.house_maid)
            end
            return v46, v47
        end,
        ["cleanup"] = function(p53, p54, p55)
            local v56 = v_u_1("ClientStore")
            local v57 = v_u_1("RouterClient")
            local v58 = p53 or {}
            local v59 = p55 or {}
            v56.store:dispatch({
                ["type"] = "set_house_edit_mode",
                ["value"] = "Disabled"
            })
            v_u_1("UIManager").apps.HouseEditorWrapperApp:clear_drawer()
            if v58.house_maid then
                v58.house_maid:Destroy()
            end
            if v58.house_owner ~= v59.house_owner or p54 ~= "housing" then
                v57.get("HousingAPI/UnsubscribeFromHouse"):InvokeServer(v58.house_owner)
                v_u_7("Unsubscribed from house!")
            end
        end
    },
    ["exit_housing"] = {
        ["dynamic_location"] = function(p60)
            return v_u_26(p60.house_owner, p60.destination_door_id)
        end
    },
    ["exit_housing_preview"] = {
        ["dynamic_location"] = function(p61)
            return v_u_26(game.Players.LocalPlayer, p61.destination_door_id)
        end
    }
}
return v62