--// ReplicatedStorage.new.modules.Ailments.Helpers.AilmentsFurnitureHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_2 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_3 = v_u_2("FurnitureDB")
local v_u_4 = v_u_2("FurnitureUseDB")
local v_u_5 = game:GetService("RunService")
local v_u_35 = {
    ["is_furniture_valid"] = function(p6, p7, p8)
        local v9 = v_u_3[p6]
        local v10 = v_u_35.get_behavior_from_kind(p6, p8)
        local v11 = not v9.team_whitelist and true or v_u_1.List.find(v9.team_whitelist, "Pets") ~= nil
        local v12
        if v10 then
            v12 = v10.interaction_locking ~= nil
        else
            v12 = false
        end
        local v13 = v10 and v10.ailment_to_boost
        if v13 then
            if v10.ailment_to_boost[1] == p7 then
                if v11 then
                    v11 = not v12
                end
            else
                v11 = false
            end
        else
            v11 = v13
        end
        return v11
    end,
    ["is_furniture_model_valid"] = function(p14, p15)
        local v16 = p14:GetAttribute("furniture_kind")
        if v16 then
            return v_u_35.is_furniture_valid(v16, p15, p14)
        else
            return false
        end
    end,
    ["find_furniture_position"] = function(p_u_17)
        local v18 = v_u_5:IsClient()
        assert(v18, "client only")
        local v19 = v_u_2("FurnitureModelTracker")
        local v20 = v_u_2("new:NavigationHelper")
        local v21 = v19.get_furniture_models_list()
        return v20.find_closest_valid_point(v21, function(p22)
            if p22 then
                return v_u_35.is_furniture_model_valid(p22, p_u_17)
            end
        end, function(p23)
            return p23.PlacementBlock.CFrame.Position
        end)
    end,
    ["furniture_exists_in_current_interior"] = function(p24)
        return v_u_35.find_furniture_position(p24) ~= nil
    end,
    ["get_behavior_from_kind"] = function(p25, p26)
        local v27 = v_u_3[p25]
        if not v27 then
            if v_u_5:IsServer() then
                v_u_2("ErrorLog").log({
                    ["origin"] = "AilmentsFurnitureHelper.get_behavior_from_kind",
                    ["error"] = ("No furniture entry exists for furniture kind %*."):format(p25)
                })
            end
            return nil
        end
        local v28 = v_u_4[p25]
        if not v28 then
            local v29 = p26 or game.ServerStorage.Downloadable.Furniture:FindFirstChild(v27.model_name)
            assert(v29, ("Furniture entry %s does not have a model."):format(p25))
            local v30 = v29:FindFirstChild("UseBlocks")
            for _, v31 in not v30 and {} or v30:GetChildren() do
                local v32 = v31:FindFirstChild("Configuration")
                local v33
                if v32 then
                    v33 = v32:FindFirstChild("use_id")
                else
                    v33 = nil
                end
                local v34
                if v33 then
                    v34 = v33.Value
                else
                    v34 = nil
                end
                v28 = v_u_4[v34]
                if v28 then
                    break
                end
            end
        end
        return v28
    end
}
return v_u_35