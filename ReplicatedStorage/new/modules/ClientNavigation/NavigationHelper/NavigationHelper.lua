--// ReplicatedStorage.new.modules.ClientNavigation.NavigationHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v_u_2 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_3 = require(script.Parent.Parent.LegacyLoad)("ClientData")
local v_u_40 = {
    ["find_closest_valid_point"] = function(p4, p_u_5, p_u_6)
        local v_u_7 = nil
        local v8 = game.Players.LocalPlayer.Character
        if v8 then
            v8 = v8:FindFirstChild("HumanoidRootPart")
        end
        if v8 then
            v8 = v8.Position
        end
        local v_u_9 = v8 or Vector3.new(0, 0, 0)
        local v13 = v_u_2.List.reduce(p4, function(p10, p11)
            if p_u_5(p11) then
                local v12 = (v_u_9 - p_u_6(p11)).Magnitude
                if not v_u_7 or v12 < v_u_7 then
                    v_u_7 = v12
                    return p11
                end
            end
            return p10
        end, nil)
        if p_u_5(v13) then
            return p_u_6(v13)
        else
            return nil
        end
    end,
    ["find_closest_interior"] = function(p_u_14)
        if #p_u_14 > 1 then
            local v_u_15 = {}
            local v_u_16 = {}
            local v17 = game.Players.LocalPlayer.Character
            if v17 then
                v17 = v17:FindFirstChild("HumanoidRootPart")
            end
            if v17 then
                v17 = v17.Position
            end
            local v_u_18 = v17 or Vector3.new(0, 0, 0)
            local v25 = v_u_2.List.map(p_u_14, function(p_u_19)
                local v20 = require(script.Parent.NavigationTargetProvider)
                local v_u_21
                if p_u_19 == "housing" then
                    local v22 = v20.new
                    local v23 = {
                        ["destination_interior"] = {
                            ["destination_id"] = p_u_19,
                            ["destination_house_owner"] = game.Players.LocalPlayer
                        }
                    }
                    v_u_21 = v22(v23)
                else
                    v_u_21 = v20.new({
                        ["destination_interior"] = p_u_19
                    })
                end
                return v_u_21:start():andThen(function()
                    v_u_15[p_u_19] = #v_u_21.path
                    local v24 = v_u_21:get_target_position()
                    if v24 then
                        v_u_16[p_u_19] = (v24 - v_u_18).Magnitude
                    else
                        v_u_16[p_u_19] = (1 / 0)
                    end
                end):done(function()
                    v_u_21:destroy()
                end)
            end)
            v_u_1.all(v25):andThen(function()
                table.sort(p_u_14, function(p26, p27)
                    if v_u_15[p26] == v_u_15[p27] then
                        if v_u_16[p26] == v_u_16[p27] then
                            return p26 < p27
                        else
                            return v_u_16[p26] < v_u_16[p27]
                        end
                    else
                        return v_u_15[p26] < v_u_15[p27]
                    end
                end)
            end):expect()
        end
        local v28 = p_u_14[1]
        return v28 == "housing" and {
            ["destination_id"] = v28,
            ["destination_house_owner"] = game.Players.LocalPlayer
        } or v28
    end,
    ["get_house_location_for_player"] = function(p29)
        local v30 = p29.Name
        local v31 = v_u_3.get("house_exteriors") or {}
        for _, v32 in pairs(v31) do
            if v32.player_name == v30 then
                return v32.plot_parent
            end
        end
        return nil
    end,
    ["get_house_exterior_for_player"] = function(p33)
        local v34 = p33.Name
        for _, v35 in workspace.HouseExteriors:GetChildren() do
            local v36 = v35:GetChildren()[1]
            if v36 then
                v36 = v36:FindFirstChild("MainDoor", true)
            end
            if v36 then
                local v37 = v36.WorkingParts.Configuration:FindFirstChild("house_owner")
                if v37 and v37.Value == v34 then
                    return v35
                end
            end
        end
        return nil
    end,
    ["get_house_exterior_main_door_for_player"] = function(p38)
        local v39 = v_u_40.get_house_exterior_for_player(p38)
        if v39 then
            return v39:GetChildren()[1]:FindFirstChild("MainDoor", true)
        else
            return nil
        end
    end
}
return v_u_40